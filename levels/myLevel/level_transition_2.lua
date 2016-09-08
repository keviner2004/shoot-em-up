local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-019", "level name", "author name", {duration = 3000})

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = 0
    enemy.y = gameConfig.contentHeight
    transition.to(enemy, {x = gameConfig.contentWidth, y = 0, time = 1500, onComplete = 
        function()
            transition.to(enemy, {x = -enemy.width, y = gameConfig.contentHeight, time = 1500})
        end
    })
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
end

return myLevel