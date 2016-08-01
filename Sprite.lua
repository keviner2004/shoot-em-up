local Sprite = {}
local logger = require("logger")
local TAG = "Sprite"

Sprite.sheetInfo = require "sprites.spaceshooterHelper"
Sprite.myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", Sprite.sheetInfo:getSheet() )

Sprite.sheetInfos = {}
Sprite.imageSheets = {}

Sprite.sheetInfos["default"] = Sprite.sheetInfo
Sprite.imageSheets["default"] = Sprite.myImageSheet

Sprite.addSheet = function(name, imgName, sheetInfoName)
    Sprite.sheetInfos[name] = require(sheetInfoName)
    Sprite.imageSheets[name] = graphics.newImageSheet( imgName, Sprite.sheetInfos[name]:getSheet())
    logger:info(TAG, "Add sheet tag: %s, image name: %s, sheet name: %s", name, imgName, sheetInfoName)
end

Sprite.removeSheet = function()
    Sprite.imageSheets[name] = nil
    Sprite.sheetInfos[name] = nil
end

Sprite.getFrameIndex = function(tag, name)
    --logger:info(TAG, "Sprite.getFrameIndex %s, %s", tag, name)
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
    --options.loopCount = 0

    local sprite = display.newSprite( Sprite.imageSheets[tag] , options )
    
    return sprite
end

return Sprite