local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local util = require("util")
local move = require("move")
local myLevel = Sublevel.new("9999999-017", "level name", "author name")

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth/4
    enemy.y = -100
    --move the enemy from the top to bottom with speed 100 pixels/second
    
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
    enemy:setLinearVelocity( 0, 600 )
    move.seek(enemy, self.player, {
        maxForce = 50
    })

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