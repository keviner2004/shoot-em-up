local Bullet = require "Bullet"

local BossBullet = {}
BossBullet.new = function()
    local bullet = Bullet.new({
        fireTo = "character",
        frames = {
            "Boss/Hatch Sequence/f1",
        }
    })
    bullet.name = "bossBullet"
    return bullet
end

return BossBullet