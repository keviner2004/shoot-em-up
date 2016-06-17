sheetInfo = require "sprites.spaceshooterHelper"
myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", sheetInfo:getSheet() )
display.setStatusBar( display.HiddenStatusBar )
local composer = require( "composer" )
--composer.gotoScene( "leaderBoardScene" , {params = {stype = "local"}})
composer.gotoScene( "scenes.game")
--composer.gotoScene( "newHighScoreScene")

print( "Screen Ratio: "..display.pixelWidth .."/" ..display.actualContentWidth..":".. display.contentWidth..":")