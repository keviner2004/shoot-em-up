local Item = {}
local GameObject = require("GameObject")
Item.new = function(sprites)
    local item = GameObject.new({
        gtype = "sprite",
        frames = sprites
    })
    item.type = "item"
    item.name = "item"
    item.enabled = true
    item.droppable = true
    item.power = 0
    item.speed = 0

    physics.addBody(item, "dynamic", {
        filter = {
            categoryBits=PHYSIC_CATEGORY_ITEM, 
            maskBits=PHYSIC_CATEGORY_CHARACTER
        }
    })

    function Item:effect(receiver)
        print("Item effect the receiver")
    end

    return item
end

return Item
