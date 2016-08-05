local Character = {}
local gameConfig = require("gameConfig")
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
local Enemy = require("Enemy")
local id = 0
local sfx = require("sfx")
local logger = require("logger")
local CircleExplosion = require("effects.CircleExplosion")

local TAG = "Character"

Character.new = function (options)
    local character = GameObject.new()

    function character:init(options)
        self.power = (options and options.power) or 1
        self.defaultPower = self.power
        self.shootSpeed = (options and options.shootSpeed) or 0
        self.defaultShootSpeed = self.shootSpeed
    end

    character:addTag("character")
    character.gear = display.newGroup()
    id = id + 1
    character.id = id
    character.gearLevel = 0
    character.type = "character"
    character.name = "character"
    character.maxShootSpeed = 5
    character.minShootSpeed = 0
    character.maxFireRate = 1000
    character.fireRate = (options and options.fireRate) or 500
    character.fingerSize = (options and options.fingerSize) or 50
    character.controlType = (options and options.controlType) or "follow"
    character.hp = (options and options.hp) or 1
    character.maxHp = character.hp
    character.score = (options and options.score) or 0
    character.moveAngle = 0
    character.enableMove = false
    character.touchPos = {}
    character.offsetX = 0
    character.offsetY = 0
    character.maxPower = 5
    character.minPower = 1
    character.boundRad = 25
    character.damage = 0
    character.backpack = Backpack.new()
    character:belongTo(PHYSIC_CATEGORY_CHARACTER)
    character:collideWith(PHYSIC_CATEGORY_ENEMY, PHYSIC_CATEGORY_BULLET, PHYSIC_CATEGORY_ITEM, PHYSIC_CATEGORY_MISSILE, PHYSIC_CATEGORY_ASTEROID, PHYSIC_CATEGORY_VICTIM)
    character:setBody({type = "dynamic", isSensor = true, radius = character.boundRad})
    character.lifes = (options and options.lifes) or 0
    character.isDead = false
    character.isDefeated = false
    character.moveSpeed = 0
    character.maxMoveSpeed = 5
    character.minimumFireRate = 300
    character:init(options)
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
                if util.isExists(event.other) then
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
        self.isDead = false
        --self.isDead = false
        --local newCharacter = Character.new(character)
        --self.parent:insert(newCharacter)
        --print("Character die reopenShield")
        self:openShield(3000)
        --self.x = x
        --self.y = y
        --self:startControl()
        --self:autoShoot()
        --print("Character die reopen fill hp")
        self.hp = self.maxHp
        --newCharacter.onLifeChanged = character.onLifeChanged
        --newCharacter.onScoreChanged = character.onScoreChanged
        --newCharacter.onGameOver = character.onGameOver
        --newCharacter.onRespawned = character.onRespawned
        --newCharacter.control.target = newCharacter
        character:init(options)
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
        logger:debug(TAG, "Kill "..victim.name)
        self:addScore(victim.score)
    end

    function character:unEquipGear()
        for i = 1, self.gear.numChildren do
            self.gear[i]:removeSelf()
        end
    end

    function character:getFirstEnemy()
        for i = 1, self.parent.numChildren do
            if self.parent[i].hasTag and self.parent[i]:hasTag("enemy") then
                return parent[i]
            end
        end 
    end

    function character:createHomingLaser(x, y, vx, vy)
        local bullet = HomingLaser.new({fireTo = "enemy", owner = self})
        bullet.x = x
        bullet.y = y
        bullet:setLinearVelocity(vx, vy)
        self.parent:insert(bullet)
        return bullet
    end

    function character:createNormalLaser(x, y, vx, vy)
        local bullet = Laser.new({fireTo = "enemy", owner = self})
        bullet.x = x
        bullet.y = y
        bullet:setLinearVelocity(vx, vy)
        self.parent:insert(bullet)
        return bullet
    end


    function character:shootHomingLaser()
        local missiles = {}
        --shoot homing laser
        if self.power >= 5 then
            missiles[#missiles + 1] = self:createHomingLaser(self.x, self.y, 500, -500)
            missiles[#missiles + 1] = self:createHomingLaser(self.x, self.y, -500, -500)

        elseif self.power >= 4 then
            missiles[#missiles + 1] = self:createHomingLaser(self.x, self.y, -500, -500)
            --search enemy
        end
        local missileIdx = 1
        if #missiles <= 0 then
            --print("missile ", #missiles)
            return
        end

        local numOfEnemies = Enemy.backpack.numOfItems
        if numOfEnemies <= 0 then
            return
        end

        
        local missilePerEnemy = math.floor(#missiles / numOfEnemies)
        local remain = #missiles - missilePerEnemy * numOfEnemies
        --[[
        for i = 1, #missiles do
            for k, v in pairs(Enemy.backpack.items) do
                missiles[i]:seek(v)
                break
            end
        end
        --]]
        ----[[
        for k, v in pairs(Enemy.backpack.items) do
            --print("Handle enemy ", k)
            local remainCount = 0
            if remain > 0 then
                remainCount = 1
                remain = remain - 1
            end
            --print("missileIdx: ", missileIdx, missilePerEnemy, remainCount, numOfEnemies)
            for i = 1, missilePerEnemy + remainCount do
                missiles[missileIdx]:seek(v)
                missileIdx = missileIdx + 1
            end
        end
        ----]]
        self:toFront()
    end

    function character:shootNormalLaser()
        sfx:play("laser")        
        if character.power >=3 then
            local bullet = self:createNormalLaser(self.x + self.width/4, self.y, 0, -2000)
            local bullet2 = self:createNormalLaser(self.x, self.y, 0, -2000)
            local bullet3 = self:createNormalLaser(self.x - self.width/4, self.y, 0, -2000)
        elseif character.power >= 2 then
            local bullet = self:createNormalLaser(self.x + self.width/4, self.y, 0, -2000)
            local bullet2 = self:createNormalLaser(self.x - self.width/4, self.y, 0, -2000)
        else
            local bullet = self:createNormalLaser(self.x, self.y, 0, -2000)
        end
        self:toFront()
    end

    local shootCount = 0

    function character:shoot()
        if not util.isExists(self) then
            print("Don't shoot!")
            return
        end
        shootCount = shootCount + 1
        self:shootNormalLaser()
        if math.mod(shootCount, 2) == 0 then
            self:shootHomingLaser()
            shootCount = 0
        end
    end

    function character:dropItems()
        logger:info(TAG, "character dropItems:")
        for i, v in pairs(self.backpack:getItems()) do
            --local ItemClass = require(v.class)
            --local item = ItemClass.new(unpack(v.params))
            if v.name then
                logger:info(TAG, "character dropItem:", v.name)
            end
            if not util.isExists(v) then
                logger:error(TAG, "!!!!!!!!!!!!!!!drop unExist item!!!!!!!!!!!!!!")
                self.backpack:remove(v)
            end
            local item = v
            if item.droppable then
                item.enabled = true
                --drop items, move them to the center
                item.x = gameConfig.contentWidth / 2
                item.y = gameConfig.contentHeight / 2
                item:dropped(self)
            end
        end
        self.backpack:clear()
    end

    function character:limitAttr(attr)
        if not attr then
            attr = self
        end
        if attr.power > self.maxPower then
            attr.power = self.maxPower
        end
        if attr.power < self.minPower then
            attr.power = self.minPower
        end
        if attr.shootSpeed > self.maxShootSpeed then
            attr.shootSpeed = self.maxShootSpeed
        end
        if attr.shootSpeed < self.minShootSpeed then
            attr.shootSpeed = self.minShootSpeed
        end
    end

    function character:needAddItemToBackup()

    end

    function character:doesAttrChange(attr)
        if not attr then
            attr = self
        end
        if attr.power == self.power and attr.shootSpeed == self.shootSpeed then
            return false
        end
        return true
    end

    function character:testUpdateAttr(item)
        local result = {}
        result.power = self.power
        result.shootSpeed = self.shootSpeed
        result.power = result.power + item.power
        result.shootSpeed = result.shootSpeed + item.shootSpeed

        self:limitAttr(result)

        result.change = self:doesAttrChange(result)
        print("change!!!!!!!!!!!!!!!", result.change)
        return result
    end

    function character:updateAttr(result)

    end

    function character:reCalculateAttr()
        self.power = self.defaultPower
        self.shootSpeed = self.defaultShootSpeed
        for i, v in pairs(self.backpack:getItems()) do
            print("attr: "..self.power..", "..self.shootSpeed)
            self.power = self.power + v.power
            self.shootSpeed = self.shootSpeed + v.shootSpeed
            logger:info(TAG, "Update attr by item: %s, power: %d, shootSpeed: %d", v.name, v.power, v.shootSpeed)
        end
        self:limitAttr()
    end

    function character:eatItem(item)
        logger:info(TAG, "Eat item "..item.name)
        item:undoDrop()
        item.enabled = false
        transition.cancel(item)
        --take effect
        if item:needKeep(self) then
            self:applyItem(item)
            self:putItem(item)
        else
            --logger:info(TAG, "Apply~~ "..item.name)
            self:applyItem(item)
            --logger:info(TAG, "Clear~~ "..item.name)
            item:clear()
            --logger:info(TAG, "Clear done~~ "..item.name)
        end
        --logger:info(TAG, "Yammy~~ "..item.name)
    end

    function character:putItem(item)
        self.backpack:add(item)
        --move them out of the screen, not destroy them directly
        item.x = -500
        item.y = -500
    end

    function character:applyItem(item)
        item:effect(self)
        --add attribute
        if item.score then
            self:addScore(item.score)
        end
        self.shootSpeed = self.shootSpeed + item.shootSpeed
        self.power = self.power + item.power
        self:limitAttr()
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
        self:onScoreChanged(self.score, score)
    end

    function character:closeShield()
        self.shield:close()
    end

    function character:onLoseLifes()
        self.lifes = self.lifes - 1
    end

    function character:getLifes()
        return self.lifes
    end

    function character:onDead()
        if not self.parent then
            logger:error( TAG, "Character dead but can not found the body")
            return
        end
        print("Character dead "..self.id)
        self:dropItems()
        self.isDead = true
        --emit partical
        local effect = CircleExplosion.new({time = 1100})
        effect:start()
        sfx:play("playerDead")
        if self.shield then
            --self.shield:clear()
            --self.shield:close()
        end
        effect.x = self.x
        effect.y = self.y
        self.parent:insert(effect)
        self:onLoseLifes()
        --print("########### blink transition")
        local blinkCount = 0
        local blinkTransition = nil
        blinkTransition = transition.blink(self, {time = 500, onRepeat  = 
            function(event)
                --print("onrepeat!!!!")
                blinkCount = blinkCount + 1
                if blinkCount >= 3 then
                    transition.cancel(blinkTransition)
                    self.alpha = 1
                end
            end
        })
        if self:getLifes() < 0 then
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

    function character:reStartAutoShoot()
        self:toggleAutoShoot()
        self:toggleAutoShoot()
    end

    function character:autoShoot(enable)
        if enable == nil then
            enable = true
        end
        if enable then
            logger:debug(TAG, "Enable auto shoot")
            local actualFireRate = self.fireRate - self.shootSpeed * 50
            if actualFireRate < self.minimumFireRate then
                actualFireRate = self.minimumFireRate
            end
            self.tid = self:addTimer(actualFireRate,
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
        if character.shootSpeed < 200 then
            character.shootSpeed = character.shootSpeed + 20
        end
    end

    function character:startControl()
        self.control:start()
    end

    function character:cancelControl()
        self.control:cancel()
    end

    return character
end

return Character
