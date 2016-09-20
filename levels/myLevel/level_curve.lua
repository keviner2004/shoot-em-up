local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-021", "level name", "author name", {duration = 3000})
local move = require("move")

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen

    local pathPoints = move.getCurve(
        {
            {x = gameConfig.contentWidth, y = 67}, --P1
            {x = gameConfig.contentWidth*0.1, y = gameConfig.contentWidth*0.1}, --P2
            {x = gameConfig.contentWidth, y = gameConfig.contentHeight}, --P3
            {x = -gameConfig.contentWidth*0.1, y = gameConfig.contentHeight*0.8} --P4
        }, 100)

    enemy.x = pathPoints[1].x
    enemy.y = pathPoints[1].y

    --destroy the enemy properly
    move.followN(enemy, pathPoints, {
        speed = 300 * gameConfig.scaleFactor,
        autoRotation = true,
        onComplete = function()
            enemy:clear()
        end
    })
end

return myLevel
