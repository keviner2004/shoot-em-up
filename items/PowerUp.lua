local Item = require("Item")
local Sprite = require("Sprite")
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
    local item = Item.new()
    local sprite = Sprite.new(spriteName)
    item:insert(sprite)
    item.level = level
    item.name = "powerup"
    item.score = 20
    item.power = level
    item:enablePhysics()
    return item
end
return PowerUp