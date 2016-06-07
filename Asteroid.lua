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

    function asteroid:addPhysic()
        physics.addBody(self, "dynamic", { density=1.0, friction=0, bounce=0, isSensor = true, filter = {categoryBits = PHYSIC_CATEGORY_ASTEROID, maskBits = PHYSIC_CATEGORY_CHARACTER+PHYSIC_CATEGORY_BULLET}})
    end

    function asteroid:onDead()
        self:removePhysic()
        local effect = Effect.new()
        effect.x = self.x
        effect.y = self.y
        self.parent:insert(effect)
        transition.to(self, {time = 300, alpha = 0, onComplete = 
            function()
                self:removeSelf()
            end
        })
    end

    return asteroid
end

return Asteroid