local Effect = require("Effect")
local GameObject = require("GameObject")
local move = require("move")
local Sprite = require("Sprite")
local E = {}
E.new = function(options)
    local effect = Effect.new(options)
    
    local function addCenter(x, y, xScale, yScale)
        local partical = GameObject.new()
        partical:insert(Sprite["expansion-8"].new("Particles/16"))
        partical.x = x
        partical.y = y
        partical.xScale = xScale * 0.5
        partical.yScale = yScale * 0.5
        effect:insert(partical)
        transition.to(partical, {time = effect.duration * 0.5, alpha = 1, xScale = 1, yScale = 1, onComplete = 
            function()
                transition.to(partical, {time = effect.duration * 0.5, alpha = 0, xScale = 0.01, yScale = 0.01})        
            end
        })
    end

    local function addStar(x, y, deg, xScale, yScale)
        local partical = GameObject.new()
        partical:insert(Sprite["expansion-8"].new("Particles/17"))
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

    function effect:show()

        local randomDeg = math.random(0, 359)

        addStar(0, 0, 45 + randomDeg, 0.6, 0.6)
        --addStar(0, 0, 100, 0.55, 0.55)
        addStar(0, 0, 125 + randomDeg, 0.65, 0.65)
        --addStar(0, 0, 180, 0.6, 0.6)
        addStar(0, 0, 205 + randomDeg, 0.45, 0.45)
        --addStar(0, 0, 235, 0.4, 0.4)
        addStar(0, 0, 265 + randomDeg, 0.5, 0.5)
        --addStar(0, 0, 300, 0.45, 0.45)
        addStar(0, 0, 335 + randomDeg, 0.6, 0.6)
        --addStar(0, 0, 360, 0.6, 0.6)
        self:enablePhysics()
    end
    return effect
end
return E