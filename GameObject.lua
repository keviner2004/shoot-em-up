local GameObject = {}
local Sprite = require("Sprite")
local TimerUtil = require("TimerUtil")
GameObject.new = function (options)
    local object = nil
    if options and options.gtype == "sprite" then
        object = Sprite.new(options.frames)
    else
        object = display.newGroup()
    end
    object.timerUtil = TimerUtil.new()
    object.paused = false
    object.shifting = 1

    function object:addTimer(delay, func, count)
        self.timerUtil:addTimer(delay, func, count)
    end

    function object:removeTimer(id)
       self.timerUtil:removeTimer(id) 
    end

    function object:freeze()
        self.paused = true
        transition.pause(self)
        self.timerUtil:pause()
    end

    function object:unfreeze()
        self.paused = false
        transition.resume(self)
        self.timerUtil:resume()
    end

    function object:slow()
        self.shifting = 0.5
    end

    return object
end

return GameObject