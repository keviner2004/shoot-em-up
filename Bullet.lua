local GameObject = require("GameObject")
local move = require("move")
local Bullet = {}
Bullet.new = function(options)
    local bullet = GameObject.new(options)
    bullet:addTag("bullet")
    bullet.isSensor = true
    bullet.categoryBits = PHYSIC_CATEGORY_BULLET
    bullet.autoDestroy = true
    bullet.maskBits = 0

    if options and options.isRocket then
        bullet.categoryBits = PHYSIC_CATEGORY_MISSILE
        bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_BULLET
    else
        bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_MISSILE
    end

    bullet.fireTo = options and options.fireTo
    if options and options.fireTo == "character" then
        --print("fire to ch")
        bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_CHARACTER
    elseif options and options.fireTo == "enemy" then
        bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_ENEMY
    end

    if options and options.selfCollision then
        print("collisionSelf bullet")
        bullet.maskBits = bullet.maskBits + bullet.categoryBits
    end

    if options and options.wall then
        bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_WALL
    end

    bullet.maskBits = bullet.maskBits + PHYSIC_CATEGORY_ASTEROID
    bullet.isBullet = true
    
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
    
    function bullet:enablePhysic(enable)
        --print("enablePhysic ", enable, self.maskBits)
        if enable or enable == nil then
            self:addPhysic()
        else
            physics.removeBody(self)
        end
    end

    function bullet:addPhysic()
        local body = { density=1.0, friction=0, bounce=0, isSensor = self.isSensor, filter = {categoryBits = self.categoryBits, maskBits = self.maskBits}}
        if options and options.body then
            local b = {}
            if type(options.body) == "function" then
                b = options.body(self)
            else
                b = options.body
            end
            for k, v in pairs(b) do
                body[k] = v
            end
        end
        physics.addBody(self, "dynamic", body)
    end

    function bullet:reInitPhysic()
        bullet:enablePhysic(false)
        bullet:enablePhysic(true)
    end

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