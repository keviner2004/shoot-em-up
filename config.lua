sheetInfo = require "sprites.spaceshooterhelper"
myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", sheetInfo:getSheet() )

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