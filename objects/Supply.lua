local Enemy = require("Enemy")
local Sprite = require("Sprite")
local Supply = {}

Supply.new = function(options)
    local supply = Enemy.new(options)
    local sprite = Sprite.new("Buildings/1")
    supply:insert(sprite)
    supply:enablePhysics()
    
    --supply:addItem()
    return supply
end

return Supply