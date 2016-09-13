local sqlite3 = require( "sqlite3" )
local logger = require("logger")
local gameConfig = require("gameConfig")
local apiHelper = require("apiHelper")
local util = require("util")
local TAG = "Helper"
local path = system.pathForFile( "spaceshooter.db", system.DocumentsDirectory )
logger:info(TAG, "DB store in %s", path)

local helper = {}

function helper:open()
    self.db = sqlite3.open(path)
end

function helper:exec(sql, params)
    logger:info(TAG, "exec sql %s", sql)
    local errorFlag = false
    local result = {}
    self:open()
    local stmt = self.db:prepare(sql)
    if not stmt then
        logger:error(TAG, "DB Error %s", self.db:errmsg())
        errorFlag = true
    end
    if not errorFlag then
        if params then
            for i = 1, #params do
                stmt:bind(i, params[i])
                logger:info(TAG, "bind %d: %s", i, params[i])
            end
        end
        for row in stmt:nrows() do
            result[#result + 1] = row
        end
        --stmt:step()
        stmt:finalize()
    end
    self:close()
    return result
end

function helper:getCurrentVersion()
    local result = self:getInfo("dbVersion")
    return result
end

function helper:upgrade()
    --force upgrade
    local currentVersion = self:getCurrentVersion()
    logger:info(TAG, "Current version is %s", currentVersion)
    if currentVersion ~= gameConfig.dbVersion then
        logger:info(TAG, "Version not match, reconstruct db")
        self:dropAll()
        self:init()
        self:updateInfo("dbVersion", gameConfig.dbVersion)
    else
        logger:info(TAG, "Version match! Skip upgrade")
        return
    end
end

function helper:getInfo(name)
    local result = self:exec(
        [[
            SELECT value FROM info WHERE name = ?;
        ]],
        {
            name
        }
    )
    return (result[1] and result[1].value) or ""
end

function helper:getAutoSignIn()
  local enable = self:getInfo("autoSignIn")
  if enable == "true" then
    enable = true
  else
    enable = false
  end
  return enable
end

function helper:enableAutoSignIn(enable)
  if enable == nil or enable == true then
    enable = "true"
  else
    enable = "false"
  end
  return self:updateInfo("autoSignIn", enable)
end


function helper:setLoginType(value)
  self:updateInfo("loginType", value)
end

function helper:getLoginType()
  return self:getInfo("loginType")
end

function helper:setUserId(value)
  self:updateInfo("userId", value)
end

function helper:getUserId()
  return self:getInfo("userId")
end

function helper:updateInfo(name, value)
    self:exec([[
        INSERT OR REPLACE INTO info (name, value) values (?, ?);
    ]], {
        name, value
    })
end

function helper:dropAll()
    self:exec("DROP TABLE rank;")
    self:exec("DROP TABLE info;")
    self:exec("DROP TABLE like;")
    self:exec("DROP TABLE likeRequest;")
    self:exec("DROP TABLE playLog;")
end

function helper:init()
    --INIT TABLES
    --Table rank
    self:exec([[
      CREATE TABLE IF NOT EXISTS rank (id INTEGER PRIMARY KEY, name TEXT, type TEXT, levelId TEXT, score INTEGER, cdate DATETIME DEFAULT CURRENT_TIMESTAMP, mdate DATETIME DEFAULT CURRENT_TIMESTAMP, sdate DATETIME DEFAULT CURRENT_TIMESTAMP);
    ]])
    --Table info
    self:exec([[
      CREATE TABLE IF NOT EXISTS info (name TEXT PRIMARY KEY, value TEXT);
    ]])

    --Table like
    self:exec([[
      CREATE TABLE IF NOT EXISTS like (levelId TEXT PRIMARY KEY, num INTEGER, cdate DATETIME DEFAULT CURRENT_TIMESTAMP, mdate DATETIME DEFAULT CURRENT_TIMESTAMP, sdate DATETIME DEFAULT CURRENT_TIMESTAMP);
    ]])

    --Table like request
    self:exec([[
      CREATE TABLE IF NOT EXISTS likeRequest (levelId TEXT, userId TEXT, loginType TEXT, status INTEGER, synced BOOLEAN, cdate DATETIME DEFAULT CURRENT_TIMESTAMP, mdate DATETIME DEFAULT CURRENT_TIMESTAMP, sdate DATETIME DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (levelId, userId, loginType));
    ]])

    --[[
      Level workflow
      create playId -> play -> gameover -> update play log
    --]]
    --Table playLog
    self:exec([[
      CREATE TABLE IF NOT EXISTS playLog (id INTEGER PRIMARY KEY, levelId TEXT, userName TEXT, userId TEXT, loginType TEXT, score INTEGER, startTime DATETIME DEFAULT CURRENT_TIMESTAMP, duration INTEGER, cleared BOOLEAN, cdate DATETIME DEFAULT CURRENT_TIMESTAMP, mdate DATETIME DEFAULT CURRENT_TIMESTAMP, sdate DATETIME DEFAULT CURRENT_TIMESTAMP, synced BOOLEAN);
    ]])

    if self:getInfo("userId") == "" then
      self:updateInfo("userId", "anonymous")
    end

    if self:getInfo("loginType") == "" then
      self:updateInfo("loginType", "none")
    end

    logger:info(TAG, "inited")


end

function helper:getLike(levelId)
  local result = self:exec([[
    SELECT * FROM like WHERE levelId = ?
  ]],
  {levelId})
  return result[1]
end

function helper:getNumOfLikes(levelId)
  local like = self:getLike(levelId)
  if like then
    return like.num
  end
  return 0
end

function helper:changeNumOfLikes(levelId, offset)
  local num = self:getNumOfLikes(levelId)
  num = num + offset
  if num < 0 then
    num = 0
  end
  self:updateLike(levelId, num)
end

function helper:updateLike(levelId, num)
  local date = util.getCurrentDate()
  self:exec([[
    INSERT OR REPLACE INTO like (levelId, num, mdate) values (?, ?, ?);
  ]], {
    levelId, num, date
  })
end

function helper:isLike(levelId)
  local likeRequest = self:getLikeRequest(levelId)
  if likeRequest and likeRequest.status > 0 then
    return true
  else
    return false
  end
end

function helper:like(levelId)
  self:updateLikeRequest(levelId, 1)
end

function helper:disLike(levelId)
  self:updateLikeRequest(levelId, 0)
end

function helper:getLikeRequest(levelId, options)
  local userId = (options and options.userId) or self:getUserId()
  local loginType = (options and options.loginType) or self:getLoginType()
  local result = self:exec([[
    SELECT * FROM likeRequest WHERE levelId = ? AND userId = ? AND loginType = ?
  ]], {
    levelId, userId, loginType
  })
  if #result > 0 then
    return result[1]
  else
    return nil
  end
end

function helper:updateLikeRequest(levelId, liked)
  local userId = self:getUserId()
  local loginType = self:getLoginType()
  local date = util.getCurrentDate()
  self:exec([[
    INSERT OR REPLACE INTO likeRequest (levelId, userId, loginType, status, synced, mdate) values (?, ?, ?, ?, ?, ?);
  ]], {
    levelId, userId, loginType, liked, 0, date
  })
end

function helper:markLikeRequest(levelId, userId, loginType)
  local result = self:exec([[
    UPDATE likeRequest SET synced = ?, sdate = ? WHERE levelId = ? AND userId = ? AND loginType = ?;
  ]], {
    1, util.getCurrentDate(), levelId, userId, loginType
  })
end

function helper:getPlayLog(playId)
  local result = self:exec([[
    SELECT * FROM playLog WHERE id = ?
  ]], {
    playId
  })
  if #result == 0 then
    return nil
  else
    return result[1]
  end
end

function helper:getLastPlayLogId(playId)
  local result = self:exec([[
    SELECT * FROM playLog WHERE id = (SELECT MAX(id) FROM playLog);
  ]])
  if #result == 0 then
    return nil
  else
    return result[1].id
  end
end

function helper:addPlayLog(levelId)
  local userName = self:getInfo("userName")
  local userId = self:getInfo("userId")
  local loginType = self:getInfo("loginType")
  self:exec([[
      INSERT INTO playLog (levelId, userName, userId, loginType, score, duration, cleared, synced) values (?, ?, ?, ?, ?, ?, ?, ?);
  ]], {
    levelId, userName, userId, loginType, 0, 0, 0, 0
  })
  local playId = self:getLastPlayLogId()
  if not playId then
    logger:error(TAG, "Play id not found")
  end
  self:reducePlayLoge()
  return playId
end

function helper:reducePlayLoge()
  self:exec(
    [[
      DELETE FROM playLog WHERE ROWID IN (SELECT ROWID FROM playLog ORDER BY ROWID DESC LIMIT -1 OFFSET ?)
    ]]
  , {
    gameConfig.MAX_PLAY_LOGS
  })
end

function helper:syncPlayLogs()
  local result = self:exec([[
    SELECT * FROM playLog WHERE synced = 0 AND duration > 0;
  ]])
  for i = 1, #result do
    local id = result[i].id
    apiHelper:addPlayLog({
      levelId = result[i].levelId,
      loginType = result[i].loginType,
      userId = result[i].userId,
      userName = result[i].userName,
      score = result[i].score,
      cleared = result[i].cleared,
      startTime = result[i].startTime,
      duration = result[i].duration,
      onComplete = function(event)
        if event.success then
          self:updatePlayLog(id, {
            synced = 1
          })
        end
      end
    })
  end
end

function helper:syncLikeRequest()
  local result = self:exec([[
    SELECT * FROM likeRequest WHERE synced = 0;
  ]])
  for i = 1, #result do
    apiHelper:syncLike({
      levelId = result[i].levelId,
      userId = result[i].userId,
      loginType = result[i].loginType,
      status = result[i].status,
      startTime = result[i].mdate,
      onComplete = function(event)
        if event.success then
          self:markLikeRequest(result[i].levelId, result[i].userId, result[i].loginType)
          self:syncLikeNum(result[i].levelId)
        end
      end
    })
  end
end

function helper:syncLikeNum(levelId)
  apiHelper:getLikeNum({
    levelId = levelId,
    onComplete = function(event)
      if event.success and event.response.count then
        self:updateLike(event.response.count)
      end
    end
  })
end

function helper:getUpdateQuery(tableName, options)
  local queryString = string.format("UPDATE %s SET ", tableName)
  local seperator = ", "
  params = {}
  for k,v in pairs(options) do
    queryString = queryString..k.."= ?"
    queryString = queryString..seperator
    params[#params+1] = v
  end
  queryString = string.sub(queryString, 1, -3)
  return queryString, params
end

function helper:updatePlayLog(playId, options)
  local playLog = self:getPlayLog(playId)
  if not playLog then
    logger:error(TAG, "No log can be update")
    return
  end
  local queryStr, params = self:getUpdateQuery("playLog", options)
  queryStr = queryStr.." WHERE id = ?;"
  params[#params+1]=playId
  self:exec(queryStr, params)
end

function helper:getRecords(stype, levelId, n)
    local result = self:exec(
        [[SELECT * FROM rank WHERE type = ? and levelId = ? ORDER BY score DESC LIMIT ?;]], {
            stype,
            levelId,
            n
        }
    )
    return result
end

function helper:updateRecord(name, levelId, score)
    local newRecord = false
    local localHighScore = self:getHighScore(levelId, "local")
    if score > localHighScore then
        newRecord = true
    end
    self:addRecord(name, score, "local", levelId)
    self:delLastRecords(10, "local", levelId)
    self:syncHighScore(levelId)
    return newRecord
end

function helper:addRecord(name, score, type, levelId)
    self:exec([[INSERT INTO rank (name, score, levelId, type) VALUES (?, ?, ?, ?);]],
    {
        name,
        score,
        levelId,
        type
    })
end

function helper:getUserName()
    local result = self:getInfo("userName")
    return result
end

function helper:getHighScore(levelId, type)
    local result = self:exec([[SELECT MAX(score) AS M FROM rank WHERE levelId = ? and type = ?]],
    {
        levelId,
        type
    })

    if not result[1] then
        return 0
    end

    if not result[1].M then
        return 0
    end

    return result[1].M
end

function helper:updateGlobalData(levelId, options)
    logger:info(TAG, "UpdateGlobalData, it will update the global database")
    --sync score from server
    apiHelper:getLeaderboard({
      levelId = levelId,
      onComplete = function(event)
        if event.success then
          local records = event.response.result
          self:exec("DELETE FROM rank WHERE type = ? AND levelId = ?",{
            "global", levelId
          })
          for i = 1, #records do
            self:addRecord(records[i].name, records[i].score, "global", levelId)
          end
        end
        if options and options.onComplete then
          options.onComplete(event)
        end
      end
    })
    return 0
end

function helper:syncHighScore(levelId)
    local localHighScore = self:getHighScore(levelId, "local")
    local globalHighScore = self:getHighScore(levelId, "global")
    if localHighScore >= globalHighScore then
        self:updateGlobalData(levelId)
    end
end

function helper:delLastRecords(max, type, levelId)
    local result = self:exec([[SELECT COUNT(*) AS c FROM rank WHERE levelId = ? and type = ?]],
        {
            levelId,
            type
        }
    )

    local count = result[1].c

    logger:info(TAG, "current count %d", count)

    if count <= max then
        return
    end

    result = self:exec([[SELECT * FROM rank WHERE levelId = ? and type = ? ORDER BY score DESC LIMIT -1 OFFSET ?]],
        {
            levelId,
            type,
            max
        }
    )
    --delete dummy records
    for i=1, #result  do
        stmt = self:exec([[DELETE FROM rank WHERE id = ?]],
        {
            result[i].id
        })
    end
end

function helper:close()
    self.db:close()
end

return helper
