local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-018", "level name", "author name", {duration = 4000})

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = 0
    enemy.y = gameConfig.contentHeight
    transition.to(enemy, {x = gameConfig.contentWidth + 100, y = -100, time = 3000})
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
end

return myLevel