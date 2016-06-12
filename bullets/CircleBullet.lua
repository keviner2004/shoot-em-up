local Bullet = require("Bullet")

local CircleBullet = {}

CircleBullet.new = function(options)
    local bullet = Bullet.new(options)
    local circle = display.newCircle(0, 0, options.radius )
    bullet.name = "circlebullet"
    bullet:insert(circle)
    bullet:enablePhysics()
    return bullet
end

return CircleBullet