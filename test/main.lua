local move = require("move")
local myRectangle = display.newRect( 0, 0, 150, 50 )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0.5 )
myRectangle:setStrokeColor( 1, 0, 0 )
move.to(myRectangle, {time = 30, display.contentWidth, display.contentHeight})