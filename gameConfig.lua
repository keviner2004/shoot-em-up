local config = {}
local Logging = require("Logging")
config.stageSpeed = 200
config.soundOn = false
config.fightBeforeEncounterBoss = 5
config.playerUnstoppable = false
config.debugFPS = true
config.logLevel = Logging.DEBUG
config.debugPhysics = false
config.playerLifes = 3
config.rankServerUrl = "http://163.18.2.162"
config.gmaeLevles = {
    --"level_bossfight_warning"
    --"level_boss_1",
    "level_1",
    --"level_2",
    --"level_3",
    --"level_4",
    --"level_5",
    --"level_test"
    --"level_bonus"
}

return config