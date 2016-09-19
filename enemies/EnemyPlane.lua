local gameConfig = require("gameConfig")
local Enemy = require("Enemy")
local Sprite = require("Sprite")
local EnemyPlane = {}

EnemyPlane.new = function(options)
--    print("new plane")
    local plane = Enemy.new(options)

    plane.centerPart = Sprite.new("Ships/Parts/Cockpits/21")
    plane.rightPart = Sprite.new("Ships/Parts/Wings/35")
    plane.leftPart = Sprite.new("Ships/Parts/Wings/35")

    plane:insert(plane.centerPart)
    plane:insert(plane.rightPart)
    plane:insert(plane.leftPart)

    plane.leftPart.xScale = - plane.leftPart.xScale;
    plane.leftPart.x = -25
    plane.rightPart.x = 25
    plane.rightPart.y = 8
    plane.leftPart.y = 8
    plane.name = "enemyPlane"
    plane.dir = 270
    plane:enablePhysics()
    plane.hp = 40

    function plane:onMovePoint(event)
        print("onMovePoint")
        local bullet = Bullet.new("character")
        bullet.x = enemy.x
        bullet.y = enemy.y
        bullet.rotation = enemy.rotation
        local degree = 90 - bullet.rotation
        if degree < 0 then
            degree = degree + 360
        end

        if (degree < 90 and degree > 0) or ( degree > 270 and degree < 360 ) then
            distX = gameConfig.contentWidth
            distY = bullet.y - (gameConfig.contentWidth - enemy.x) * math.tan(math.rad(degree))
        else
            distX = 0
            distY = bullet.y + enemy.x * math.tan(math.rad(degree))
        end
        --stop rotate when shoot, or it's weired
        transition.to(bullet,  {
            x = distX,
            y = distY,
            time = 1000,
            onComplete = function(obj)
                display.remove(bullet)
            end
        })
    end

    return plane
end

return EnemyPlane
