local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyEffect = require("levels.myLevel.MyEffect")
local util = require("util")
local myLevel = Sublevel.new("9999999-056", "custom effect", "author name", {duration = 1800})


function myLevel:addEffect(x)
    local effect = MyEffect.new({ time = 500})
    self:insert(effect)
    --place the effect
    effect.x = x
    effect.y = -effect.height/2
    effect:show()
    effect:enablePhysics()
    --move the effect with the stage speed
    effect:setScaleLinearVelocity( 0, gameConfig.stageSpeed )
    return effect
end

function myLevel:show(options)
    self:addEffect(gameConfig.contentWidth*0.25)
    self:addTimer(1000, function ()
        self:addEffect(gameConfig.contentWidth*0.5)
    end)

    self:addTimer(1500, function ()
        self:addEffect(gameConfig.contentWidth*0.75)
    end)

    self.enemy = enemy
end

return myLevel
