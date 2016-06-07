local Gameobject = require("Gameobject")
local Effect = {}
Effect.new = function(options)
    local effect = Gameobject.new()
    effect.duration = (options and options.time) or 400
    effect.type = "effect"
    effect.name = "effect"
    effect:addTag("effect")
    if effect.duration > 0 then
        effect:addTimer(effect.duration, 
            function()
                --print("Remove duration")
                effect:removeSelf() 
            end
        )
    end

    return effect
end

return Effect