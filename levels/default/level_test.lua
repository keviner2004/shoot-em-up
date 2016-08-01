local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local Effect = require("effects.PixelEffect1")
local sublevel = Sublevel.new("", "")
function sublevel:show(options)
    function addEffect(x, y)
        local effect = Effect.new()
        self:insert(effect)
        effect.x = x
        effect.y = y
    end

    addEffect(gameConfig.contentWidth/2, gameConfig.contentHeight/2)
    addEffect(0, 0)
    addEffect(gameConfig.contentWidth/4*3, gameConfig.contentHeight/4*3)

end

return sublevel