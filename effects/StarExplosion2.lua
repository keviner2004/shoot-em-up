local Effect = require("Effect")
local Gameobject = require("Gameobject")
local move = require("move")
local E = {}
E.new = function(options)
    local effect = Effect.new(options)
    
    local function addCenter(x, y, xScale, yScale)
        local partical = Gameobject.new({
            frames = {"Particles/4"}
        })
        partical.x = x
        partical.y = y
        partical.xScale = xScale * 0.8
        partical.yScale = yScale * 0.8
        partical.alpha = 0
        effect:insert(partical)
        transition.to(partical, {time = effect.duration * 0.5, alpha = 0.5, xScale = 1, yScale = 1, onComplete = 
            function()
                transition.to(partical, {time = effect.duration * 0.5, alpha = 0, xScale = 0.01, yScale = 0.01})        
            end
        })
        
    end

    local function addStar(x, y, deg, xScale, yScale)
        local partical = Gameobject.new({
            gtype = "sprite", 
            frames = {"Particles/3"}
        })
        partical.x = x
        partical.y = y
        partical.xScale = xScale
        partical.yScale = yScale
        local randomDeg = math.random(0, 359)
        partical.rotation = randomDeg
        move.toward(partical, {degree = deg})
        effect:insert(partical)
        transition.to(partical, {time = effect.duration, alpha = 0, xScale = 0.01, yScale = 0.01})
    end

    addCenter(0, 0, 1, 1)

    local randomDeg = math.random(0, 359)

    addStar(0, 0, 45 + randomDeg, 0.55, 0.55)
    --addStar(0, 0, 100, 0.55, 0.55)
    addStar(0, 0, 125 + randomDeg, 0.6, 0.6)
    --addStar(0, 0, 180, 0.6, 0.6)
    addStar(0, 0, 205 + randomDeg, 0.4, 0.4)
    --addStar(0, 0, 235, 0.4, 0.4)
    addStar(0, 0, 265 + randomDeg, 0.45, 0.45)
    --addStar(0, 0, 300, 0.45, 0.45)
    addStar(0, 0, 335 + randomDeg, 0.6, 0.6)
    --addStar(0, 0, 360, 0.6, 0.6)

    return effect
end
return E