local GameObject = require("GameObject")
local Bullet = {}
Bullet.new = function(options)
    
    local bullet = nil

    if options and options.gtype == "group" then
        print("new group bullet")
        bullet = GameObject.new()
    else
        bullet = GameObject.new({gtype = "sprite", frames = (options and options.frames) or {"Lasers/laserGreen09"}})
    end
    bullet.isSensor = true
    bullet.categoryBits = PHYSIC_CATEGORY_BULLET

    local maskBits = 0

    if options and options.isRocket then
        bullet.categoryBits = PHYSIC_CATEGORY_MISSILE
        maskBits = maskBits + PHYSIC_CATEGORY_BULLET
    else
        maskBits = maskBits + PHYSIC_CATEGORY_MISSILE
    end

    bullet.fireTo = options.fireTo
    if options and options.fireTo == "character" then
        --print("fire to ch")
        maskBits = maskBits + PHYSIC_CATEGORY_CHARACTER
    elseif options and options.fireTo == "enemy" then
        maskBits = maskBits + PHYSIC_CATEGORY_ENEMY
    end

    if options and options.selfCollision then
        print("collisionSelf bullet")
        maskBits = maskBits + bullet.categoryBits
    end

    if options and options.wall then
        maskBits = maskBits + PHYSIC_CATEGORY_WALL
    end

    if not options or (options and not options.disablePhysic) then
        physics.addBody(bullet, "dynamic", { density=1.0, friction=0, bounce=0, isSensor = bullet.isSensor, filter = {categoryBits = bullet.categoryBits, maskBits = maskBits}})
    end
    
    bullet.isBullet = true
    bullet.name = "bullet"
    bullet.type = "bullet"
    bullet.damage = 10

    bullet.preCollision = function(self, event)
        if event.contact then
            print("Disable bullet physic")
            event.contact.isEnabled = false
        end
        bullet:afterHit(event)
    end

    bullet.collision = function(self, event)
        --print("collision at "..event.phase..":"..event.x.."x"..event.y)
        --print("bullet hit "..event.other.name.." with damage: "..self.damage)
        if event.phase == "began" then
            bullet:onHit(event)
            if bullet.isSensor then
                bullet:afterHit(event)
            end
        end
    end

    bullet:addEventListener("collision", bullet)
    bullet:addEventListener("preCollision", bullet)

    function bullet:afterHit(event)
        print("remove self: "..self.name)
        self:removeSelf() 
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