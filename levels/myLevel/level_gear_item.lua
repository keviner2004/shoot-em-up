local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyItem = require("levels.myLevel.MyGearItem")
local MyItem2 = require("levels.myLevel.MyGearItem2")
local MyEnemy = require("enemies.EnemyPlane")

local myLevel = Sublevel.new("9999999-065", "level name", "author name", {duration = 4000})

myLevel.__gearCount = 0

function myLevel:show(options)
    local myEnemy = MyEnemy.new()
    self:insert(myEnemy)
    myEnemy.x = gameConfig.contentWidth * 0.75
    myEnemy.y = -100

    --move the enemy from the top to bottom with speed 100 pixels/second
    myEnemy:setScaleLinearVelocity( 0, 50 )
    --destroy the enemy properly
    myEnemy:autoDestroyWhenInTheScreen()
    
    
    local myItem

    if self.__gearCount %2 == 0 then
        myItem = MyItem.new()
    else
        myItem = MyItem2.new()
    end
    self:insert(myItem)
    self.__gearCount = self.__gearCount + 1
    
    --place the item out of the screen
    myItem.x = gameConfig.contentWidth/4
    myItem.y = -100
    --move the item from the top to bottom with speed 100 pixels/second
    myItem:setScaleLinearVelocity( 0, 50 )
    --destroy the item properly
    myItem:autoDestroyWhenInTheScreen()
end

return myLevel
