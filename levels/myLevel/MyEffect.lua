local Effect = require("Effect")
local GameObject = require("GameObject")
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")
local move = require("move")
local sfx = require("sfx")
local MyEffect = {}
MyEffect.new = function(options)
    local effect = Effect.new(options)

    function effect:show()
        local sprite = Sprite["pixelEffect"].newAnimation({
            {
                name = "start",
                frames = {
                    "2/1",
                    "2/2",
                    "2/3",
                    "2/4",
                    "2/5",
                    "2/6",
                },
                time = 600,
                loopCount = 0   
            }
        })

        self:insert(sprite)
        sprite.xScale = 5
        sprite.yScale = 5
        sprite:setSequence("start")
        sprite:play()
        sfx:play("explosion2")
    end
    
    return effect
end
return MyEffect