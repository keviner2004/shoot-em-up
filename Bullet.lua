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
        bullet:collideWith(PHYSIC_CATEGORY_CHARACTER)
    elseif options and options.fireTo == "enemy" then
        bullet:collideWith(PHYSIC_CATEGORY_ENEMY)
    end

    if options and options.selfCollision then
        print("collisionSelf bullet")
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
    bullet.name = "bullet"
    bullet.damage = 10
    bullet.owner = options and options.owner
    bullet:enableAutoDestroy()

    bullet.preCollision = function(self, event)
        if event.contact then
            print("Disable bullet physic")
            event.contact.isEnabled = false
        end
        bullet:afterHit(event)
    end

    bullet.collision = function(self, event)
        --print("collision at "..event.phase..":"..event.x.."x"..event.y)
        print(self.name.." hit "..event.other.name.." with damage: "..self.damage)
        if event.phase == "began" then
            bullet:onHit(event)
            print("isSensor ?", bullet.isSensor, bullet.name)
            if bullet.isSensor then
                bullet:afterHit(event)
            end
        end
    end

    bullet:addEventListener("collision", bullet)
    bullet:addEventListener("preCollision", bullet)


    function bullet:afterHit(event)
        print(self.name.." after hit")
        self:clear()
    end

    function bullet:onHit(event)
        --local destroyedBullet = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("Lasers/laserGreen14")}} )
        --destroyedBullet.x, destroyedBullet.y = self:localToContent(event.x, event.y)
        --destroyedBullet.x, destroyedBullet.y = event.x, event.y
        --destroyedBullet.x = self.x
        --destroyedBullet.y = self.y - self.height/2
        --transition.to(destroyedBullet, {time = 50, alpha = 0, onComplete = function()
        --    destroyedBullet:removeSelf()
        --end})
    end

    return bullet
end

return Bullet