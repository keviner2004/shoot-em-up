local Gear = require("Gear")
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")

local MyGear = {}

MyGear.new = function(options)
    local myGear = Gear.new(options)
    myGear.dir = 90
    myGear.gearId = "myGear2_123456"

    local gun1 = Sprite["expansion-4"].new("Ships/40")
    local gun2 = Sprite["expansion-4"].new("Ships/40")

    local receiver = options.receiver

    myGear:insert(gun1)
    myGear:insert(gun2)
    gun1.x = -receiver.width
    gun2.x = receiver.width

    myGear:setDefaultBullet("bullets.Laser")

    myGear:addTimer(500, function()
        myGear:shoot({
            x = myGear.x + receiver.width,
            degree = 90,
            speed = 100 * gameConfig.scaleFactor 

        })
        myGear:shoot({
            x = myGear.x - receiver.width,
            degree = 90,
            speed = 100 * gameConfig.scaleFactor
        })
    end, -1)

    return myGear
end
return MyGear