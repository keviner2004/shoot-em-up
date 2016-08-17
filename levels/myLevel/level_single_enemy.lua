local gameConfig require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-016", "level name", "author name", {duration = 4000})

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth/4
    enemy.y = -100
    --move the enemy from the top to bottom with speed 100 pixels/second
    enemy:setLinearVelocity( 0, 100 )
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
end

return myLevel