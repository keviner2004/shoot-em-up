local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyEnemy = require("levels.myLevel.MyEnemy2")
local NoAutoShootEnemy = require("levels.myLevel.MyEnemy3")
local util = require("util")
local myLevel = Sublevel.new("9999999-085", "custom bullet", "author name")

function myLevel:show(options)
    local enemy = MyEnemy.new()
    self:insert(enemy)
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth * 0.75
    enemy.y = -enemy.height
    --move the enemy from the top to bottom with speed 100 pixels/second
    enemy:setScaleLinearVelocity( 0, 50 )
    enemy:addItem("items.ShieldUp", {level = 3})
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
