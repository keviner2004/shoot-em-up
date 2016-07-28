local config = {}
local Logging = require("Logging")
config.stageSpeed = 200
config.soundOn = true
config.fightBeforeEncounterBoss = 10
config.playerUnstoppable = false
config.debugFPS = true
config.logLevel = Logging.DEBUG
config.debugPhysics = false
config.playerLifes = 3
config.controlType = {"follow", "key"} --both follow 
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
config.numOfPlayers = 1

config.gameLevels = {
    "default.level_boss_1",
    "default.level_1",
    "default.level_2",
    "default.level_3",
    "default.level_4",
    "default.level_5",
    "default.level_bonus",
    --"myLevel.level_custom_enemy" --added level
}

config.version = 0.75

return config