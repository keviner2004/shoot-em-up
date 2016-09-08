local gameConfig = require("gameConfig")
local helper = {}
local ADD_PLAYLOG_URL = config.rankServerUrl.."/api/playLog"

helper.addPlayLog = function(levelId)
  network.request(ADD_PLAYLOG_URL, "POST")
end

return helper
