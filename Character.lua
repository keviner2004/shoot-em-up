local Character = {}
local Control = require("Control")
local Laser = require("bullets.Laser")
local HomingLaser = require("bullets.HomingLaser")
local Sprite = require("Sprite")
local PowerUp = require("items.PowerUp")
local SpeedUp = require("items.SpeedUp")
local ShieldUp = require("items.ShieldUp")
local GameObject = require("GameObject")
local Shield = require("Shield")
local move = require("move")
local util = require("util")
local Backpack = require("Backpack")
local id = 0
local sfx = require("sfx")
local logger = require("logger")
local CircleExplosion = require("effects.CircleExplosion")

local TAG = "Character"

Character.new = function (options)
    local character = GameObject.new()
    character:addTag("character")
    character.gear = display.newGroup()
    id = id + 1
    character.id = id
    character.gearLevel = 0
    character.sprite = Sprite.new(
        {
            "Ships/3"
        }
    )
    character:insert(character.sprite)
    character.type = "character"
    character.name = "character"
    character.speed = (options and options.speed) or 0
    print("Character speed "..character.speed)
    character.maxSpeed = 3
    character.fireRate = options and options.fireRate
    character.fingerSize = options and options.fingerSize
    character.controlType = (options and options.controlType) or "follow"
    character.hp = (options and options.hp) or 1
    character.maxHp = character.hp
    character.score = (options and options.score) or 0
    character.moveAngle = 0
    character.enableMove = false
    character.touchPos = {}
    character.offsetX = 0
    character.offsetY = 0
    character.power = 1
    character.maxPower = 3
    character.boundRad = 25
    character.damage = 0
    character.backpack = Backpack.new()
    character:belongTo(PHYSIC_CATEGORY_CHARACTER)
    character:collideWith(PHYSIC_CATEGORY_ENEMY, PHYSIC_CATEGORY_BULLET, PHYSIC_CATEGORY_ITEM, PHYSIC_CATEGORY_MISSILE, PHYSIC_CATEGORY_ASTEROID, PHYSIC_CATEGORY_VICTIM)
    character:setBody({type = "dynamic", isSensor = true, radius = character.boundRad})
    character.lifes = (options and options.lifes) or 0
    character.isDead = false
    character.isDefeated = false
    --physics.addBody(character, "dynamic", {isSensor = true, radius = character.boundRad, filter = {categoryBits=1, maskBits=character.maskBits}})
    --add control
    character.control = options and options.control
    if not character.control then
        character.control = Control.new(character, character.controlType, character.fingerSize, {
            func = function(target)
                --target.shield.x = target.x
                --target.shield.y = target.y
            end
        })

    end

    character.preCollision = function(self, event)
        --print("pre")
        if event.contact then
            --self:setLinearVelocity(0,0)
            event.contact.isEnabled = false
        else
            print("WTF")
        end
    end

    character.collision = function(self, event)
        print("hit! by "..event.other.name.."/"..event.other.type..":"..self.hp)
        if (event.other.type == "bullet" and event.other.fireTo == "character") or event.other.type == "enemy"then
            print("hit2 by "..event.other.name..":"..self.hp)
            if self.shield and self.shield.opened then
                print("shield is open, ignore")
                return
            end
            timer.performWithDelay( 1,
                function(e)
                    if not self.isDead then
                        self:onHurt(event.other.damage)
                    end
                end
            )
        elseif event.other.type == "item" and event.other.enabled then
            timer.performWithDelay( 1, function(e)
                if util.isExist(event.other) then
                    self:onItem(event.other)
                else
                    
                end
            end)
        end
    end

    function character:onHurt(damage)
        print("onHurt, ch damage "..damage)
        self.hp = self.hp - damage
        if self.hp < 0 then
            --self.isDead = true
            self:onDead()

        end
    end

    function character:onLifeChanged(lifes)
        print("remain "..lifes.." lifes")
    end

    function character:onScoreChanged(score)
        print("score update to "..self.score)
    end

    function character:onRespawn(x, y)
        --self.isDead = false
        --local newCharacter = Character.new(character)
        --self.parent:insert(newCharacter)
        print("Character die reopenShield")
        self:openShield(3000)
        --self.x = x
        --self.y = y
        --self:startControl()
        --self:autoShoot()
        print("Character die reopen fill hp")
        self.hp = self.maxHp
        --newCharacter.onLifeChanged = character.onLifeChanged
        --newCharacter.onScoreChanged = character.onScoreChanged
        --newCharacter.onGameOver = character.onGameOver
        --newCharacter.onRespawned = character.onRespawned
        --newCharacter.control.target = newCharacter

        self:onRespawned(self)
    end

    function character:onRespawned(newCharacter)

    end

    function character:equipGear()
        local gearlevel = {1,2,3}
        if self.gearLevel ~= self.power and self.power < self.maxPower then
            self:unEquipGear()
            if self.power == 1 then


            elseif self.power == 2 then


            elseif self.power == 3 then


            end
            self.gearLevel = self.power
        end
    end

    function character:onKill(victim)
        print("Kill "..victim.name)
        self:addScore(victim.score)
    end

    function character:unEquipGear()
        for i = 1, self.gear.numChildren do
            self.gear[i]:removeSelf()
        end
    end

    function character:shoot()
        if not util.isExist(self) then
            print("Don't shoot!")
            return
        end
        sfx:play("laser")
        if character.power <= 1 then
            --local bullet = Laser.new({fireTo = "enemy", owner = self})
            local bullet = Laser.new({fireTo = "enemy", owner = self})
            bullet.x = self.x
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)
            self.parent:insert(bullet)

        elseif character.power == 2 then
            local bullet = Laser.new({fireTo = "enemy", owner = self})
            self.parent:insert(bullet)
            bullet.x = self.x + 10
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)

            local bullet2 = Laser.new({fireTo = "enemy", owner = self})
            self.parent:insert(bullet2)
            bullet2.x = self.x - 10
            bullet2.y = self.y
            bullet2:setLinearVelocity(0, -2000)

        elseif character.power >=3 then
            local bullet = Laser.new({fireTo = "enemy", owner = self})
            self.parent:insert(bullet)
            bullet.x = self.x + 10
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)

            local bullet2 = Laser.new({fireTo = "enemy", owner = self})
            self.parent:insert(bullet2)
            bullet2.x = self.x
            bullet2.y = self.y
            bullet2:setLinearVelocity(0, -2000)

            local bullet3 = Laser.new({fireTo = "enemy", owner = self})
            self.parent:insert(bullet3)
            bullet3.x = self.x - 10
            bullet3.y = self.y
            bullet3:setLinearVelocity(0, -2000)
        end
        self:toFront()
    end

    function character:dropItems()
        for i, v in pairs(self.backpack:getItems()) do
            --local ItemClass = require(v.class)
            --local item = ItemClass.new(unpack(v.params))
            if not util.isExist(v) then
                logger:error(TAG, "!!!!!!!!!!!!!!!drop unExist item!!!!!!!!!!!!!!")
                backpack:remove(v)
            end
            local item = v
            if item.droppable then
                item.enabled = true
                --drop items, move them to the center
                item.x = display.contentWidth / 2
                item.y = display.contentHeight / 2
                item:dropped()
            end
        end
        self.backpack:clear()
    end

    function character:limitAttr()
        if self.power > self.maxPower then
            self.power = self.maxPower
        end
        if self.speed > self.maxSpeed then
            self.speed = self.maxSpeed
        end
    end

    function character:eatItem(item)
        print("eat item "..item.name)
        item:undoDrop()
        item.enabled = false
        transition.cancel(item)
        self.backpack:add(item)
        self._oldPower = self.power
        self._oldSpeed = self.speed
        self:updateAttr()
        item:effect(self)
        self:limitAttr()
        if item.score then
            self:addScore(item.score)
        end
        if self._oldPower == self.power and self._oldSpeed == self.speed then
            print("unuseful item, popup")
            self.backpack:remove(item)
            item:removeSelf()
        else
            --move them out of the screen, not destroy them directly
            --item:removeSelf()
            item.x = -500
            item.y = -500
        end
        print("Updated attr: "..self.power)
    end

    function character:updateAttr()
        for i, v in pairs(self.backpack:getItems()) do
            print("Update attr by item: "..v.name)
            print("attr: "..self.power..", "..self.speed)
            self.power = self.power + v.power
            self.speed = self.speed + v.speed
        end
    end

    function character:onItem(item)
        self:eatItem(item)
    end

    function character:openShield(duration)
        if not self.shield then
            self.shield = Shield.new()
            self.parent:insert(self.shield)
            self.shield.x = self.x
            self.shield.y = self.y
            move.stick(self.shield, self)
        end
        self.shield:open(duration)
    end

    function character:addScore(score)
        if score == 0 then
            return
        end
        self.score = self.score + score
        self:onScoreChanged(self.score)
    end

    function character:closeShield()
        self.shield:close()
    end

    function character:onDead()
        print("Character dead "..self.id)
        self:dropItems()
        --self.isDead = true
        --emit partical
        local effect = CircleExplosion.new({time = 1100})
        sfx:play("playerDead")
        if self.shield then
            --self.shield:clear()
            --self.shield:close()
        end
        effect.x = self.x
        effect.y = self.y
        self.parent:insert(effect)
        self.lifes = self.lifes - 1
        print("########### blink transition")
        local blinkCount = 0
        local blinkTransition = nil
        blinkTransition = transition.blink(self, {time = 500, onRepeat  = 
            function(event)
                print("onrepeat!!!!")
                blinkCount = blinkCount + 1
                if blinkCount >= 3 then
                    transition.cancel(blinkTransition)
                    self.alpha = 1
                end
            end
        })
        if self.lifes < 0 then
            print("Character is defeated")
            self.isDefeated = true
            self:cancelTimer()
            self:cancelControl()
            self:onGameOver()
            self.shield:clear()
            self:clear()
        else
            local respawnX, respawnY = self.x, self.y
            self:onLifeChanged(self.lifes)
            self:onRespawn(respawnX, respawnY)
        end
    end

    function character:onGameOver()

    end

    function character:autoShoot(enable)
        if enable == nil then
            enable = true
        end
        if enable then
            logger:debug(TAG, "Enable auto shoot")
            self.tid = self:addTimer(self.fireRate,
                function(event)
                    if self.x == nil then
                        print("Character is dead, stop shoot timer "..event.tid)
                        self:cancelTimer(event.tid)
                        return
                    end
                    self:shoot()
                end, -1)
            print("Shooting timer "..self.tid)
        else
            logger:debug(TAG, "disable auto shoot")
            if self.tid then
                self:cancelTimer(self.tid)
            end
        end
        self.enableAutoShoot = enable
    end



    function character:explode()

    end

    function character:toggleAutoShoot()
        self:autoShoot(not self.enableAutoShoot)
    end

    function character:powerUp()
        if character.shootLevel < 2 then
            character.shootLevel = character.shootLevel + 1
        end
    end

    function speedUp()
        if character.speed < 200 then
            character.speed = character.speed + 20
        end
    end

    function character:startControl()
        self.control:start()
    end

    function character:cancelControl()
        self.control:cancel()
    end

    character:enablePhysics()

    return character

end

return Character
