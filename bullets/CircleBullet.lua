local Bullet = require("Bullet")
local gameConfig = require("gameConfig")
local CircleBullet = {}

CircleBullet.new = function(options)
    local bullet = Bullet.new(options)
    local circle = display.newCircle(0, 0, (options and options.radius) or gameConfig.contentWidth*0.03 )
    bullet.name = "circlebullet"
    bullet:insert(circle)
    bullet:enablePhysics()
    return bullet
end

return CircleBullet