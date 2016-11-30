--MyGearItem.lua
local gameConfig = require("gameConfig")
local Item = require("Item")
local Effect = require("effects.PixelEffect1")
local Sprite = require("Sprite")

local MyItem = {}

MyItem.new = function(options)
    local item = Item.new()
    local sprite = Sprite["expansion-1"].new("Items/106")
    item:insert(sprite)
    item.score = 5
    item:enablePhysics()

    function item:needKeep(receiver)
        return false
    end

    function item:mentalEffect(receiver)
        print("mentalEffect!!")
        receiver:addEventListener("health", function(event)
            print("Player got hurt")
        end)
        receiver:addGear({
            gearClass = "levels.myLevel.MyGear2",
            gearOptions = {

            },
            x = 0,
            y = 0
        })
    end

    return item
end
return MyItem
