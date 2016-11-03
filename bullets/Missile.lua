local Enemy = require("Enemy")
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local util = require("util")
local sfx = require("sfx")
local Missile = {}
local move = require "move"

Missile.new = function (options)
    local sprite = Sprite.new("Missiles/4")
    local missile = Enemy.new()
    missile.hp = 40
    missile.dir = 90
    missile:insert(sprite)   
    missile:enablePhysics()
    missile.name = "missile"
    --print ("Missle mass: ".. missile.mass)
    local count = 0

    function missile:addSmoke()
        local smoke = GameObject.new()
        --print("Add smoke!!!")
        local _smoke = Sprite["expansion-8"].new({
                    "Effects/smoke/9",
                    "Effects/smoke/6",
                    "Effects/smoke/3",
                    "Effects/smoke/8",
                    "Effects/smoke/5",
                    "Effects/smoke/2",
                    "Effects/smoke/7",
                    "Effects/smoke/4",
                    "Effects/smoke/1"
                },{
                    time = 1000, 
                    loopCount = 1
                })

        smoke:insert(_smoke)

        smoke.x = self.x - (self.height + smoke.height)/2 * math.cos(math.rad(self.dir - self.rotation))
        smoke.y = self.y + (self.height + smoke.height)/2 * math.sin(math.rad(self.dir - self.rotation))
        move.toward(smoke, {
            degree = self.dir - self.rotation + 180
        })
        _smoke:play()
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
                if util.isExists(self) then
                    self:addSmoke()
                end
            end
        , -1)
    end

    function missile:seek(target, options)
        move.seek(self, target, options)
    end

    missile:startSmoke()
    return missile
end



return Missile