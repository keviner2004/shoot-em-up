local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local Rock = require("asteroids.BrownBig1")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-022", "level name", "author name", {duration = 3000})
local move = require("move")

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    local rock = Rock.new()
    rock.hp = 120
    self:insert(enemy)
    self:insert(rock)
    --place the enemy out of the screen

    enemy.x = gameConfig.contentWidth * 0.6
    enemy.y = 0
    enemy:setScaleLinearVelocity( 0, 150 )

    rock:autoDestroyWhenInTheScreen()

    self:addTimer(4000,
        function()
            enemy:clear()
        end
    )

    move.rotateAround(rock, {
        target = enemy,
        speed = 5,
        distance = 75 * gameConfig.scaleFactor,
        startDegree = 30,
        onMissTarget = function(angle)
            local d =  angle + 90
            rock:setScaleLinearVelocity( 150 * math.cos(math.rad(d)) , -150 * math.sin(math.rad(d)) )
            print(angle, d)
        end
    })

end

return myLevel
