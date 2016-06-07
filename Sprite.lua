local Sprite = {}

Sprite.getFrameIndex = function(name)
    return sheetInfo:getFrameIndex(name)
end

Sprite.new = function(name, options)
    local frames = {}
    if not options then
        options = {}
    end
    if type(name) == "table" then
        for i, frame in ipairs(name) do
            frames[i] = sheetInfo:getFrameIndex(frame)
        end
    else
        frames={sheetInfo:getFrameIndex(name)}
    end
    options.frames = frames
    local sprite = display.newSprite( myImageSheet , options )
    
    return sprite
end

return Sprite