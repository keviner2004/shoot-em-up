local Enemy = require("Enemy")
local Sprite = require("Sprite")
local Supply = {}

Supply.new = function()
    local supply = Enemy.new()
    local sprite = Sprite.new("Buildings/1")
    supply:insert(sprite)
    supply:enablePhysics()
    return supply
end

return Supply