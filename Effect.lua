local GameObject = require("GameObject")
local Effect = {}
Effect.new = function(options)
    local effect = GameObject.new()
    effect.duration = (options and options.time) or 400
    effect.type = "effect"
    effect.name = "effect"
    effect:addTag("effect")

    function effect:startTimer()
        --print("!!!!!!!!!!!!!!Start timer "..self.duration)
        self:addTimer(self.duration, 
        --timer.performWithDelay( self.duration, 
            function()
                self:clear()
            end
        , 1)
    end

    function effect:show()

    end

    function effect:start()
        if effect.duration > 0 then
            effect:startTimer()
        end
        self:show()
    end

    return effect
end

return Effect