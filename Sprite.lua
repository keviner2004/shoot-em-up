local M = {}
local logger = require("logger")
local gameConfig = require("gameConfig")
local TAG = "Sprite"

local function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

M.sheetInfos = {}
M.imageSheets = {}
M.multPackTags = {}

M.getFrameIndex = function(tag, name)
    --logger:debug(TAG, "Sprite.getFrameIndex %s, %s", tag, name)
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
        logger:debug(TAG, "!!!!!!!!!!!!! ScaleFactor: %f !!!!!!!!!!!", scaleFactor)
        local suffix = ""
        local currentScale = 0
        for k, v in pairs(gameConfig.imageSuffix) do
            if scaleFactor >= v and v >= currentScale then
                suffix = k
                currentScale = v
            end
        end
        imgName = imgName..suffix..".png"
        sheetInfoName = sheetInfoName..suffix
    end

    logger:debug(TAG, "Add sheet: imgName %s, sheetInfoName %s", imgName, sheetInfoName)

    if isModuleAvailable(sheetInfoName) then
        M.sheetInfos[tag] = require(sheetInfoName)
        M.imageSheets[tag] = graphics.newImageSheet( imgName, M.sheetInfos[tag]:getSheet())
    else
        --multiple pack
        local mIndex = 1
        local imagePrefix = string.sub(imgName, 1, -5)
        M.multPackTags[tag] = {}
        print("Img prefix is ", imagePrefix)
        while true do
            local packSheetInfoName = sheetInfoName.."-"..tostring(mIndex)
            local packImgName = imgName.."-"..tostring(mIndex)..".png"
            local packTag = tag.."-"..tostring(mIndex)
            local isExist = isModuleAvailable(packSheetInfoName)
            print("Check multi pack existing", packTag, packSheetInfoName, packImgName, isExist)
            if not isExist then
                break
            end
            M.sheetInfos[packTag] = require(packSheetInfoName)
            M.imageSheets[packTag] = graphics.newImageSheet( packImgName, M.sheetInfos[tag]:getSheet())
            mIndex = mIndex + 1
        end
        M.multPackTags[tag].num = mIndex - 1
        --multiple pack end
    end

    logger:debug(TAG, "Add sheet: %s, image name: %s, sheet name: %s", tag, imgName, sheetInfoName)
    M[tag] = {}
    M[tag].new = function(name, options)
        local frames = {}
        if not options then
            options = {}
        end
        local _tag = (options and options.tag) or tag

        --multiple pack
        if M.multPackTags[_tag] then
            --find tag
            local i = 0
            local mTag = _tag.."-"..tostring[i]
            local targetMTag = nil
            while M.imageSheets[mTag] do
                if type(name) == "table" then
                    testFrame = name[i]
                else
                    testFrame = name
                end
                if M.getFrameIndex(mTag, testFrame) then
                    targetMTag = mTag
                    break
                end
            end
            if targetMTag then
                _tag = targetMTag
            end
        end
        --multiple pack end

        if type(name) == "table" then
            for i, frame in ipairs(name) do
                frames[i] = M.getFrameIndex(_tag, frame)
            end
        else
            frames={ M.getFrameIndex(_tag, name) }
        end
        options.frames = frames
        --options.loopCount = 0
        --print("newSprite!! "..tag)
        local sprite = display.newSprite( M.getSheet(_tag) , options )

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
        local sprite = display.newSprite( M.getSheet(_tag) , anims )
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
