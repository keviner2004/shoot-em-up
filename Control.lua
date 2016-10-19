local enterFrame = require("enterFrame")
local util = require("util")
local gameConfig = require("gameConfig")

local Control = {}
local SIN, COS = {}, {}

for i = -360, 360 do
   SIN[i] = math.sin( math.pi / 180 * i )
   COS[i] = math.cos( math.pi / 180 * i )
end

Control.new = function(target, controlType, fingerSize, options)
    local control = {}
    control.controlType = controlType
    control.fingerSize = fingerSize * gameConfig.scaleFactor
    control.target = target
    control.offsetX = 0
    control.offsetY = 0
    control.enableFollowMove = false
    control.enableKeyMove = false
    control.pressKey = {}
    control.moveAngle = 0
    control.tmpTouchPos = {}
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
        local deltaY = pos2.y - pos1.y
        self.moveAngle = math.deg(math.atan2(deltaY, deltaX))
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
        --if event.keyName == "right" or event.keyName == "left" or event.keyName == "up" or event.keyName == "down" then
        if event.phase == "down" then
            self.pressKey[event.keyName] = true
            self.enableKeyMove = true
            if event.keyName == gameConfig.keyRight then
                self.offsetX = 5 * gameConfig.scaleFactor
            end
            if event.keyName == gameConfig.keyLeft then
                self.offsetX = -5 * gameConfig.scaleFactor
            end
            if event.keyName == gameConfig.keyUp then
                self.offsetY = -5 * gameConfig.scaleFactor
            end
            if event.keyName == gameConfig.keyDown then
                self.offsetY = 5 * gameConfig.scaleFactor
            end
            --print("enable move with key "..self.offsetX)
        elseif event.phase == "up" then
            self.pressKey[event.keyName] = false
            --local stopped = false
            if event.keyName == gameConfig.keyRight then
                self.offsetX = 0
            end
            if event.keyName == gameConfig.keyLeft then
                self.offsetX = 0
            end
            if event.keyName == gameConfig.keyUp then
                self.offsetY = 0
            end
            if event.keyName == gameConfig.keyDown then
                self.offsetY = 0
            end
            for k, v in pairs(self.pressKey) do
                return
            end
            self.enableKeyMove = false
        end
        --end

        if event.phase == "up" then
            if string.lower(event.keyName) == "p" then
                self.target:toggleAutoShoot()
            end
        end

        --return false
    end



    function control:enterFrame(event)
        --print("enterframe")
        if not util.isExists(self.target) then
            --character is removed
            --print(self.target.name.." is removed, detected by control")
            self:cancel()
            return
        end
        if self.target.paused then
            return
        end

        if self.enableFollowControl and self.enableFollowMove then
            if not self.touchPos then
                return
            end
            ----[[
            local touchX = self.touchPos.x - gameConfig.contentX
            local touchY = self.touchPos.y - self.fingerSize - gameConfig.contentY
            self.tmpTouchPos.x = touchX
            self.tmpTouchPos.y = touchY
            local targetX = self.target.x
            local targetY = self.target.y

            --self:getMoveAngle(self.target, self.touchPos)
            self:getMoveAngle(self.target, self.tmpTouchPos)

            local offsetY = 15 * gameConfig.scaleFactor * SIN[math.floor(self.moveAngle)] * (1 + (self.target.moveSpeed or 0))
            local offsetX = 15 * gameConfig.scaleFactor * COS[math.floor(self.moveAngle)] * (1 + (self.target.moveSpeed or 0))
            --local offsetX = 0
            --local offsetY = 0

            --local targetX, targetY = self.target:localToContent( 0, 0 )

            --print("pos test x: ", targetX, touchX, ", y:", targetY, touchY, "deg:", math.deg(self.moveAngle), "offset: ", offsetX)
            if targetX ~= touchX then
                if targetX < touchX and touchX + offsetX > touchX then
                    self.target.x = touchX
                elseif targetX > touchX and targetX + offsetX < touchX then
                    self.target.x = touchX
                else
                    self.target.x = self.target.x + offsetX
                end
            end

            if targetY ~= touchY then
                if targetY < touchY and targetY + offsetY > touchY then
                    self.target.y = touchY
                elseif targetY > touchY and targetY + offsetY < touchY then
                    self.target.y = touchY
                else
                    self.target.y = self.target.y + offsetY
                end
            end
            ----]]
        end
        if self.enableKeyControl and self.enableKeyMove then
            --print("move "..self.offsetX)
            self.target.x = self.target.x + self.offsetX * (1 + (self.target.moveSpeed or 0))
            self.target.y = self.target.y + self.offsetY * (1 + (self.target.moveSpeed or 0))
        end
        if self.target.x > gameConfig.contentWidth then
            self.target.x = gameConfig.contentWidth
        elseif self.target.x  < 0 then
            self.target.x = 0
        end
        if self.target.y > gameConfig.contentHeight then
            self.target.y = gameConfig.contentHeight
        elseif self.target.y  < 0 then
            self.target.y = 0
        end
        --if self.func then
            --self.func(self.target)
        --end
        --print("Set x y C:", event.time, target.x)
    end

    function control:start()
        if self.status == "started" then
           return
        end
        if self.enableFollowControl then
            Runtime:addEventListener("touch", self)
        end
        if self.enableKeyControl then
            Runtime:addEventListener( "key", self)
        end
        enterFrame:each(self, "control")
        self.status = "started"
    end

    function control:cancel()
        --print("cancel control")
        if self.enableFollowControl then
            Runtime:removeEventListener("touch", self)
            ---Runtime:removeEventListener("mouse", self)
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
