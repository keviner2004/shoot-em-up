local Character = {}
local Control = require("Control")
local Bullet = require("Bullet")
local Sprite = require("Sprite")
local PowerUp = require("items.PowerUp")
local SpeedUp = require("items.SpeedUp")
local ShieldUp = require("items.ShieldUp")
local move = require("move")
local Backpack = require("Backpack")
local id = 0
Character.new = function (options)
    local character = display.newGroup()
    id = id + 1
    character.id = id
    character:insert(display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("playerShip3_red")}}))
    character.type = "character"
    character.name = "character"
    character.speed = options and options.speed
    character.maxSpeed = 3
    character.fireRate = options and options.fireRate
    character.fingerSize = options and options.fingerSize
    character.controlType = (options and options.controlType) or "follow"
    character.hp = (options and options.hp) or 1
    character.score = (options and options.score) or 0
    character.moveAngle = 0
    character.enableMove = false
    character.touchPos = {}
    character.offsetX = 0
    character.offsetY = 0
    character.power = 2
    character.maxPower = 3
    character.boundRad = 25
    character.backpack = Backpack.new()
    character.maskBits = PHYSIC_CATEGORY_ENEMY+PHYSIC_CATEGORY_BULLET+PHYSIC_CATEGORY_ITEM+PHYSIC_CATEGORY_MISSILE
    character.lifes = (options and options.lifes) or 0
    character.isDead = false
    physics.addBody(character, "dynamic", {isSensor = true, radius = character.boundRad, filter = {categoryBits=1, maskBits=character.maskBits}})
    --add control
    character.control = options and options.control
    if not character.control then
        character.control = Control.new(character, character.controlType, character.fingerSize)
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
        print("hit by "..event.other.name.."/"..event.other.type..":"..self.hp)
        if (event.other.type == "bullet" and event.other.fireTo == "character") or event.other.type == "enemy" then 
            print("hit2 by "..event.other.name..":"..self.hp)
            if self.shield then
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
                self:onItem(event.other)
            end)
        end
    end

    character:addEventListener("preCollision", character)
    character:addEventListener("collision", character)

    function character:onHurt(damage)
        --print("onHurt, ch damage "..damage)
        self.hp = self.hp - damage
        if self.hp < 0 then
            self.isDead = true
            self:onDead()
        end
    end

    function character:onLifeChanged(lifes)
        print("remain "..lifes.." lifes")
    end

    function character:onRespawn(x, y)
        local newCharacter = Character.new(character)
        self.parent:insert(newCharacter)
        newCharacter:openShield(3000)
        newCharacter.x = x
        newCharacter.y = y
        newCharacter:startControl()
        newCharacter:autoShoot()
        newCharacter.onLifeChanged = character.onLifeChanged
        newCharacter.onGameOver = character.onGameOver
        newCharacter.onRespawned = character.onRespawned
        newCharacter.control.target = newCharacter
        self:onRespawned(newCharacter)
    end

    function character:onRespawned(newCharacter)

    end

    function character:shoot()
        if character.power <= 1 then  
            local bullet = Bullet.new({fireTo = "enemy"})
            bullet.x = self.x
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)
            self.parent:insert(bullet)

        elseif character.power == 2 then
            local bullet = Bullet.new({fireTo = "enemy"})
            self.parent:insert(bullet)
            bullet.x = self.x + 10
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)

            local bullet2 = Bullet.new({fireTo = "enemy"})
            self.parent:insert(bullet2)
            bullet2.x = self.x - 10
            bullet2.y = self.y
            bullet2:setLinearVelocity(0, -2000)

        elseif character.power >=3 then
            local bullet = Bullet.new({fireTo = "enemy"})
            self.parent:insert(bullet)
            bullet.x = self.x + 10
            bullet.y = self.y
            bullet:setLinearVelocity(0, -2000)

            local bullet2 = Bullet.new({fireTo = "enemy"})
            self.parent:insert(bullet2)
            bullet2.x = self.x
            bullet2.y = self.y
            bullet2:setLinearVelocity(0, -2000)

            local bullet3 = Bullet.new({fireTo = "enemy"})
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
            local item = v
            if item.droppable then
                item.enabled = true
                --drop items, move them to the center
                item.x = display.contentWidth / 2
                item.y = display.contentHeight / 2
                math.randomseed(os.time())
                local degree = math.random(0, 360)
                local vx = math.cos(math.rad(degree))*10
                local vy = math.cos(math.rad(degree))*10
                print("random move items ", vx, vy)
                item:setLinearVelocity(vx , vy)
                item:addTimer(5000, function()
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
        item.enabled = false
        transition.cancel(item)
        self.backpack:add(item)
        self._oldPower = self.power
        self._oldSpeed = self.speed
        self:updateAttr()
        item:effect(self)
        self:limitAttr()
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
        self.shield = Sprite.new({
                "Effects/shield3",
                "Effects/shield2",
                "Effects/shield1", 
                "Effects/shield3"
            }, {time = 600})
        self:insert(self.shield)
        self.shield:play()

        physics.removeBody(character)
        physics.addBody(character, "dynamic", {isSensor = true, radius = self.shield.width/2, filter = {categoryBits=1, maskBits=character.maskBits}})

        if duration and duration > 0 then
            timer.performWithDelay(duration, function()
                self:closeShield()
            end)
        end

    end

    function character:closeShield()
        physics.removeBody(character)
        physics.addBody(character, "static", {radius = self.boundRad, filter = {categoryBits=1, maskBits=character.maskBits}})
        transition.to(self.shield, {time = 300, alpha = 0, onComplete = function()
            self.shield:removeSelf()
            self.shield = nil
        end})
    end

    function character:onDead()
        print("Character dead "..self.id)
        self:dropItems()
        self.isDead = true
        --emit partical
        local num = 6
        for i = 0, num - 1 do
            local partical = Sprite.new("Particles/particleYellow_3")
            partical.x = self.x
            partical.y = self.y
            partical.xScale = 0.2
            partical.yScale = 0.2
            move.toward(partical, {degree = 360 / ( num ) * i})
            transition.to(partical, {time = 300, alpha = 0})
        end
        self.lifes = self.lifes - 1
        transition.to(self, {time = 500, alpha = 0, onComplete = function()
            self:removeSelf()
        end})
        if self.lifes < 0 then
            self:onGameOver()
        else
            local respawnX, respawnY = self.x, self.y
            self:onLifeChanged(self.lifes)
            timer.performWithDelay(300, function()
                self:onRespawn(respawnX, respawnY)
            end)
        end
    end

    function character:onGameOver()

    end

    function character:autoShoot()
        timer.performWithDelay( self.fireRate, 
            function(event)
                if self.x == nil then
                    print("Character is dead, stop shoot")
                    timer.cancel(event.source)
                    return
                end
                self:shoot()
            end, -1)
    end

    function character:explode()

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

    return character

end

return Character