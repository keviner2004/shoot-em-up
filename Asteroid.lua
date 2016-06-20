local Enemy = require("Enemy")
local Sprite = require("Sprite")
local Asteroid = {}
local Effect =require("effects.StarExplosion2")
Asteroid.new = function(frames)
    local asteroid = Enemy.new()
    asteroid:insert(Sprite.new(frames))
    asteroid.damage = 9999
    asteroid.hp = 1
    asteroid.score = 1
    return asteroid
end

return Asteroid