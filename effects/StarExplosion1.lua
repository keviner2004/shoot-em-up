local Effect = require("Effect")
local Gameobject = require("Gameobject")
local move = require("move")
local E = {}
E.new = function(options)
    local effect = Effect.new(options)

    local function addStar(x, y, deg, xScale, yScale)
        local partical = Gameobject.new({
            frames = {"Particles/10"}
        })
        partical.x = x
        partical.y = y
        partical.xScale = xScale
        partical.yScale = yScale
        move.toward(partical, {degree = deg})
        transition.to(partical, {time = effect.duration, xScale = 0, yScale = 0})
        effect:insert(partical)
    end
    
    addStar(0, 0, 45, 0.45, 0.45)
    addStar(0, 0, 125, 0.5, 0.5)
    addStar(0, 0, 205, 0.3, 0.3)
    addStar(0, 0, 265, 0.35, 0.35)
    addStar(0, 0, 335, 0.5, 0.5)

    return effect
end
return E