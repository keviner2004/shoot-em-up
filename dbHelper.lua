local sqlite3 = require( "sqlite3" )
local logger = require("logger")
local gameConfig = require("gameConfig")
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
end

function helper:init()
    self:exec([[
      CREATE TABLE IF NOT EXISTS rank (id INTEGER PRIMARY KEY, name TEXT, type TEXT, levelId TEXT, score INTEGER, date DATE DEFAULT CURRENT_DATE);
    ]])
    self:exec([[
      CREATE TABLE IF NOT EXISTS info (name TEXT PRIMARY KEY, value TEXT);
    ]])
    logger:info(TAG, "inited")
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
    local isGothighScore = false
    local localHighScore = self:getHighScore(levelId, "local")
    print("~~~~~~~~~~", score, localHighScore)
    if score > localHighScore then
        isGothighScore = true
    end
    self:addRecord(name, score, "local", levelId)
    self:delLastRecords(10, "local", levelId)
    self:syncHighScore(levelId)
    return isGothighScore
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

function helper:updateGlobalData(levelId)
    logger:info(TAG, "UpdateGlobalData, it will update the global database")
    --sync score from server



    --self:delLastRecords(10, "global", levelId)

    return 0
end

function helper:syncHighScore(levelId)
    local localHighScore = self:getHighScore(levelId, "local")
    local globalHighScore = self:getHighScore(levelId, "global")

    print("HAHAHAHA", localHighScore, globalHighScore)

    if localHighScore >= globalHighScore then
        self:updateGlobalData()
        globalHighScore = self:getHighScore(levelId, "global")
    end

    if localHighScore > globalHighScore then
        --send to server
    end

    return localHighScore
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


