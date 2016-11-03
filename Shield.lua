local Shield = {}
local Sprite = require("Sprite")
local GameObject = require("GameObject")
local logger = require("logger")
local TAG = "Shield"

Shield.new = function(options)
    local shield = GameObject.new()
    shield.type = "shield"
    shield.name = "shield"
    shield:collideWith(PHYSIC_CATEGORY_ENEMY)
    shield:collideWith(PHYSIC_CATEGORY_BULLET, PHYSIC_CATEGORY_ASTEROID, PHYSIC_CATEGORY_MISSILE)
    shield:belongTo(PHYSIC_CATEGORY_SHIELD)
    shield:addTag("shield")
    shield.damage = 20

    function shield:open(time)
        if self.opened then
            --logger:debug(TAG, "Shield was already opened")
            return
        end
        self.sprite = Sprite["expansion-8"].new({
                "Effects/Shield/3",
                "Effects/Shield/2",
                "Effects/Shield/1",
                "Effects/Shield/3"
            }, {time = 600})
        self:insert(self.sprite)
        self.sprite:play()
        self:setBody({type = "dynamic", isSensor = true, radius = shield.sprite.height/2*1.2})
        self:enablePhysics()
        if time then
            self:addTimer(time, function()
               self:close() 
            end)
        end
        logger:debug(TAG, "Shield was opened")
        self.opened = true
    end

    function shield:close()
        --print("Close shield")
        self.opened = false
        self:removePhysics()
        --print("Remove shield physics")
        transition.to(self.sprite, { alpha = 0, onComplete = 
            function()
                if self.sprite.removeSelf then
                    self.sprite:removeSelf()
                end
                --self:clear()
                --print("clear")
                --self.opened = false
            end
        })
    end

    return shield
end

return Shield