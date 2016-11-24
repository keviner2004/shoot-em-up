local gameConfig = require("gameConfig")
local Item = require("Item")
local Effect = require("effects.PixelEffect1")
local Sprite = require("Sprite")
local MyItem = {}

MyItem.new = function(options)
    local item = Item.new()
    local sprite = Sprite["expansion-1"].new("Items/28")
    item:insert(sprite)
    --static attr
    item.score = 50
    item.lifes = 1
    --item.power = 1
    --item.shootSpeed = 1
    --enable physics
    item:enablePhysics()

    function item:needKeep(receiver)
        return false
        --return true
    end

    item.oldVisualEffect = item.visualEffect
    function item:visualEffect(receiver)
        --item:oldVisualEffect(receiver)
        local effect = Effect.new({time = 700})
        effect.x = receiver.x
        effect.y = receiver.y

        if receiver.parent then
            receiver.parent:insert(effect)
        end
        effect:start()
        
    end

    item.oldPlayGotSound = item.playGotSound
    function item:playGotSound(receiver)
        item:oldPlayGotSound(receiver)
    end

    item.oldMentalEffect = item.mentalEffect
    function item:mentalEffect(receiver)
        item:oldMentalEffect(receiver)
        receiver:openShield(3000)
    end

    return item
end
return MyItem