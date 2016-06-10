local Enemy = require("Enemy")
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local move = require("move")
local Turret = {}

Turret.new = function(options)
    local turret = Enemy.new()
    local base = Sprite.new("Turrets/Parts/Bases/1")
    local gun = GameObject.new({frames = {"Turrets/Parts/Cannos/1"}})
    turret:insert(base)
    turret:insert(gun)
    gun.dir = 90
    move.pointTo(gun, options.player)
    turret:enablePhysics()

    function turret:shoot()

        self:addTimer(1000, 
            function()
                bullet = 
            end 
        , -1)
    end

    return turret
end

return Turret