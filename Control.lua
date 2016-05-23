local Control = {}

Control.new = function(target, controlType, fingerSize)
    local control = {}
    control.controlType = controlType
    control.fingerSize = fingerSize
    control.target = target

    function control:getMoveAngle(pos1, pos2)
        local deltaX = pos2.x - pos1.x
        local deltaY = pos2.y - self.fingerSize - pos1.y
        self.moveAngle = math.atan2(deltaY, deltaX)
    end

    function control:touch( event )
        if self.target.x == nil then
            print(self.target.name.." is removed")
            --Runtime:removeEventListener("touch", self.target)
            return
        end
        if event.phase == "began" then
            --followTouchPos(self, event)
            self.enableMove = true
            self.touchPos = event
            self:getMoveAngle(self.target, event)
        elseif event.phase == "moved" then
            --cancelTouchPos()
            --followTouchPos(self, event)
            --print("["..count.."]".."touchPos.x: "..self.touchPos.x..", y: "..self.touchPos.y)
            self.touchPos = event
            self:getMoveAngle(self.target, event)
        elseif event.phase == "ended" then
            self.enableMove = false
            --cancelTouchPos()
        end
    end

    function control:key( event )
        local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
        --print(message)
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

    function control:enterFrame(event)
        --character is removed
        if self.target.x == nil or self.target.isDead then
            return
        end
        if self.controlType == "follow" and self.enableMove then
            local offsetY = 30 * math.sin(self.moveAngle) * (1 + (self.target.speed or 0))
            local offsetX = 30 * math.cos(self.moveAngle) * (1 + (self.target.speed or 0))
            local targetY = self.touchPos.y - self.fingerSize
            --print("offsetX: "..offsetX)
            --print("offsetY: "..offsetY.."/"..targetY.."/"..self.y.."/"..math.deg(self.moveAngle))

            if self.target.x ~= self.touchPos.x then
                if self.target.x < self.touchPos.x and self.target.x + offsetX > self.touchPos.x then
                    self.target.x = self.touchPos.x
                elseif self.target.x > self.touchPos.x and self.target.x + offsetX < self.touchPos.x then
                    self.target.x = self.touchPos.x
                else
                    self.target.x = self.target.x + offsetX
                end
            end
            
            local oriY = self.target.y - self.fingerSize
            if self.target.y ~= targetY then
                if self.target.y < targetY and self.target.y + offsetY > targetY then
                    self.target.y = targetY
                elseif self.target.y > targetY and self.target.y + offsetY < targetY then
                    self.target.y = targetY
                else
                    self.target.y = self.target.y + offsetY    
                end 
            end
        elseif self.controlType == "key"  then
            self.target.x = self.target.x + self.offsetX * (1 + (self.target.speed or 0))
            self.target.y = self.target.y + self.offsetY * (1 + (self.target.speed or 0))
        end
        if self.target.x > display.contentWidth then
            self.target.x = display.contentWidth
        elseif self.target.x  < 0 then
            self.target.x = 0
        end
        if self.target.y > display.contentHeight then
            self.target.y = display.contentHeight
        elseif self.target.y  < 0 then
            self.target.y = 0
        end
    end

    function control:start()
        if self.status == "started" then
           return 
        end
        if self.controlType == "follow" then
            Runtime:addEventListener("touch", self)
        elseif self.controlType == "key" then
            Runtime:addEventListener( "key", self)
        end
        Runtime:addEventListener( "enterFrame", self)
        self.status = "started"
    end

    function control:cancel()
        if self.controlType == "follow" then
            Runtime:removeEventListener("touch", self)
        elseif self.controlType == "key" then
            Runtime:removeEventListener( "key", self)
        end
        Runtime:removeEventListener( "enterFrame", self)
        self.status = "canceled"
    end


    return control
end

return Control