local gameConfig = require("gameConfig")
local logger = require("logger")
local TAG = "API Helper"
local helper = {}
local json = require("json")
local ADD_RECORD_URL = gameConfig.rankServerUrl.."/zzrank/api/record"
local LEADERBOARD_URL = gameConfig.rankServerUrl.."/zzrank/api/leaderboard"
local PLAYLOG_URL = gameConfig.rankServerUrl.."/zzrank/api/playLog"
local LIKE_URL = gameConfig.rankServerUrl.."/zzrank/api/like"
local LIKECOUNT_URL = gameConfig.rankServerUrl.."/zzrank/api/like/count"
local LAUNCH_LOG_URL = gameConfig.rankServerUrl.."/zzrank/api/log/launch"
local DEV_LOG_URL = gameConfig.rankServerUrl.."/zzrank/api/log/dev"
--local headers = {}
--headers["Content-Type"] = "application/x-www-form-urlencoded"
--headers["Accept-Language"] = "en-US"
function helper:getParamString(params)
  local str = ""
  for k, v in pairs(params) do
    str = str..k.."="..v.."&"
  end
  if string.len(str) > 3 then
    str = string.sub(str, 1, -2)
  end
  logger:debug(TAG, "Params string: "..str)
  return str
end

function helper:apiHandler(options)
  local function handler(event)
    if options and options.onComplete then
      local data = {
        status = 0,
      }

      if event.response and not event.isError then
        data.response = json.decode(event.response)
        if not data.response then
          data.response = {}
        end
      else
        data.response = {}
      end

      if not event.isError and data.response.statusCode == 1 then
        data.success = true
      else
        data.success = false
      end
      options.onComplete(data)
    end
  end
  return handler
end

function helper:addRecord(options)
  network.request(ADD_RECORD_URL, "POST",
    self:apiHandler(options),
    {
      body = self:getParamString({
        levelId = options and options.levelId or "",
        name = options and options.name or "",
        score = options and options.score or "",
        comment = options and options.comment or ""
      })
    }
  )
end

function helper:getRecords()
  network.request(ADD_RECORD_URL, "GET",
    self:apiHandler(options),
    {
    }
  )
end

function helper:addPlayLog(options)
  network.request(PLAYLOG_URL, "POST",
    self:apiHandler(options),
    {
      body = self:getParamString({
        levelId = options and options.levelId or "",
        loginType = options and options.loginType or "",
        userId = options and options.userId or "",
        userName = options and options.userName or "",
        score = options and options.score or "",
        cleared = options and options.cleared or "",
        startTime = options and options.startTime or "",
        duration = options and options.duration or "",
        version = gameConfig.version
      })
    }
  )
end

function helper:getLikeNum(options)
  --print("getLikeNum: ", options and options.levelId or "")
  self:request(LIKECOUNT_URL, "GET", self:apiHandler(options),
  {
      levelId = options and options.levelId or ""
  })
end

function helper:syncLike(options)
  network.request(LIKE_URL, "POST",
    self:apiHandler(options),
    {
      body = self:getParamString({
        levelId = options and options.levelId or "",
        userId = options and options.userId or "",
        loginType = options and options.loginType or "",
        status = options and options.status or "",
        startTime = options and options.startTime or "",
      })
    }
  )
end


function helper:request(url, method, handler, params)
  if method == "GET"then
    if  params then
      url = url.."?"..self:getParamString(params)
    end
    network.request(url, "GET", handler)
  else

  end
  logger:debug(TAG, "Request to %s with method %s", url, method)
end

function helper:getLeaderboard(options)
  self:request(LEADERBOARD_URL, "GET", self:apiHandler(options),
  {
    levelId = options and options.levelId or "",
  })
end

function helper:sendLaunchStatics(options)
  self:request(gameConfig.STATICS_API_URL, "GET", self:apiHandler(options))
end

function helper:luanchLog(options)
  network.request(LAUNCH_LOG_URL, "POST",
    self:apiHandler(options),
    {
      body = self:getParamString({
        devId = gameConfig.devId
      })
    }
  )
end

function helper:devLog(tag, message, options)
  network.request(DEV_LOG_URL, "POST",
    self:apiHandler(options),
    {
      body = self:getParamString({
        devId = gameConfig.devId,
        tag = tag,
        message = message
      })
    }
  )
end

function helper:splunk(message, options)
  --curl -k  https://163.18.26.108:8088/services/collector/event -H "Authorization: Splunk 33D5CAEB-C11B-49CC-8AC9-7E8D910594E9" -d '{"event": "hello world"}'
  --curl -k  http://163.18.26.108:8088/services/collector/event -H "Authorization: Splunk 33D5CAEB-C11B-49CC-8AC9-7E8D910594E9" -d '{"event": "hello world3"}'
  network.request("http://163.18.26.108:8088/services/collector/event", "POST",
    self:apiHandler(options),
    {
      body = string.format('{"event": "%s"}', message),
      headers = {
        ["Authorization"] = "Splunk 33D5CAEB-C11B-49CC-8AC9-7E8D910594E9"
      }
    }
  )
end



return helper
