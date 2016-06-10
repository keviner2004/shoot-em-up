local Bulelt = require("Bullet")

local CircleBullet = {}

CircleBullet.new = function(options)
    local bullet = Bullet.new(options)
    local circle = display.newCircle(0, 0, 5 )
    bullet:insert(circle)
    bullet:enablePhysics()
end

return CircleBullet