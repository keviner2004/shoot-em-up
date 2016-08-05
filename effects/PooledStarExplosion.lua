local Effect = require("Effect")
local GameObject = require("GameObject")
local move = require("move")
local Pool = require("Pool")
local E = {}
local POOL_TAG = "StarExplosion2"
local logger = require("logger")
local TAG = "PooledStarExplosion"

E.create = function(options)
    local effect = Effect.new(options)
    if not options then
        options = {}
    end
    if not options.center and not options.stars then 
        options.center = {
            frames = {
                "Particles/4"
            },
        }

        options.stars = {
            {
                frames = {"Particles/3"},
                xScale = 0.55,
                yScale = 0.55,
                degree = 45,
            },
            {
                frames = {"Particles/3"},
                xScale = 0.6,
                yScale = 0.6,
                degree = 125,
            },
            {
                frames = {"Particles/3"},
                xScale = 0.4,
                yScale = 0.4,
                degree = 205,
            },
            {
                frames = {"Particles/3"},
                xScale = 0.45,
                yScale = 0.45,
                degree = 265,
            },
            {
                frames = {"Particles/3"},
                xScale = 0.6,
                yScale = 0.6,
                degree = 335,
            },
        }
    end

    function effect:createCenter(_options)
        local partical = GameObject.new({
            frames = (_options and _options.frames)
        }) 
        self:insert(partical)
        return partical       
    end

    function effect:createStar(_options)
        --print("Create star with ".._options.frames[1])
        local partical = GameObject.new({
            frames = (_options and _options.frames) 
        })
        self:insert(partical)
        return partical
    end

    function effect:shootCenter(partical, options)
        
        partical.x = (options and options.x) or 0
        partical.y = (options and options.y) or 0
        partical.xScale = (options and options.xScale) or 0.8
        partical.yScale = (options and options.yScale) or 0.8
        partical.alpha = (options and options.alpha) or 0
        transition.to(partical, {time = self.duration * 0.5, alpha = 0.5, xScale = 1, yScale = 1, onComplete = 
            function()
                transition.to(partical, {time = self.duration * 0.5, alpha = 0, xScale = 0.01, yScale = 0.01})        
            end
        })

    end

    function effect:shootStar(partical, options)
        partical.x = (options and options.x) or 0
        partical.y = (options and options.y) or 0
        partical.xScale = (options and options.xScale) or xScale
        partical.yScale = (options and options.yScale) or yScale
        partical.rotation = (options and options.rotation) or math.random(0, 359)
        move.toward(partical, {degree = (options and options.degree) or 0})
        transition.to(partical, {time = self.duration, alpha = 0, xScale = 0.01, yScale = 0.01})
        --print("Shoot: ", partical.x, partical.y, partical.xScale, partical.yScale, self.duration)
    end

    function effect:initComponent(com)
        com.alpha = 1
        com.xScale = 1
        com.yScale = 1
    end

    function effect:show()
        local randomDeg = math.random(0, 359)
        if options and options.center then
            self:shootCenter(self.center, options.center)
        end
        if options.stars and options.stars then
            local stars = options.stars
            for i = 1, #stars do
                if stars[i].degree then
                    stars[i].degree = stars[i].degree + randomDeg
                end
                --print("shoot star "..i.." !!")
                self:shootStar(self["star"..i], stars[i])
            end
        end
    end
    
    function effect:init()
        --print("===================")
        local randomDeg = math.random(0, 359)
        if options and options.center then
            self:initComponent(self.center)
        end
        if options.stars and options.stars then
            local stars = options.stars
            for i = 1, #stars do
                self:initComponent(self["star"..i])
            end
        end
        self:enablePhysics()
        --print("===================")
    end
    --create center
    if options and options.center then
        effect.center = effect:createCenter(options.center)
    end
    --create stars
    if options.stars and options.stars then
        local stars = options.stars
        effect.numOfStars = #stars
        --print("num of stars "..#stars)
        for i = 1, #stars do
            effect["star"..i] = effect:createStar(stars[i])
        end
    end

    return effect
end

E.pooling = function (num, options)
    --print("Pooling !!!!!!!!!!!! "..options.tag)
    for i = 1, 10 do
        local effect = E.create(options)
        --redesign clear func
        function effect:clear()
            self:enablePhysics(false)
            Pool.markAsFree(self)    
        end
        --print("add to pool "..((options and options.poolTag) or POOL_TAG), num)
        Pool.addToPool((options and options.poolTag) or POOL_TAG, effect)
        if options and options.parent then
            options.parent:insert(effect)
        end
    end
end

E.new = function(options)
    local effect = Pool.getFromPool((options and options.poolTag) or POOL_TAG)
    
    if not effect then
        logger:warn(TAG, "No pooled object found from "..((options and options.poolTag) or POOL_TAG))
        effect = E.create(options)
    end
    --print("=============Effect have "..effect.timerUtil.numOfTimers.." timers===============")
    effect:init()

    return effect
end

return E