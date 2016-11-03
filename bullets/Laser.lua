local Bullet = require("Bullet")
local Sprite = require("Sprite")
local Laser = {}

Laser.new = function(options)
    local laser = Bullet.new(options)
    local bulletFrame = Sprite["expansion-6"].new(options.laserFrame or "Lasers/1")
    laser:insert(bulletFrame)
    laser:enablePhysics()
    return laser
end

return Laser