local Item = require("Item")
local PowerUp = {}
PowerUp.new = function(options)
    local sprites = {"Power-ups/Things/1", "Power-ups/Things/2", "Power-ups/Things/3"}
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
    print("Create item "..spriteName)
    local item = Item.new(spriteName)
    item.level = level
    item.name = "powerup"
    item.power = level

    return item
end
return PowerUp