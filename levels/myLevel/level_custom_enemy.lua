local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyEnemy = require("levels.myLevel.MyEnemy")
local util = require("util")
local myLevel = Sublevel.new("9999999-055", "custom enemy", "author name")

function myLevel:show(options)
    local enemy = MyEnemy.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth/4
    enemy.y = -enemy.height
    --move the enemy from the top to bottom with speed 100 pixels/second
    enemy:setScaleLinearVelocity( 0, 50 )
    enemy:addItem("items.PowerUp", {level = 1})
    --destroy the enemy properly
    enemy:autoDestroyWhenInTheScreen()
    self.enemy = enemy
end

function myLevel:isFinish()
    --print("isFinish!??")
    if util.isExists(self.enemy) then
        return false
    else
        return true
    end
end

return myLevel
