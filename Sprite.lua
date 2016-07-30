local Sprite = {}

Sprite.sheetInfo = require "sprites.spaceshooterHelper"
Sprite.myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", Sprite.sheetInfo:getSheet() )

Sprite.sheetInfos = {}
Sprite.imageSheets = {}

Sprite.sheetInfos["default"] = Sprite.sheetInfo
Sprite.imageSheets["default"] = Sprite.myImageSheet

Sprite.addSheet = function(name, imgName, sheetInfoName)
    Sprite.imageSheets[name] = require(sheetInfoName)
    Sprite.sheetInfos[name] = graphics.newImageSheet( imgName, Sprite.imageSheets[name] )
end

Sprite.removeSheet = function()
    Sprite.imageSheets[name] = nil
    Sprite.sheetInfos[name] = nil
end

Sprite.getFrameIndex = function(tag, name)
    if not name then
        name = tag
        tag = "default"
    end
    return Sprite.sheetInfos[tag]:getFrameIndex(name)
end

Sprite.new = function(name, options)
    local frames = {}
    if not options then
        options = {}
    end

    local tag = (options and options.tag) or "default"

    if type(name) == "table" then
        for i, frame in ipairs(name) do
            frames[i] = Sprite.getFrameIndex(tag, frame)
        end
    else
        frames={Sprite.getFrameIndex(tag, name)}
    end
    options.frames = frames
    local sprite = display.newSprite( Sprite.myImageSheet , options )
    
    return sprite
end

return Sprite