local Bullet = require("Bullet")
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local util = require("util")
local sfx = require("sfx")
local Missile = {}
local Effect = require("effects.StarExplosion2")
local move = require "move"
Missile.new = function (options)
    local sprite = Sprite.new("Missiles/4")
    local missile = Bullet.new({
        isRocket = true,
        fireTo = options and options.fireTo,
        --selfCollision = true
    })
    missile.dir = 90
    missile:insert(sprite)   
    missile:enablePhysics()
    missile.type = "bullet"
    missile.name = "missile"
    --print ("Missle mass: ".. missile.mass)
    local count = 0

    function missile:addSmoke()
        local smoke = GameObject.new({
                frames = {
                    "Effects/smoke/9",
                    "Effects/smoke/6",
                    "Effects/smoke/3",
                    "Effects/smoke/8",
                    "Effects/smoke/5",
                    "Effects/smoke/2",
                    "Effects/smoke/7",
                    "Effects/smoke/4",
                    "Effects/smoke/1"
                }, 
                time = 1000, 
                loopCount = 1})
        smoke.x = self.x - (self.height + smoke.height)/2 * math.cos(math.rad(self.dir - self.rotation))
        smoke.y = self.y + (self.height + smoke.height)/2 * math.sin(math.rad(self.dir - self.rotation))
        move.toward(smoke, {
            degree = self.dir - self.rotation + 180
        })
        smoke:play()
        smoke.alpha = 0
        transition.to(smoke, {alpha = 1})
        smoke:addEventListener("sprite", 
            function(event)
                if event.phase == "ended" then
                    smoke:removeSelf()
                end
            end
        )
        self.parent:insert(smoke)
    end

    function missile:startSmoke()
        --self:addSmoke()
        self:addTimer(60 , 
            function()
                self:addSmoke()
            end
        , -1)
    end

    function missile:seek(target, options)
        move.seek(self, target, options)
    end

    function missile:showDestroyEffect()
        local effect = Effect.new({time=1000})
        effect.x = self.x
        effect.y = self.y
        self.parent:insert(effect)
    end

    function missile:playDestroySound()
        sfx:play("explosion2")
    end

    missile:startSmoke()

    return missile
end



return Missile