local Bullet = require("Bullet")
local Sprite = require("Sprite")
local Laser = {}

Laser.new = function(options)
    local laser = Bullet.new(options)
    local sprite = Sprite["expansion-6"].new("Lasers/27")
    laser.name = "laser"
    laser:insert(sprite)
    laser:enablePhysics()
    return laser
end

return Laser