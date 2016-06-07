local Bullet = require "Bullet"

local BossBullet = {}
BossBullet.new = function()
    local bullet = Bullet.new({
        fireTo = "character",
        frames = {
            "Lasers/29",
        },
        body = function (self)
            return {
                radius = self.contentWidth * 0.5 * 0.5 ,
            }
        end
    })
    bullet.name = "bossBullet"
    bullet:enablePhysic(true)
    return bullet
end


return BossBullet