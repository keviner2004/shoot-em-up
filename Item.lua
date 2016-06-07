local Item = {}
local GameObject = require("GameObject")
local Glory = require("Effects.Glory")
local Explosion = require("Effects.StarExplosion3")
local Sprite = require("Sprite")

Item.new = function(sprites, options)
    local item = GameObject.new()
    local sprite = Sprite.new(sprites)
    item:insert(sprite)
    item.type = "item"
    item.name = "item"
    item.enabled = true
    item.droppable = true
    item.power = 0
    item.speed = 0
    item.score = 0
    item.apearDuration = (options and options.apearDuration) or 5000

    physics.addBody(item, "dynamic", {
        filter = {
            categoryBits=PHYSIC_CATEGORY_ITEM, 
            maskBits=PHYSIC_CATEGORY_CHARACTER
        }
    })

    function item:effect(receiver)
        self:disableAutoDestroy()
        self:visualEffect()
        self:mentalEffect()
        print("Item effect the receiver")
    end

    function item:visualEffect()
        local effect = Explosion.new({time=800})
        self.parent:insert(effect)
        effect.x = self.x
        effect.y = self.y
    end

    function item:mentalEffect()
        
    end

    function item:idleEffect()
        local effect = Glory.new({
            time = -1}
        )
        self:insert(effect)
    end

    function item:undoDrop()
        print("undoDrop")
        self:setLinearVelocity(0 ,0)
        if self.timerId then
            item:cancelTimer(self.timerId)
        end
    end

    function item:dropped()
        --random move
        math.randomseed(os.time())
        local degree = math.random(0, 360)
        local vx = math.cos(math.rad(degree))*10
        local vy = math.cos(math.rad(degree))*10
        print("random move items ", vx, vy)
        self:setLinearVelocity(vx , vy)
        self:enableAutoDestroy()
        if self.apearDuration > 0 then
            self.timerId = item:addTimer(self.apearDuration, function()
                transition.to(item, {
                    time = 500,
                    alpha = 0,
                    onComplete = function()
                        item:removeSelf()
                    end
                })
            end)
        end
    end
    
    item:idleEffect()
    sprite:toFront()

    return item
end

return Item
