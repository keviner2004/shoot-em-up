local logger = require("logger")
local capture = require("capture")
local gameConfig = require("gameConfig")
local composer = require( "composer" )
local Sprite = require("Sprite")
local dbHelper = require("dbHelper")
local apiHelper = require("apiHelper")
local TAG = "main"

--init and upgrad data
dbHelper:init()
dbHelper:upgrade()
apiHelper:sendLaunchStatics()
apiHelper:luanchLog()

if gameConfig.remoteLogging then
  local oldPrint = print
  print = function(message, ...)
    apiHelper:devLog("none", string.format(message, ...))
    oldPrint(message, ...)
  end
end
display.setDefault("background", 52/255, 121/255, 185/255)
display.setStatusBar( display.HiddenStatusBar )
--composer.gotoScene( "scenes.whoAreYou")
--composer.gotoScene( "scenes.leaderBoard")
--composer.gotoScene( "scenes.levelSelection")
--composer.gotoScene( "scenes.chapterSelection")
--composer.gotoScene( "scenes.login")
--[[
--composer.showOverlay( "scenes.chapterSelection", {
composer.showOverlay( "scenes.start", {
    isModal = true,
    effect = "fromRight",
    time = 400,
})
--]]

--[[
composer.showOverlay( "scenes.victory", {
    isModal = true,
    effect = "zoomOutIn",
    time = 400,
    params = {
        newRecord = true
    }
})
--]]
--[[
composer.showOverlay( "scenes.gameover", {
    isModal = true,
    effect = "zoomOutIn",
    time = 400,
})
--]]

capture:startCapture()
Sprite.addSheet(gameConfig.SHEET_PIXEL_EFFECT, "sprites/pixeleffect.png", "sprites.pixeleffect")
Sprite.addSheet(gameConfig.SHEET_PIXEL_ITEM, "sprites/pixelitem.png", "sprites.pixelitem")
Sprite.addSheet("expansion-1", "sprites/expansion-1", "sprites.expansion-1")
Sprite.addSheet("expansion-2", "sprites/expansion-2", "sprites.expansion-2")
Sprite.addSheet("expansion-3", "sprites/expansion-3", "sprites.expansion-3")
Sprite.addSheet("expansion-4", "sprites/expansion-4", "sprites.expansion-4")
Sprite.addSheet("expansion-5", "sprites/expansion-5", "sprites.expansion-5")
Sprite.addSheet("expansion-6", "sprites/expansion-6", "sprites.expansion-6")
Sprite.addSheet("expansion-7", "sprites/expansion-7", "sprites.expansion-7")
Sprite.addSheet("expansion-8", "sprites/expansion-8", "sprites.expansion-8")
Sprite.addSheet("expansion-9", "sprites/expansion-9", "sprites.expansion-9")
Sprite.addSheet("tiles", "sprites/tiles.png", "sprites.tiles")
logger:debug(TAG, "Screen Ratio: %d / %d : %d, scaleFactor: %f", display.pixelWidth, display.actualContentWidth, display.contentWidth, gameConfig.scaleFactor)

composer.gotoScene( "scenes.game")

