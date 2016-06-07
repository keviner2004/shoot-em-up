local GameObject = {}
local move = require("move")
local Sprite = require("Sprite")
local TimerUtil = require("TimerUtil")
GameObject.new = function (options)
    local object = nil
    if options and options.frames then
        object = Sprite.new(options.frames, options)
    else
        object = display.newGroup()
    end
    object.timerUtil = TimerUtil.new()
    object.type = "gameobject"
    object.neme = "gameobject"
    object.paused = false
    object.shifting = 1
    object.autoDestroy = false
    object._tags = {}

    function object:hasTag(tag)
        for i, v in ipairs(self._tags) do
            if v == tag then
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
        self.autoDestroy =true
        self._b_enterFrame = function(event)
            if not self.x then
                --print("Game object removed")
                Runtime:removeEventListener( "enterFrame", self._b_enterFrame )
                return 
            end
            if self.paused then
                return
            end
            --print("Check is out???")
            if self.autoDestroy and move.isOut(self) then
                --print("Gameobject auto destroy: "..self.name)
                Runtime:removeEventListener( "enterFrame", self._b_enterFrame )
                self:clear()
            end
        end
        Runtime:addEventListener( "enterFrame", self._b_enterFrame )
    end

    function object:disableAutoDestroy()
        self.autoDestroy = false
        Runtime:removeEventListener( "enterFrame", self._b_enterFrame )
    end

    function object:addTimer(delay, func, count)
        return self.timerUtil:addTimer(delay, func, count)
    end

    function object:cancelTimer(id)
       self.timerUtil:cancel(id) 
    end

    function object:clear()
       self.timerUtil:clear() 
       transition.cancel(self)
       self:removeSelf()
    end

    function object:freeze()
        self.paused = true
        transition.pause(self)
        self.timerUtil:pause()
        if self.numChildren then
            for i = 1, self.numChildren do
                if self[i].freeze then
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
                if self[i].unfreeze then
                    self[i]:unfreeze()
                end
            end
        end
    end

    function object:slow()
        self.shifting = 0.5
    end

    object:addTag("gameobject")

    return object
end

return GameObject