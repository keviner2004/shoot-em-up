local Enemy = require("Enemy")

local EnemyPlane = {}
EnemyPlane.new = function(options)
    print("new plane")
    local plane = Enemy.new(options)

    plane.centerPart = plane:newSprite("Parts/cockpitBlue_5")
    plane.rightPart = plane:newSprite("Parts/wingBlue_4")
    plane.leftPart = plane:newSprite("Parts/wingBlue_4")
    
    plane.centerPart.yScale = -1;
    plane.rightPart.yScale = -1;
    plane.leftPart.yScale = -1;
    
    plane:insert(plane.centerPart)
    plane:insert(plane.rightPart)
    plane:insert(plane.leftPart)
    
    plane.leftPart.xScale = - plane.leftPart.xScale;
    plane.leftPart.x = -20
    plane.rightPart.x = 20
    plane.rightPart.y = 8
    plane.leftPart.y = 8
    plane.name = "enemyPlane"

    plane:addPhysic()

    function plane:split()
        print("split")
        --choose a random angle
        local angle = math.random(360)
        local distance = 50 
        --transition
        transition.to(self.leftPart, {
            time = 1000, 
            x = self.leftPart.x - distance
        })
        transition.to(self.rightPart, {
            time = 1000,
            x = self.rightPart.x + distance
        })
        transition.to(self, {time = 1000, alpha = 0, onComplete = 
            function()
                self:removeSelf()
            end
        })
    end

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
            distX = display.contentWidth
            distY = bullet.y - (display.contentWidth - enemy.x) * math.tan(math.rad(degree)) 
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