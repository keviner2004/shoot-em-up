local config = {}
local Logging = require("Logging")
config.stageSpeed = 200
config.soundOn = true
config.fightBeforeEncounterBoss = 5
config.playerUnstoppable = false
config.debugFPS = true
config.logLevel = Logging.DEBUG
config.debugPhysics = false
config.playerLifes = 3
config.controlType = "both" --both follow 
config.rankServerUrl = "http://163.18.2.162"
config.keyUp = "up"
config.keyDown = "down"
config.keyLeft = "left"
config.keyRight = "right"
config.keyConfirm = "enter"
config.keyCancel = "escape"
config.keyP1Top = "up"
config.keyP1Down = "down"
config.keyP1Left = "left"
config.keyP1Right = "right"
config.keyP2Top = "w"
config.keyP2Down = "s"
config.keyP2Left = "a"
config.keyP2Right = "d"

config.gmaeLevles = {
    --"level_bossfight_warning"
    "level_boss_1",
    "level_1",
    "level_2",
    "level_3",
    "level_4",
    "level_5",
    --"level_test"
    "level_bonus"
}

return config