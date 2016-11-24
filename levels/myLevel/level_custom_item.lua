local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyItem = require("levels.myLevel.MyItem")
local LifeUp = require("items.LifeUp")
local PowerUp = require("items.PowerUp")
local ShieldUp = require("items.ShieldUp")
local SpeedUp = require("items.SpeedUp")
local MyEnemy = require("enemies.EnemyPlane")

local myLevel = Sublevel.new("9999999-057", "level name", "author name", {duration = 4000})

function myLevel:show(options)
    local myEnemy = MyEnemy.new()
    self:insert(myEnemy)
    myEnemy.x = gameConfig.contentWidth * 0.75
    myEnemy.y = -100

    --move the enemy from the top to bottom with speed 100 pixels/second
    myEnemy:setScaleLinearVelocity( 0, 50 )
    --destroy the enemy properly
    myEnemy:autoDestroyWhenInTheScreen()

    --local myItem = LifeUp.new()
    --local myItem = SpeedUp.new({ level = 1 })
    --local myItem = PowerUp.new({ level = 1 })
    --local myItem = ShieldUp.new({ level = 1 })
    local myItem = MyItem.new()    

    self:insert(myItem)
    --place the item out of the screen
    myItem.x = gameConfig.contentWidth/4
    myItem.y = -100
    --move the item from the top to bottom with speed 100 pixels/second
    myItem:setScaleLinearVelocity( 0, 50 )
    --destroy the item properly
    myItem:autoDestroyWhenInTheScreen()
end

return myLevel
