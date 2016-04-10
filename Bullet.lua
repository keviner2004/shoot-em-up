local Bullet = {}
Bullet.new = function(options)
    local frames = {}
    if options and options.frames then
        for i, frame in ipairs(options.frames) do
            frames[i] = sheetInfo:getFrameIndex(frame)
        end
    else
        frames = {sheetInfo:getFrameIndex("Lasers/laserGreen09")}
    end 
    local bullet = display.newSprite( myImageSheet , {frames=frames} )
    local maskBits = {}

    if options and options.fireTo == "character" then 
        maskBits=1
    else
        maskBits=2
    end
    if options and not options.disablePhysic then
        if options and options.wall then
            maskBits = maskBits + 32
        end
        physics.addBody(bullet, "dynamic", { density=1.0, friction=0, bounce=0 , filter = {categoryBits=4, maskBits=maskBits}})
    end
    bullet.isBullet = true
    bullet.name = "bullet"
    bullet.type = "bullet"
    bullet.damage = 10
    bullet.preCollision = function(self, event)
        print("before hit "..event.other.name)
        bullet:afterHit(event)
    end

    bullet.collision = function(self, event)
        print("hit "..event.other.name.." with damage: "..self.damage)
        bullet:onHit(event)
    end
    bullet:addEventListener("collision", bullet)
    bullet:addEventListener("preCollision", bullet)

    function bullet:afterHit(event)
       self:removeSelf() 
    end

    function bullet:onHit(event)
        local destroyedBullet = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("Lasers/laserGreen14")}} )
        destroyedBullet.x = self.x
        destroyedBullet.y = self.y 
        transition.to(destroyedBullet, {time = 50, alpha = 0, onComplete = function()
                destroyedBullet:removeSelf()
            end})        
    end

    return bullet
end

return Bullet