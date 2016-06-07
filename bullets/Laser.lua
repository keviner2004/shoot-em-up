local Bullet = require("Bullet")
local Laser = {}

Laser.new = function(options)
    options.frames = "Lasers/1"
    local laser = Bullet.new(options)
    laser:enablePhysic(true)
    return laser
end
return Laser