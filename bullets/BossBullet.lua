local Bullet = require "Bullet"

local BossBullet = {}
BossBullet.new = function()
    local bullet = Bullet.new({
        fireTo = "character",
        frames = {
            "Lasers/29",
        },
    })
    bullet.name = "bossBullet"
    bullet:setBody({radius = bullet.contentWidth * 0.5 * 0.5})
    bullet:enablePhysics()
    return bullet
end


return BossBullet