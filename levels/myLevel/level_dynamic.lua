local gameConfig = require("gameConfig")
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
    print(self.gameMode)
    if self.gameMode == gameConfig.MODE_SINGLE_LEVEL then
        enemy:setScaleLinearVelocity( 0, 100 )
    elseif self.gameMode == gameConfig.MODE_INFINITE_LEVEL then
        enemy:setScaleLinearVelocity( 15, 100 )
    end
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
end

return myLevel
