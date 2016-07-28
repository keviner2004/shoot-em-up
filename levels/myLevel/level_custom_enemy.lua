local Sublevel = require("Sublevel")
local MyEnemy = require("levels.myLevel.MyEnemy")
local util = require("util")
local myLevel = Sublevel.new("level name", "author name")

function myLevel:show(options)
    local enemy = MyEnemy.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = display.contentWidth/4
    enemy.y = -100
    --move the enemy from the top to bottom with speed 100 pixels/second
    enemy:setLinearVelocity( 0, 100 )
    enemy:addItem("items.PowerUp", {level = 1})
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