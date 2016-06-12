local Enemy = require("Enemy")
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local Bullet = require("bullets.CircleBullet")
local move = require("move")
local Turret = {}

Turret.new = function(options)
    local turret = Enemy.new()
    turret.base = Sprite.new("Turrets/Parts/Bases/1")
    turret.gun = GameObject.new({frames = {"Turrets/Parts/Cannos/1"}})
    turret:insert(turret.base)
    turret:insert(turret.gun)
    turret.gun.dir = 90
    move.pointTo(turret.gun, options.player)
    turret:enablePhysics()

    function turret:_shoot()
        local bullet = Bullet.new({fireTo = "character", radius = self.gun.width/2})
        bullet.x = self.x
        bullet.y = self.y
        move.toward(bullet, {degree = self.gun.dir - self.gun.rotation })
    end

    function turret:shoot(delay)
        if not delay then
            delay = 0
        end
        print("Shoot to character with delay "..delay)
        self:addTimer(delay, 
            function()
                self:_shoot()
                self:addTimer(1000, 
                    function()
                        self:_shoot()
                    end 
                , -1)
            end
        )
    end

    return turret
end

return Turret