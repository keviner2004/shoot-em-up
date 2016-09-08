local config = {}
local Logging = require("Logging")
config.stageSpeed = 200
config.soundOn = true
config.fightBeforeEncounterBoss = 10
config.playerUnstoppable = false
config.debugFPS = true
config.logLevel = Logging.INFO
config.debugPhysics = false
config.playerLifes = 2
config.controlType = {"follow", "key"} --both follow
--config.rankServerUrl = "http://163.18.2.162"
config.rankServerUrl = "http://127.0.0.1"
config.keyUp = "up"
config.keyDown = "down"
config.keyLeft = "left"
config.keyRight = "right"
config.keyConfirm = {"enter"}
config.keyCancel = {"escape"}
config.keyP1Top = "up"
config.keyP1Down = "down"
config.keyP1Left = "left"
config.keyP1Right = "right"
config.keyP2Top = "w"
config.keyP2Down = "s"
config.keyP2Left = "a"
config.keyP2Right = "d"
config.numOfPlayers = 1
config.infinite = true
config.SHEET_PIXEL_EFFECT = "pixelEffect"
config.SHEET_PIXEL_ITEM = "pixelItem"
config.contentX = 0
config.contentY = 0
config.contentWidth = display.contentWidth
config.contentHeight = display.contentHeight
config.contentCenterX = config.contentWidth/2
config.contentCenterY = config.contentHeight/2
config.buttonSound = "button"
config.MODE_SINGLE_LEVEL = "singlemode"
config.MODE_INFINITE_LEVEL = "infinitemode"
config.MODE_MULTIPLE_LEVEL = "multiplemode"
config.defaultFont = "kenvector_future_thin"
config.defaultCursor = "UI/Cursors/1"
config.ID_LEVEL_INFINITE = "98163718173"
config.gameLevels = {
    "default.level_boss_1",
    "default.level_1",
    "default.level_2",
    "default.level_3",
    "default.level_4",
    "default.level_5",
    "default.level_bonus",
    "myLevel.level_custom_enemy",
    "myLevel.level_custom_gravity_hole",
    "myLevel.level_custom_item",
    "myLevel.level_seek_1",
    "myLevel.level_transition_2",
    "myLevel.level_path",
    "myLevel.level_curve",
    "myLevel.level_rotate_around",
    "myLevel.level_sinwav",
    --"default.level_test",
}

config.seperateLevels = {
    "default.level_1",
    "default.level_2",
    "default.level_3",
    "default.level_4",
    "default.level_5",
}

config.version = "0.95"
config.dbVersion = "0.24"

config.basicHeight = 640

config.imageSuffix = {
    ["@2x"] = 1.5,
    ["@3x"] = 2.5,
    ["@4x"] = 3.5
}
config.scaleFactor =  config.contentHeight / config.basicHeight
return config
