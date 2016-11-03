local GameObject = {}
local move = require("move")
local Sprite = require("Sprite")
local TimerUtil = require("TimerUtil")
local gameConfig = require("gameConfig")
local EnterFrameUtil = require("EnterFrameUtil")
local util = require("util")
local logger = require("logger")

GameObject.new = function (options)
    local object = nil
    local TAG = "GameObject"
    if options and options.frames then
        object = Sprite.new(options.frames, options)
    else
        object = display.newGroup()
    end
    object.timerUtil = TimerUtil.new()
    object.type = "gameobject"
    object.name = "gameobject"
    object.paused = false
    object.shifting = 1
    object.autoDestroy = false
    object._tags = {}
    object.body = {}
    object.categoryBits = 0
    object.maskBits = 0
    object.bodyInited = false
    object.bodyType = "dynamic"
    object.enterFrame = EnterFrameUtil.new({owner = object.name})
    object.dir = 90
    object.immuneGravityField = true

    function object:init()
    end

    function object:hasTag(tag)
        for i = 1, #self._tags do
            --print("Cmapare!!!!! "..self._tags[i])
            if self._tags[i] == tag then
                return true
            end
        end
    end

    function object:addTag(tag)
       self._tags[#self._tags+1] = tag
    end

    function object:getTags()
        return self._tags
    end

    function object:getTag(idx)
        if not idx then
            return self._tags[#self._tags]
        end
        return self._tags[idx]
    end

    --destroy object when it is out of the screen
    function object:enableAutoDestroy()
        --print("enableAutoDestroy")
        if self.autoDestroy then
            logger:warn(TAG, "auto destroy was already on")
            return
        end
        self.autoDestroy = true
        self._b_enterFrame = function(event)
            if not self.x then
                --print("Game object removed")
                self.enterFrame:cancel(self._b_enterFrame)
                return
            end
            if self.paused then
                return
            end
            --print("Check is out???")
            if move.isOut(self) then
                --print("GameObject auto destroy: "..self.name)
                --print("before2", self.m_enterFrame)
                self.enterFrame:cancel(self._b_enterFrame)
                --print("after2", self.m_enterFrame)
                self:clear()
            end
        end
        self.enterFrame:each(self._b_enterFrame)
    end

    function object:disableAutoDestroy()
        self.autoDestroy = false
        if self._b_enterFrame then
            self.enterFrame:cancel(self._b_enterFrame)
        end
    end

    function object:addTimer(delay, func, count, tag)
        return self.timerUtil:addTimer(delay, func, count, tag)
    end

    function object:cancelTimer(id)
       self.timerUtil:cancel(id)
    end

    function object:cancel()
        self.timerUtil:clear()
        self.enterFrame:cancelAll()
        self.stopped = true
        transition.cancel(self)
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i] and self[i].cancel then
                    self[i]:cancel()
                end
            end
        end
    end

    function object:destroy()
        self:removeSelf()
    end

    function object:unCancel()
        self.stopped = false
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i] and self[i].unCancel then
                    self[i]:unCancel()
                end
            end
        end
    end

    function object:clear()
        --print("Clear "..self.name)
        self.timerUtil:clear()
        self:removeSelf()
        self.enterFrame:cancelAll()
        self.stopped = true
        transition.cancel(self)
        self:onClear()
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i] and self[i].clear then
                    --print("clear child "..self[i].name)
                    self[i]:clear()
                end
            end
        end
    end

    function object:onClear()

    end

    function object:callWhenInStage(func)
        local function checkOnStage()
            if not move.isOut(self) then
                func()
                self.enterFrame:cancel(checkOnStage)
            end
        end
        self.enterFrame:each(checkOnStage)
    end

    function object:autoDestroyWhenInTheScreen()
        self:callWhenInStage(
            function()
                self:enableAutoDestroy()
            end
        )
    end

    function object:freeze()
        self.paused = true
        transition.pause(self)
        self.timerUtil:pause()
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i] and self[i].freeze then
                    self[i]:freeze()
                end
            end
        end
    end

    function object:unfreeze()
        self.paused = false
        transition.resume(self)
        self.timerUtil:resume()
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i] and self[i].unfreeze then
                    self[i]:unfreeze()
                end
            end
        end
    end

    function object:away()
        self.x = -1000
        self.y = -1000
    end

    function object:slow()
        self.shifting = 0.5
    end

    function object:setName(name)
        self.name = name
        self.enterFrame:setOwner(name)
    end

    function object:setBody(body)
        if body.type then
            self.bodyType = body.type
        end
        local _b = {}
        if type(body) == "function" then
            _b = body(self)
        else
            _b = body
        end
        for k, v in pairs(_b) do
            --print("body "..k)
            self.body[k] = v
        end
    end

    function object:belongTo(what)
        self.categoryBits = what
    end

    function object:collideWith(...)
        local collides = {...}
        for i, v in ipairs(collides) do
            if type(v) == "table" then
                self.maskBits = self.maskBits + v.categoryBits
            else
                self.maskBits = self.maskBits + v
            end
        end
    end

    function object:addPhysics()
        if self.bodyInited then
            logger:warn(TAG, "Physics body is already enaled")
            return
        end

        --print("addPhysics")
        self.body.filter = {
            categoryBits = self.categoryBits,
            maskBits = self.maskBits
        }
        physics.addBody( self, self.bodyType, self.body )
        self:addEventListener( "collision", self )
        self:addEventListener( "preCollision", self )
        self.bodyInited = true
    end

    function object:removePhysics()
        if not self.bodyInited then
            logger:warn(TAG, "Physics body is already removed")
            return
        end
        --print("remove physics")
        physics.removeBody(self)
        self:removeEventListener( "collision", self )
        self:removeEventListener( "preCollision", self )
        self.bodyInited = false
    end

    function object:enablePhysics(enable)
        if enable or enable == nil then
            self:addPhysics()
        else
            self:removePhysics()
        end
    end

    function object:reInitPhysics()
        self:enablePhysics(false)
        self:enablePhysics(true)
    end

    function object:setScaleLinearVelocity(vx, vy)
        if self.setLinearVelocity then
            self:setLinearVelocity(vx * gameConfig.scaleFactor, vy * gameConfig.scaleFactor)
        end
    end

    function object:insertToParent(obj)
        if not util.isExists(obj) then
            logger:warn(TAG, "insertToParent because the object does not exist")
            return
        end
        if not util.isExists(self.parent) then
            logger:warn(TAG, "insertToParent fail because parent does not exist")
            return
        end
        self.parent:insert(obj)
    end

    function object:enableAutoRotation()
        if self._autoRotation then
            logger:warn(TAG, "auto rotation was already enabled")
        end
        self._autoRotation = function()
            if not util.isExists(self) then
                return true
            end
            if self.getLinearVelocity then
                self:rotateByVelocity()
            else
                return true
            end
        end
        self.enterFrame:each(self._autoRotation)
    end

    function object:rotateTo(deg)
        self.rotation = self.dir - deg
    end

    function object:rotateByVelocity()
        if self.getLinearVelocity then
            local vx, vy = self:getLinearVelocity()
            local degree = math.deg(math.atan2(vy, vx))
            self:rotateTo(-degree)
        end
    end

    function object:disableAutoRotation()
        if self._autoRotation then
            self.enterFrame:cancel(self._autoRotation)
            self._autoRotation = nil
        end
    end

    object:addTag("gameobject")

    return object
end

return GameObject
