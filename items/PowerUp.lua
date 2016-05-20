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
    local powerup = Item.new(spriteName)
    powerup.level = level
    powerup.name = "powerup"
    powerup.power = level

    function powerup:effect(receiver)
        --receiver.power = receiver.power + self.level
    end

    return powerup
end
return PowerUp