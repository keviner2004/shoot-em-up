local Sprite = {}

Sprite.new = function(name, options)
    local frames = {}
    if type(name) == "table" then
        for i, frame in ipairs(name) do
            frames[i] = sheetInfo:getFrameIndex(frame)
        end        
    else
        frames={sheetInfo:getFrameIndex(name)}
    end

    local sprite = display.newSprite( myImageSheet , {frames = frames, time = options and options.time} )
    
    return sprite
end

return Sprite