local Character = require("Character")
local Sprite = require("Sprite")
local Plane = {}

Plane.new = function (options)
    local plane = Character.new(options)
    local sprite = Sprite.new("Ships/3")
    plane:insert(sprite)
    plane:enablePhysics()
    return plane
end

return Plane