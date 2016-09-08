local M = {}
local logger = require("logger")
local gameConfig = require("gameConfig")
local TAG = "Sprite"

M.sheetInfos = {}
M.imageSheets = {}

M.getFrameIndex = function(tag, name)
    --logger:info(TAG, "Sprite.getFrameIndex %s, %s", tag, name)
    if not name then
        name = tag
        tag = "default"
    end
    return M.sheetInfos[tag]:getFrameIndex(name)
end

M.getSheet = function(tag)
    if not tag then
        tag = "default"
    end
    return M.imageSheets[tag]
end

M.addSheet = function(tag, imgName, sheetInfoName)
    local loweImgName = string.lower(imgName)

    if not string.find(loweImgName, ".png") then
        local scaleFactor =  gameConfig.contentHeight / gameConfig.basicHeight
        logger:info(TAG, "!!!!!!!!!!!!! ScaleFactor: %d !!!!!!!!!!!", scaleFactor)
        local suffix = ""
        local currentScale = 0
        for k, v in pairs(gameConfig.imageSuffix) do
            if scaleFactor > v and v > currentScale then
                suffix = k
                currentScale = v
            end
        end
        imgName = imgName..suffix..".png"
        sheetInfoName = sheetInfoName..suffix
    end

    logger:info(TAG, "Add sheet: imgName %s, sheetInfoName %s", imgName, sheetInfoName)

    M.sheetInfos[tag] = require(sheetInfoName)
    M.imageSheets[tag] = graphics.newImageSheet( imgName, M.sheetInfos[tag]:getSheet())
    logger:info(TAG, "Add sheet: %s, image name: %s, sheet name: %s", tag, imgName, sheetInfoName)
    M[tag] = {}
    M[tag].new = function(name, options)
        local frames = {}
        if not options then
            options = {}
        end
        local _tag = (options and options.tag) or tag
        if type(name) == "table" then
            for i, frame in ipairs(name) do
                frames[i] = M.getFrameIndex(_tag, frame)
            end
        else
            frames={M.getFrameIndex(_tag, name)}
        end
        options.frames = frames
        --options.loopCount = 0
        --print("newSprite!! "..tag)
        local sprite = display.newSprite( M.imageSheets[_tag] , options )

        return sprite
    end

    M[tag].newAnimation = function(anims, options)
        local _tag = (options and options.tag) or tag
        local sequence = {}
        for i, v in ipairs(anims) do
            for i = 1, #v.frames do
                v.frames[i] = M.getFrameIndex(_tag, v.frames[i])
            end
        end
        local sprite = display.newSprite( M.imageSheets[_tag] , anims )
        return sprite
    end
end

M.removeSheet = function()
    M.imageSheets[name] = nil
    M.sheetInfos[name] = nil
end

--set default spirte
M.addSheet("default", "sprites/spaceshooter", "sprites.spaceshooter")

M.sheetInfo = M.sheetInfos.default
M.myImageSheet = M.imageSheets.default

--set default method
M.new = M.default.new
M.newAnimation = M.default.newAnimation

return M
