--debug = true

sheetInfo = require "sprites.spaceshooterhelper"
myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", sheetInfo:getSheet() )

rankServerUrl = "http://163.18.2.162"

application =
{
    content =
    {
        width = 900,
        height = 1440,
        scale = "letterbox",
        fps = 60
    }
}