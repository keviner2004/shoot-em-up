local Effect = require("Effect")
local GameObject = require("GameObject")
local move = require("move")
local E = {}
E.new = function(options)
    local effect = Effect.new(options)

    function effect:show()
        local function addStar(x, y, deg, xScale, yScale)
            local partical = GameObject.new({
                frames = {"Particles/11"}
            })
            partical.x = x
            partical.y = y
            partical.xScale = xScale
            partical.yScale = yScale
            move.toward(partical, {degree = deg})
            transition.to(partical, {time = effect.duration, xScale = 0.01, yScale = 0.01})
            effect:insert(partical)
        end

        addStar(0, 0, 45, 0.55, 0.55)
        addStar(0, 0, 100, 0.55, 0.55)
        addStar(0, 0, 125, 0.6, 0.6)
        addStar(0, 0, 180, 0.6, 0.6)
        addStar(0, 0, 205, 0.4, 0.4)
        addStar(0, 0, 235, 0.4, 0.4)
        addStar(0, 0, 265, 0.45, 0.45)
        addStar(0, 0, 300, 0.45, 0.45)
        addStar(0, 0, 335, 0.6, 0.6)
        addStar(0, 0, 360, 0.6, 0.6)
    end

    return effect
end
return E