local Character = {}
local Bullet = require("Bullet")
Character.new = function (params)
    local character = display.newGroup()
    character:insert(display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("playerShip3_red")}}))
    character.type = "character"
    character.name = "character"
    character.speed = params.speed
    character.fireRate = params.fireRate
    character.fingerSize = params.fingerSize
    character.controlType = params.controlType or "follow"
    character.collision = function(self, event)
        if event.other.type == "item" then
            self:onItem(event.other)
        end
    end
    character.moveAngle = 0
    character.enableMove = false
    character.touchPos = {}
    character.offsetX = 0
    character.offsetY = 0
    character.shootLevel = 0
    character:addEventListener("collision", character)
    physics.addBody(character, "dynamic", {radius = 25, filter = {categoryBits=1, maskBits=16}})
    function character:shoot()
        if character.shootLevel <= 1 then  
            local bullet = Bullet.new()
            bullet.x = self.x
            bullet.y = self.y
            transition.to(bullet,  {
                y = 0,
                time = 500,
                onComplete = function(obj)
                    display.remove(bullet)
                end
            })
        elseif character.shootLevel >= 2 then

            local bullet = Bullet.new()
            bullet.x = self.x + 10
            bullet.y = self.y
            transition.to(bullet,  {
                y = 0,
                time = 500,
                onComplete = function(obj)
                    display.remove(bullet)
                end
            })

            local bullet2 = Bullet.new()
            bullet2.x = self.x - 10
            bullet2.y = self.y
            transition.to(bullet2,  {
                y = 0,
                time = 500,
                onComplete = function(obj)
                    display.remove(bullet2)
                end
            })

        end
    end

    function character:onItem(item)
        if item.name == "powerup" then
            self:powerUp()
        end
        item:got()
    end

    function character:openShield()
        self.shield = display.newSprite( myImageSheet , {
            frames={
                sheetInfo:getFrameIndex("Effects/shield3"),
                sheetInfo:getFrameIndex("Effects/shield2"),
                sheetInfo:getFrameIndex("Effects/shield1"), 
                sheetInfo:getFrameIndex("Effects/shield3")
            },
            time = 600
        })
        self:insert(self.shield)
        self.shield:play()
    end

    function character:autoShoot()
        timer.performWithDelay( self.fireRate, 
            function()
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
        if character.maxSpeed < 200 then
            character.maxSpeed = character.maxSpeed + 20 
        end
    end

    function character:getMoveAngle(obj, pos)
        local deltaX = pos.x - obj.x
        local deltaY = pos.y - obj.y  
        self.moveAngle = math.atan2(deltaY, deltaX)
        --print("move angle: "..math.deg(moveAngle))
    end

    function character:startControl()
        Runtime:addEventListener( "enterFrame", function(event)
            if self.controlType == "follow" and self.enableMove then
                local offsetY = 30 * math.sin(self.moveAngle)
                local offsetX = 30 * math.cos(self.moveAngle)
                --print("offsetX: "..offsetX)
                --print("offsetY: "..offsetY)

                if self.x ~= self.touchPos.x then
                    if self.x < self.touchPos.x and self.x + offsetX > self.touchPos.x then
                        self.x = self.touchPos.x
                    elseif self.x > self.touchPos.x and self.x + offsetX < self.touchPos.x then
                        self.x = self.touchPos.x
                    else
                        self.x = self.x + offsetX
                    end
                end
                if self.y ~= self.touchPos.y then
                    if self.y < self.touchPos.y and self.y + offsetY > self.touchPos.y then
                        self.y = self.touchPos.y
                    elseif self.y > self.touchPos.y and self.y + offsetY < self.touchPos.y then
                        self.y = self.touchPos.y
                    else
                        self.y = self.y + offsetY    
                    end 
                end
            elseif self.controlType == "key"  then
                self.x = self.x + self.offsetX
                self.y = self.y + self.offsetY
            end
        end)
        local count = 0
        if self.controlType == "follow" then
            Runtime:addEventListener("touch", function ( event )
                if event.phase == "began" then
                    --followTouchPos(self, event)
                    self.enableMove = true
                    self.touchPos = event
                    self:getMoveAngle(self, event)

                elseif event.phase == "moved" then
                    --cancelTouchPos()
                    --followTouchPos(self, event)
                    count = count + 1
                    --print("["..count.."]".."touchPos.x: "..self.touchPos.x..", y: "..self.touchPos.y)
                    self.touchPos = event
                    self:getMoveAngle(self, event)
                elseif event.phase == "ended" then
                    self.enableMove = false
                    --cancelTouchPos()
                end
            end)
        elseif self.controlType == "key" then
            Runtime:addEventListener( "key", function (event)
                self:onKeyEvent(event)
            end )
        end
    end

    function character:onKeyEvent( event )
        local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
        print(message)
        if event.keyName == "right" or event.keyName == "left" or event.keyName == "up" or event.keyName == "down" then
            if event.phase == "down" then
                print("enable move")
                self.enableMove = true
                if event.keyName == "right" then
                    self.offsetX = 10
                end
                if event.keyName == "left" then
                    self.offsetX = -10
                end
                if event.keyName == "up" then
                    self.offsetY = -10
                end
                if event.keyName == "down" then
                    self.offsetY = 10
                end
            elseif event.phase == "up" then
                self.enableMove = false
                if event.keyName == "right" then
                    self.offsetX = 0
                end
                if event.keyName == "left" then
                    self.offsetX = 0
                end
                if event.keyName == "up" then
                    self.offsetY = 0
                end
                if event.keyName == "down" then
                    self.offsetY = 0
                end
            end
        end
        return false
    end

    function followTouchPos(obj, pos)
        local t = math.sqrt((pos.x - mainCharacter.x)^2 + (pos.y - fingerSize - mainCharacter.y)^2 ) / mainCharacter.speed * 1000
        print ("transition.to touch pos")
        transition.to(obj, {
            x = pos.x, 
            y = pos.y - fingerSize, 
            tag = "follow",
            time = t
        })
    end

    function cancelTouchPos()
        transition.cancel("follow")
    end

    return character

end

return Character