local Item = require("Item")
local SpeedUp = {}
SpeedUp.new = function(options)
    local sprites = {"Power-ups/bolt_bronze", "Power-ups/bolt_silver", "Power-ups/bolt_gold"}
    local level = 1
    if options and options.level then
        if options.level < 1 then
            level = 1
        elseif options.level > #sprites then
            level = #sprites
        else
            level = options.level
        end
    end
    local spriteName = sprites[level]
    local item = Item.new(spriteName)
    item.level = level
    item.name = "speedup"
    item.speed = level

    function item:effect(receiver)
        
    end

    return item
end
return SpeedUp