local composer = require( "composer" )
--composer.gotoScene( "leaderBoardScene" , {params = {stype = "local"}})
--composer.gotoScene( "scenes.game")
--composer.gotoScene( "newHighScoreScene")

local lfs = require "lfs"

local doc_path = system.pathForFile( "", system.ResourceDirectory ).."/levels"

for file in lfs.dir(doc_path) do
    -- file is the current file or directory name
    print( "Test found files: " .. file )
end

print( "Screen Ratio: "..display.pixelWidth .."/" ..display.actualContentWidth..":".. display.contentWidth)

local move = require("move")
local myRectangle = display.newRect( 0, 0, 50, 50 )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0.5 )
myRectangle:setStrokeColor( 1, 0, 0 )
move.to(myRectangle, {time = 3000, x = display.contentWidth, y = display.contentHeight})
timer.performWithDelay(1500, function()
    move.slow(myRectangle, 3)
end)
timer.performWithDelay(2500, function()
    move.slow(myRectangle, 1/3)
end)