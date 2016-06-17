local Enemy = require("Enemy")
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local Bullet = require("bullets.CircleBullet")
local move = require("move")
local Turret = {}

Turret.new = function(options)
    local turret = Enemy.new(options)

    turret.base = Sprite.new("Turrets/Parts/Bases/1")
    turret.gun = GameObject.new({frames = {"Turrets/Parts/Cannos/1"}})
    turret:insert(turret.base)
    turret:insert(turret.gun)
    turret.gun.dir = 90 
    if options and options.player then
        move.pointTo(turret.gun, options.player)
    end

    turret:setDefaultBullet("bullets.CircleBullet", {radius = turret.gun.width/2})
    turret:enablePhysics()

    turret.shootDelay = options.shootDelay or 0
    turret.shootInterval = options.shootInterval or 1000

    function turret:startShootLoop()
        print("shootDelay "..self.shootDelay)
        self:addTimer(self.shootDelay,
            function()
                self:shoot({degree = self.gun.dir - self.gun.rotation})
                self:addTimer(self.shootInterval,
                    function()
                        self:shoot({degree = self.gun.dir - self.gun.rotation})
                    end
                , -1)
            end
        )
    end

    return turret
end

return Turret