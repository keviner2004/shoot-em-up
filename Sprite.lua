local Sprite = {}

Sprite.sheetInfo = require "sprites.spaceshooterHelper"
Sprite.myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", Sprite.sheetInfo:getSheet() )


Sprite.getFrameIndex = function(name)
    return Sprite.sheetInfo:getFrameIndex(name)
end

Sprite.new = function(name, options)
    local frames = {}
    if not options then
        options = {}
    end
    if type(name) == "table" then
        for i, frame in ipairs(name) do
            frames[i] = Sprite.sheetInfo:getFrameIndex(frame)
        end
    else
        frames={Sprite.sheetInfo:getFrameIndex(name)}
    end
    options.frames = frames
    local sprite = display.newSprite( Sprite.myImageSheet , options )
    
    return sprite
end

return Sprite