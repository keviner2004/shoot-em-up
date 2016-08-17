local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyItem = require("levels.myLevel.MySimplestItem")
local myLevel = Sublevel.new("9999999-014", "level name", "author name", {duration = 4000})

function myLevel:show(options)
    local myItem = MyItem.new()
    self:insert(myItem)
    --place the enemy out of the screen
    myItem.x = gameConfig.contentWidth/4
    myItem.y = -100
    --move the enemy from the top to bottom with speed 100 pixels/second
    myItem:setLinearVelocity( 0, 100 )
    --destroy the enemy properly
    myItem:autoDestroyWhenInTheScreen()
end

return myLevel