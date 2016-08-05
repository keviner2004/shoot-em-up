local PooledStarExplosion = require("effects.PooledStarExplosion")
local Explosion = {}
local options = {
    stars = {
        {
            frames = {"Particles/17"},
            xScale = 0.6,
            yScale = 0.6,
            degree = 45,
        },
        {
            frames = {"Particles/17"},
            xScale = 0.65,
            yScale = 0.65,
            degree = 125,
        },
        {
            frames = {"Particles/17"},
            xScale = 0.45,
            yScale = 0.45,
            degree = 205,
        },
        {
            frames = {"Particles/17"},
            xScale = 0.5,
            yScale = 0.5,
            degree = 265,
        },
        {
            frames = {"Particles/17"},
            xScale = 0.6,
            yScale = 0.6,
            degree = 335,
        },
    },
    poolTag = "PooledItemExplosion"
}



Explosion.pooling = function(num)
    PooledStarExplosion.pooling(num, options)
end

Explosion.new = function()
    local explosion = PooledStarExplosion.new(options)
    return explosion
end

return Explosion