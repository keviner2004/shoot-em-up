local Enemy = require("Enemy")
local Sprite = require("Sprite")
local Asteroid = {}
Asteroid.new = function(frames)
    local asteroid = Enemy.new()
    asteroid:insert(Sprite["expansion-7"].new(frames))
    asteroid.damage = 9999
    asteroid.hp = 1
    asteroid.score = 1
    return asteroid
end

return Asteroid
