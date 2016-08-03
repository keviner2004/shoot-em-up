local Bullet = require("Bullet")
local Laser = {}

Laser.new = function(options)
    options.frames = "Lasers/1"
    local laser = Bullet.new(options)
    laser.name = "laser"
    laser:enablePhysics()
    return laser
end

return Laser