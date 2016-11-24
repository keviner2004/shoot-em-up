local Item = require("Item")
local Sprite = require("Sprite")
local LifeUp = {}
LifeUp.new = function(options)
    local item = Item.new()
    local sprite = Sprite["expansion-9"].new("UI/Cursors/6")
    item.droppbale = false
    item:insert(sprite)
    item.name = "lifeUp"
    item.lifes = 1
    item.score = 20
    item:enablePhysics()

    function item:needKeep(receiver)
        return false
    end

    return item
end
return LifeUp