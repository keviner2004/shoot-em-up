local enterFrame = require("enterFrame")
local util = require("util")
local Control = {}

Control.new = function(target, controlType, fingerSize, options)
    local control = {}
    control.controlType = controlType
    control.fingerSize = fingerSize
    control.target = target
    control.offsetX = 0
    control.offsetY = 0
    control.enableFollowMove = false
    control.enableKeyMove = false
    control.pressKey = {}
    if options and options.func then
        control.func = options.func
    end

    if control.controlType == "key" then
        control.enableKeyControl = true
    elseif control.controlType == "follow" then
        control.enableFollowControl = true
    elseif control.controlType == "both" then
        control.enableKeyControl = true
        control.enableFollowControl = true
    end

    function control:getMoveAngle(pos1, pos2)
        local deltaX = pos2.x - pos1.x
        local deltaY = pos2.y - self.fingerSize - pos1.y
        self.moveAngle = math.atan2(deltaY, deltaX)
    end

    function control:touch( event )
        if event.phase == "began" then
            --followTouchPos(self, event)
            self.enableFollowMove = true
            self.touchPos = event
            --self:getMoveAngle(self.target, event)
        elseif event.phase == "moved" then
            --cancelTouchPos()
            --followTouchPos(self, event)
            --print("["..count.."]".."touchPos.x: "..self.touchPos.x..", y: "..self.touchPos.y)
            self.touchPos = event
            --self:getMoveAngle(self.target, event)
        elseif event.phase == "ended" then
            self.enableFollowMove = false
            --cancelTouchPos()
        end
    end

    function control:key( event )
        if event.keyName == "right" or event.keyName == "left" or event.keyName == "up" or event.keyName == "down" then
            if event.phase == "down" then 
                self.pressKey[event.keyName] = true
                self.enableKeyMove = true
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
                print("enable move with key "..self.offsetX)
            elseif event.phase == "up" then
                self.pressKey[event.keyName] = false
                --local stopped = false
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
                for k, v in pairs(self.pressKey) do
                    return
                end
                self.enableKeyMove = false
            end
        end

        if event.phase == "up" then
            if string.lower(event.keyName) == "p" then
                self.target:toggleAutoShoot()
            end
        end

        --return false
    end



    function control:enterFrame(event)
        --print("enterframe")
        if not util.isExist(self.target) then
            --character is removed
            print(self.target.name.." is removed, detected by control")
            self:cancel()
            return
        end
        
        if self.enableFollowControl and self.enableFollowMove then
            if not self.touchPos then
                return
            end
            self:getMoveAngle(self.target, self.touchPos)
            local offsetY = 30 * math.sin(self.moveAngle) * (1 + (self.target.speed or 0))
            local offsetX = 30 * math.cos(self.moveAngle) * (1 + (self.target.speed or 0))

            local targetY = self.touchPos.y - self.fingerSize

            if self.lastTouchX then
                self.touchDiffX = self.touchPos.x - self.lastTouchX
                self.mouseDiffX = self.mousePos.x - self.lastMouseX
            end
            if self.lastTouchY then
                self.touchDiffY = self.touchPos.y - self.lastTouchY
                self.mouseDiffY = self.mousePos.y - self.lastMouseY
            end
            self.lastTouchX = self.touchPos.x
            self.lastTouchY = self.touchPos.y
            self.lastMouseX = self.mousePos.x
            self.lastMouseY = self.mousePos.y
            
            --print("Diff test: ", self.touchDiffX, self.mouseDiffX)
            if self.touchDiffX ~= self.mouseDiffX then
                
            end
            --print("pos test x: ", self.target.x, self.touchPos.x, ", y:", self.target.y, self.touchPos.y, "deg:", math.deg(self.moveAngle))
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
        end
        if self.enableKeyControl and self.enableKeyMove then
            --print("move "..self.offsetX)
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
        if self.func then
            self.func(self.target)
        end
        --print("Set x y C:", event.time, target.x)
    end

    function control:mouse(event)
        --print("mouse:", event.x)
        self.mousePos = event
    end

    function control:start()
        if self.status == "started" then
           return 
        end
        if self.enableFollowControl then
            Runtime:addEventListener("touch", self)
            Runtime:addEventListener("mouse", self)
        end
        if self.enableKeyControl then
            Runtime:addEventListener( "key", self)
        end
        enterFrame:each(self, "control")
        --Runtime:addEventListener("enterFrame", self)
        self.status = "started"
    end

    function control:cancel()
        print("cancel control")
        if self.enableFollowControl then
            Runtime:removeEventListener("touch", self)
            Runtime:removeEventListener("mouse", self)
        end
        if self.enableKeyControl then
            Runtime:removeEventListener( "key", self)
        end
        enterFrame:cancel(self)
        self.status = "canceled"
    end


    return control
end

return Control