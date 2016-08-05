local Effect = require("Effect")
local GameObject = require("GameObject")
local move = require("move")
local util = require("util")
local E = {}
E.new = function(options)
    local effect = Effect.new(options)

    local partical = GameObject.new({
        frames = {"Particles/18"}
    })

    if effect.duration == -1 then
        --print("*************Infinite")
    end

    local interval = (options and options.interval) or 1000

    function effect:show()
        local function glory()
            if not util.isExists(partical) then
                --print("object disapear, stop effect")
                transition.cancel(partical)
                return
            end
            transition.to(partical, {time = interval, xScale = 0.8, yScale = 0.8, onComplete = 
                function()
                    --print("glory2", partical.xScale, partical.yScale)
                    transition.to(partical, {time = interval, xScale = 1, yScale = 1, onComplete = 
                        function()
                            glory()
                        end
                    })
                end
            })
        end
        effect:insert(partical)
        glory()
    end
    
    return effect
end
return E