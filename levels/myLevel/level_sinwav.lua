local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local myLevel = Sublevel.new("9999999-023", "level name", "author name")
local util = require("util")
function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen
    local defaultX = gameConfig.contentWidth/2
    enemy.x = defaultX
    enemy.y = -enemy.height/2
    local deg = 0
    local offset = gameConfig.contentWidth * 0.35

    enemy.enterFrame:each(
        function()
            if enemy.paused then
              return
            end
            local ratio = math.sin(math.rad(deg))
            deg = deg + 2
            enemy.x = defaultX + ratio * offset
            enemy.y  = enemy.y + 3
        end
    )

    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
    self.enemy = enemy
end

function myLevel:isFinish()
    if util.isExists(self.enemy) then
        return false
    else
        return true
    end
end

return myLevel
