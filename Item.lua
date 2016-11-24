local Item = {}
local GameObject = require("GameObject")
local Glory = require("effects.Glory")
local Explosion = require("effects.StarExplosion3")
--local Explosion = require("effects.PooledItemExplosion")
local Sprite = require("Sprite")
local sfx = require("sfx")
local logger = require("logger")
local ScaleText = require("ui.ScaleText")
local gameConfig = require("gameConfig")

Item.new = function(options)
    local TAG = "item"
    local item = GameObject.new()
    item.type = "item"
    item.name = "item"
    item.enabled = true
    item.droppable = true
    item.power = 0
    item.shootSpeed = 0
    item.lifes = 0
    item.score = 0
    item.apearDuration = (options and options.apearDuration) or 5000
    item:belongTo(PHYSIC_CATEGORY_ITEM)
    item:collideWith(PHYSIC_CATEGORY_CHARACTER)

    function item:effect(receiver)
        self:showScore()
        self:disableAutoDestroy()
        self:visualEffect(receiver)
        self:playGotSound(receiver)
        self:mentalEffect(receiver)
        --print("Item effect the receiver")
    end

    function item:showScore()
        if self.score > 0 then
            local scoreText = ScaleText.new({
                text = string.format("%d", self.score),
                font = gameConfig.defaultFont,
                fontSize = 20
            })
            scoreText.x = self.x
            scoreText.y = self.y
            scoreText.xScale = 0.1
            scoreText.yScale = 0.1
            scoreText.fill = {1, 1, 0}
            if self.parent then
                self.parent:insert(scoreText)
            end
            transition.to(scoreText, {
                xScale = 1,
                yScale = 1,
                time = 250,
                onComplete = function ()
                    transition.to(scoreText, {
                        time = 250,
                        alpha = 0,
                        onComplete = function()
                            scoreText:removeSelf()
                        end
                    })
                end
            })
        end
    end

    function item:playGotSound()
        sfx:play("scoreUp")
    end

    function item:visualEffect()
        local effect = Explosion.new({time=800})
        effect:start()
        self.parent:insert(effect)
        effect.x = self.x
        effect.y = self.y
    end

    function item:mentalEffect(receiver)

    end

    function item:idleEffect()
        local effect = Glory.new({
            time = -1}
        )
        effect:start()
        self:insert(effect)
    end

    function item:undoDrop()
        logger:debug(TAG, "undoDrop")
        self.isDropped = false
        self:setLinearVelocity(0 ,0)
        if self.timerId then
            item:cancelTimer(self.timerId)
        end
    end

    function item:dropped(receiver)
        self.isDropped = true
        --random move
        --math.randomseed(os.time())
        --degree = math.random(1, 360)
        self:dropEffect()
        self:onDrop()
    end

    function item:dropEffect(receiver)
        local degree = 0
        local speed = math.random(5, 15)
        for i = 0, math.floor(speed / 10) do
            degree = math.random(1, 360)
        end
        local vx = math.cos(math.rad(degree))* speed
        local vy = math.cos(math.rad(degree))* speed
        logger:debug(TAG, "random move items %d %d", vx, vy)

        self:setScaleLinearVelocity(vx , vy)
        --self:enableAutoDestroy()
        if self.apearDuration > 0 then
            self.timerId = item:addTimer(self.apearDuration, function()
                transition.to(item, {
                    time = 100,
                    alpha = 0,
                    onComplete = function()
                        if self.isDropped then
                            item:removeSelf()
                        end
                    end
                })
            end)
        end
    end

    function item:onDrop(receiver)

    end

    function item:needKeep(receiver)
        local result = receiver:testUpdateAttr(self)
        if result.change then
            return true
        end
        return false
    end

    item:idleEffect()

    return item
end

return Item
