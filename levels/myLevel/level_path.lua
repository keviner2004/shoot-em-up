local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-020", "level name", "author name", {duration = 3000})
local move = require("move")

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen

    enemy.x = 0
    enemy.y = 0

    local pathPoints = {
        {x = gameConfig.contentWidth, y = gameConfig.contentHeight/2}, 
        {x = -enemy.width, y = gameConfig.contentHeight}
    }

    --destroy the enemy properly
    move.followN(enemy, pathPoints, {
        speed = 600,
        autoRotation = true,
        onComplete = function()
            enemy:clear()
        end
    })
end

return myLevel