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

display.setDefault("background", 52/255, 121/255, 185/255)
display.setStatusBar( display.HiddenStatusBar )
--composer.gotoScene( "scenes.whoAreYou")
composer.gotoScene( "scenes.game")
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
logger:info(TAG, "Screen Ratio: %d / %d : %d, scaleFactor: %f", display.pixelWidth, display.actualContentWidth, display.contentWidth, gameConfig.scaleFactor)
