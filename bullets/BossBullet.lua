local Bullet = require "Bullet"
local Sprite = require("Sprite")

local BossBullet = {}
BossBullet.new = function()
    local bullet = Bullet.new({
        fireTo = "character",
    })
    local bulletFrame = Sprite["expansion-6"].new("Lasers/29")
    bullet:insert(bulletFrame)
    bullet.name = "bossBullet"
    bullet:setBody({radius = bullet.contentWidth * 0.5 * 0.5})
    bullet:enablePhysics()
    return bullet
end


return BossBullet