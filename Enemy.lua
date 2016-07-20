local Enemy = {}
local move = require("move")
local Item = require("Item")
local GameObject = require("GameObject")
local Effect = require("effects.StarExplosion2")
local Sprite = require("Sprite")
local sfx = require("sfx")
local config = require("gameConfig")

Enemy.new = function(options)
    local enemy = GameObject.new(options)
    enemy:addTag(enemy)
    enemy:belongTo(PHYSIC_CATEGORY_ENEMY)
    enemy:collideWith(PHYSIC_CATEGORY_CHARACTER, PHYSIC_CATEGORY_BULLET, PHYSIC_CATEGORY_SHIELD)
    enemy:setBody({
        type = "dynamic",
        isSensor = true        
    })
    enemy.damage = 10
    enemy.name = "enemy"
    enemy.type = "enemy"
    enemy.hurtSound = (options and options.hurtSound) or "hurt"
    enemy.deadSound = (options and options.deadSound) or "explosion"
    enemy.hp = (options and options.hp) or 50
    enemy.items = (options and options.items) or {}
    enemy.score = 100
    enemy.defaultBullet = {
        class = "bullets.CircleBullet",
        params = {
            {
                fireTo = "character"
            }
        }
    }

    enemy.preCollision = function(self, event)
        --print("enemy before hit by "..event.other.name)
        --if event.other.name == "bullet" then 
            if event.contact then
                event.contact.isEnabled = false
            else 
                print("WTF")
            end
        --end
    end

    enemy.collision = function(self, event)
        --print("enemy hit by "..event.other.name..":"..self.hp..", x:"..event.x..",y:"..event.y)
        if event.other.name == "character" or event.other.name == "shield" then
            self:hurt(event.other.damage, event.other)
        elseif event.other.name == "bullet" then
            self:hurt(event.other.damage, event.other.owner)
        end
    end

    enemy:addEventListener("preCollision", enemy)
    enemy:addEventListener("collision", enemy)

    function enemy:addItem(class, ...)
        --print("Add item "..class.." to enemy")
        local item = {}
        item.class = class
        item.params = {...}
        self.items[#self.items+1] = item
    end

    function enemy:setDefaultBullet(class, options)
        if not options then
            options = {}
        end
        if not options.fireTo then
            options.fireTo = "character"
        end
        --print("Add default bullet: "..class.." to enemy")
        self.defaultBullet.class = class
        self.defaultBullet.options = options
    end

    function enemy:shoot(options)
        sfx:play("shot")
        local x = options.x or self.x
        local y = options.y or self.y
        local degree = options.degree or 0
        local speed = speed or 300
        local BulletClass = require(self.defaultBullet.class)
        local bullet = BulletClass.new(self.defaultBullet.options)
        bullet.x = x
        bullet.y = y
        --print("Shoot dir "..degree)
        bullet:setLinearVelocity( speed * math.cos(math.rad(degree)), - speed * math.sin(math.rad(degree)))
        self.parent:insert(bullet)
        self:toFront()
    end

    function enemy:showHurtEffect()
        --print("apply hurt effect")
        if not self.processHurtEffect then
            self.processHurtEffect = true
            function blend(obj)
                if obj.numChildren then
                    for i = 1, obj.numChildren do
                        blend(obj[i])
                    end
                else
                    if obj.fill then
                        obj.fill.blendMode = "screen"
                    end
                    --obj.fill.effect = "filter.brightness"
                end
            end

            blend(self)
            timer.performWithDelay(100, 
                function()
                    self:showUnHurtEffect()
                    self.processHurtEffect = false
                end
            )
        end
    end

    function enemy:showDestroyEffect()
        local effect = Effect.new({time=1000})
        effect.x = self.x
        effect.y = self.y
        effect:enablePhysics()
        effect:setLinearVelocity( 0, config.stageSpeed )
        self.parent:insert(effect)
    end

    function enemy:playHurtSound()
        sfx:play(self.hurtSound)
    end

    function enemy:playDeadSound()
       sfx:play(self.deadSound) 
    end

    function enemy:showUnHurtEffect()
        --print("apply unhurt effect")
        function blend(obj)
            if obj.numChildren then
                for i = 1, obj.numChildren do
                    blend(obj[i])
                end
            else
                if obj.fill then
                    obj.fill.blendMode = "normal"
                end
            end
        end
        blend(self) 
    end

    function enemy:hurt(damage, crime)
        --print("Hurt enemy: "..damage..":"..self.hp)
        if self.hp > 0 then
            self:showHurtEffect()
            self:onHurt(damage, crime)
            --self:unHurtEffect()
            if self.hp <= 0 then
                self:playDeadSound()
                timer.performWithDelay(1, 
                    function(event)
                        self:showDestroyEffect()
                        self:onDead(crime)
                        if crime and crime.onKill then
                            crime:onKill(self)
                        end
                        --print("Enemy dead, drop items if needed")
                        if self.items then
                            --drop items
                            --print("drop items")
                            self:dropItems()
                        end
                    end
                )
            else
                self:playHurtSound()
            end
        end
    end

    function enemy:onHurt(damage, crime)
        self.hp = self.hp - damage
    end

    function enemy:onDead(crime)
        --print("Enemy onDead")
        physics.removeBody(self)
        transition.to(self, {time = 0, alpha = 0, onComplete = 
            function ( ... )
                self:clear()    
        end})
    end

    function enemy:dropItems()
        if self.items then
            for i, v in ipairs(self.items) do
                --print("Enemy drops item "..v.class)
                local ItemClass = require(v.class)
                local item = ItemClass.new(unpack(v.params))
                self.parent:insert(item)
                item.x = self.x
                item.y = self.y
                item._iclass = v.class
                item._iparams = v.params
                item:dropped()
            end
        end
    end

    return enemy
end

return Enemy