local Effect = require("Effect")
local GameObject = require("GameObject")
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")
local move = require("move")
local E = {}
E.new = function(options)
    if not options then
        options = {}
    end
    options.time = -1
    local effect = Effect.new(options)

    function effect:show()
        local sprite = Sprite.new({
                "22/1",
                "22/2",
                "22/3",
                "22/4",
                "22/5",
            }, {tag = gameConfig.SHEET_PIXEL_EFFECT, time = 800, loopCount = 0})
        sprite.xScale = 3
        sprite.yScale = 3
        effect:insert(sprite)
        sprite:play()
    end
    
    return effect
end
return E