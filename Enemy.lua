local Enemy = {}
local move = require("move")
local Item = require("Item")
local GameObject = require("GameObject")
local Effect = require("effects.StarExplosion2")
--local Effect = require("effects.PooledStarExplosion")
local Sprite = require("Sprite")
local sfx = require("sfx")
local ScaleText = require("ui.ScaleText")
local config = require("gameConfig")
local Backpack = require("Backpack")
local logger = require("logger")
local TAG = "Enemy"
Enemy.backpack = Backpack.new()
Enemy.backpack.owner = "Enemy"
setmetatable(Enemy, {
    __index = function (table, key)
        if key == "all" then
            return Enemy.backpack.items
        elseif key == "num" then
            return Enemy.backpack.numOfItems
        end
    end
})

Enemy.new = function(options)
    local enemy = GameObject.new(options)
    enemy.defaultFireTo = "character"
    --print("Add enemy to its backpack")
    if options and options.isFake then

    else
        Enemy.backpack:add2(enemy)
    end
    enemy:addTag("enemy")
    enemy:belongTo(PHYSIC_CATEGORY_ENEMY)
    enemy:collideWith(PHYSIC_CATEGORY_CHARACTER, PHYSIC_CATEGORY_BULLET, PHYSIC_CATEGORY_SHIELD, PHYSIC_CATEGORY_FIELD)
    enemy:setBody({
        type = "dynamic",
        isSensor = true
    })
    enemy.damage = 10
    enemy.name = "enemy"
    enemy.type = "enemy"
    enemy.invincible = false
    enemy.hurtSound = (options and options.hurtSound) or "hurt"
    enemy.deadSound = (options and options.deadSound) or "explosion"
    enemy.hp = (options and options.hp) or 50
    enemy.items = (options and options.items) or {}
    enemy.score = 100
    enemy.defaultBullet = {
        class = "bullets.CircleBullet",
        params = {
            {
                fireTo = enemy.defaultFireTo
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
        if event.other:hasTag("character") or event.other:hasTag("shield") then
            logger:debug(TAG, "%s with hp %d hit by %s with %d damage. ", self.name, self.hp, event.other.name, event.other.damage)
            self:hurt(event.other.damage, event.other)
        elseif event.other:hasTag("bullet") then
            logger:debug(TAG, "%s with hp %d hit by %s with %d damage. ", self.name, self.hp, event.other.name, event.other.damage)
            self:hurt(event.other.damage, event.other.owner)
        end
    end

    function enemy:addItem(class, ...)
        --print("Add item "..class.." to enemy")
        local item = {}
        item.class = class
        item.params = {...}
        self.items[#self.items+1] = item
    end

    function enemy:showScore()
        if self.score > 0 then
            local scoreText = ScaleText.new({
                text = string.format("%d", self.score),
                font = config.defaultFont,
                fontSize = 25
            })
            scoreText.x = self.x
            scoreText.y = self.y
            scoreText.xScale = 0.1
            scoreText.yScale = 0.1
            scoreText.fill = {1, 1, 1}
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
                            if scoreText.removeSelf then
                                scoreText:removeSelf()
                            end
                        end
                    })
                end
            })
        end
    end

    function enemy:setDefaultBullet(class, options)
        if not options then
            options = {}
        end
        if not options.fireTo then
            options.fireTo = self.defaultFireTo
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
        local speed = options.speed or 150
        local BulletClass = require((options and options.bulletClass) or self.defaultBullet.class)

        if options and options.bulletOptions then
            if not options.bulletOptions.fireTo then
                options.bulletOptions.fireTo = self.defaultFireTo
            end
        end

        local bullet = BulletClass.new((options and options.bulletOptions) or self.defaultBullet.options)
        bullet.x = x
        bullet.y = y
        --print("Shoot dir "..degree)
        if options and options.onShoot then
            options.onShoot(bullet)
        else
            bullet.rotation = bullet.dir - degree
            bullet:setScaleLinearVelocity( speed * math.cos(math.rad(degree)), - speed * math.sin(math.rad(degree)))
        end
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
        if self.parent then
            local effect = Effect.new({time=1000})
            effect:start()
            effect.x = self.x
            effect.y = self.y
            effect:setLinearVelocity( 0, config.stageSpeed )
            self.parent:insert(effect)
        end
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
        logger:debug(TAG, "Hurt enemy: %d / %d", damage, self.hp)
        if self.hp > 0 and not self.invincible then
            self:showHurtEffect()
            self:onHurt(damage, crime)
            --self:unHurtEffect()
            if self.hp <= 0 then
                self:playDeadSound()
                timer.performWithDelay(1,
                    function(event)
                        self:showDestroyEffect()
                        self:showScore()
                        if crime and crime.onKill then
                            crime:onKill(self)
                        end
                        --print("Enemy dead, drop items if needed")
                        if self.items then
                            --drop items
                            --print("drop items")
                            self:dropItems()
                        end
                        self:onDead(crime)
                    end
                )
            else
                self:playHurtSound()
            end
        end
    end

    function enemy:dispatchHealthEvent(phase, crime, damage)
        if self.dispatchEvent then
          self:dispatchEvent({
              name = "health",
              crime = crime,
              phase = phase,
              hp = self.hp,
              damage = damage
          })
        end
    end

    function enemy:onHurt(damage, crime)
        self.hp = self.hp - damage
        self:dispatchHealthEvent("hurt", crime, damage)
    end

    function enemy:onDead(crime)
        self:dispatchHealthEvent("dead", crime, 0)
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

    function enemy:onClear()
        --print("Catch Enemy Clear Event")
        Enemy.backpack:remove2(self)
    end

    return enemy
end

return Enemy
