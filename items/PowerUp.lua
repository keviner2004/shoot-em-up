local Item = require("Item")
local PowerUp = {}
PowerUp.new = function(options)
    local sprites = {"Power-ups/things_bronze", "Power-ups/things_silver", "Power-ups/things_gold"}
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
    item.name = "powerup"
    item.power = level

    function item:effect(receiver)
        
    end

    return item
end
return PowerUp