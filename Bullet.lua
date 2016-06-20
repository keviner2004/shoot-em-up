local GameObject = require("GameObject")
local move = require("move")
local Bullet = {}
Bullet.new = function(options)
    local bullet = GameObject.new(options)
    bullet:addTag("bullet")
    bullet.isSensor = true
    bullet:belongTo(PHYSIC_CATEGORY_BULLET)

    if options and options.isRocket then
        bullet:belongTo(PHYSIC_CATEGORY_MISSILE)
        bullet:collideWith(PHYSIC_CATEGORY_BULLET)
    else
        bullet:collideWith(PHYSIC_CATEGORY_MISSILE)
    end

    bullet.fireTo = options and options.fireTo
    if options and options.fireTo == "character" then
        --print("fire to ch")
        bullet:collideWith(PHYSIC_CATEGORY_SHIELD)
        bullet:collideWith(PHYSIC_CATEGORY_CHARACTER)
    elseif options and options.fireTo == "enemy" then
        bullet:collideWith(PHYSIC_CATEGORY_ENEMY)
    end

    if options and options.selfCollision then
        --print("collisionSelf bullet")
        bullet:collideWith(self)
    end

    if options and options.wall then
        bullet:collideWith(PHYSIC_CATEGORY_WALL)
    end

    bullet:collideWith(PHYSIC_CATEGORY_ASTEROID)

    bullet:setBody({
        type = "dynamic",
        isSensor = true,
        isBullet = true
    })

    bullet.type = "bullet"
    bullet:setName("bullet")
    bullet.damage = 20
    bullet.owner = options and options.owner
    bullet:enableAutoDestroy()

    bullet.collision = function(self, event)
        --print("collision at "..event.phase..":"..event.x.."x"..event.y)
        print(self.name.." hit "..event.other.name.." with damage: "..self.damage)
        if event.phase == "began" then
            bullet:hit(event)
        end
    end

    function bullet:showDestroyEffect()

    end

    function bullet:playDestroySound()

    end

    function bullet:hit(event)
        print(self.name.." show destroy effect hit 2")
        self:showDestroyEffect()
        
        print(self.name.."play sound hit 2")
        self:playDestroySound()

        print(self.name.." after hit 2")
        self:afterHit()
    end

    function bullet:afterHit(event)
        self:clear()
    end

    return bullet
end

return Bullet