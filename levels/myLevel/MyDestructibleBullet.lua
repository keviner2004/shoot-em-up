local Enemy = require("Enemy")
local Sprite = require("Sprite")
local MyBullet = {}

MyBullet.new = function(options)
    local bullet = Enemy.new(options)
    local sprite = Sprite.new("Missiles/2")
    bullet.hp = 1
    bullet.score = 1
    bullet.name = "bullet"
    bullet:insert(sprite)
    bullet:enablePhysics()
    bullet:autoDestroyWhenInTheScreen()
    return bullet
end

return MyBullet