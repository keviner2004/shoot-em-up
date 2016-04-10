local Item = {}

Item.new = function()
    local sheetInfo = require "sprites.spaceshooter"
    local myImageSheet = graphics.newImageSheet( "sprites/spaceshooter.png", sheetInfo:getSheet() )
    local item = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("Power-ups/things_gold")}})
    item.type = "item"
    item.name = "powerup"
    physics.addBody(item, "dynamic", {filter = {categoryBits=16, maskBits=1}})

    function item:got(gotBy)
        print("item was got by someone")
        self:removeSelf()
    end

    return item
end

return Item
