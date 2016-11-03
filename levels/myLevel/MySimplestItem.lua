local gameConfig = require("gameConfig")
local Item = require("Item")
local Sprite = require("Sprite")
local Object = {}
Object.new = function(options)
    local item = Item.new()
    local sprite = Sprite["expansion-1"].new("Items/28")
    
    item.score = 50
    item:insert(sprite)
    item:enablePhysics()

    function item:needKeep(receiver)
        return false
    end

    return item
end
return Object