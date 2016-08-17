local Sprite = require("Sprite")
local Item = require("Item")
local ScoreUp = {}
ScoreUp.new = function(options)
    local sprites = {"Ruby/1", "Ruby/2", "Ruby/3", "Ruby/4"}
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
    local sprite = Sprite.new(spriteName)
    item:insert(sprite)
    item.level = level
    item.name = "scoreup"
    item.score = level * 10

    function item:needKeep(receiver)
        return false
    end
    item:enablePhysics()
    return item
end
return ScoreUp