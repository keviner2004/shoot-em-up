local Bullet = require("Bullet")
local Missile = {}
local move = require "move"
Missile.new = function (options)
    local missile = Bullet.new({
        frames = {
            "Rocket/f1",
            "Rocket/f2",
            "Rocket/f3",
            "Rocket/f4"
        },
        isRocket = true,
        fireTo = options and options.fireTo,
        --selfCollision = true
    })
    missile.dir = 0
    missile:play()    
    missile.type = "bullet"
    missile.name = "missile"
    --print ("Missle mass: ".. missile.mass)
    local count = 0
    
    function missile:seek(target, options)
        if self.x == nil or not self.setLinearVelocity then
            print("The missile is missing")
            return
        end
        --math.randomseed(os.time())
        local maxForce = 60 - math.random(-30, 30)
        local maxSpeed = 600 - math.random(-300, 300)

        if options and options.degree then
            --print("["..os.time().."]seek "..options.degree.." "..maxForce.." "..maxSpeed)
            self:setLinearVelocity(
                options.magnitude * math.sin(math.rad(options.degree)), 
                - options.magnitude * math.cos(math.rad(options.degree)))
        else 
            self:setLinearVelocity(-300, 300)
        end
        --self:applyForce(-1000, 1000, self.x , self.y)
        
        self.enterFrame = function()
            if self.paused then
                return
            end
            if self.x == nil then
                --print("missile is destroyed, remove enterFrame listeners")
                Runtime:removeEventListener("enterFrame", self)
                return
            end
            self:steer(target, maxForce, maxSpeed)
        end

        Runtime:addEventListener( "enterFrame", self )
    end

    function missile:steer(target, maxForce, maxSpeed)
        if not target.x then
            return
        end
        local vx, vy = self:getLinearVelocity()
        local rotation = move.angleBetween(0, 0, vx, vy)
        self.rotation = rotation
        --print("velocity: x: "..vx..",y: "..vy)
        local desired = { x = target.x - self.x, y = target.y - self.y }
        local d2=desired.x*desired.x+desired.y*desired.y
        local invMag = maxSpeed/ (d2^0.5)
        desired.x = desired.x * invMag
        desired.y = desired.y * invMag 
        local steering = { x = (desired.x - vx), y = (desired.y - vy)}

        local force2=steering.x*steering.x+steering.y*steering.y

        if force2>maxForce*maxForce and force2>0 then
            local r=maxForce/(force2^0.5)
            steering.x=steering.x*r
            steering.y=steering.y*r
        end
        self.steering = steering
        self:applyForce(self.steering.x, self.steering.y, self.x , self.y)
    end

    return missile
end



return Missile