local GameObject = {}
local Sprite = require("Sprite")
GameObject.new = function (options)
    local object = nil
    if options and options.gtype == "sprite" then
        object = Sprite.new(options.frames)
    else
        object = display.newGroup()
    end

    object.timers = {}
    object.timerId = 0
    object.maxTimers = 3000
    object.numOfTimers = 0
    object.paused = false
    object.shifting = 1

    function object:getTimerId()
        local try = 0
        while true do
            try = try + 1
            self.timerId = self.timerId + 1
            if self.timerId <= self.maxTimers and not self.timers[self.timerId] then
                return self.timerId
            end
            if self.timerId > self.maxTimers then
                try = try - 1
                self.timerId = 0
            end
            
            if try > self.maxTimers then
                break
            end
        end
        return nil
    end

    function object:addTimer(delay, func, count)
        if not count then
            count = 1
        end
        if self.numOfTimers > self.maxTimers then
            --print("add timer fail")
            return
        end
        local tid = self:getTimerId()
        if not tid then
            --print("Fetch timerId fail")
            return nil
        end
        --print("add timer "..tid)
        local t = timer.performWithDelay(delay, function(evnet)
            --print("timer count: "..count.." / " ..evnet.count)
            func(evnet)
            if evnet.count == count then
                self:removeTimer(tid)
            end
        end, count)
        self.timers[tid] = t
        self.numOfTimers = self.numOfTimers + 1
        return tid
    end

    function object:removeTimer(id)
        --print("remove timer "..id)
        self.numOfTimers = self.numOfTimers - 1
        self.timers[id] = nil

    end

    function object:freeze()
        self.paused = true
        transition.pause(self)
        local expiredTimers = {}
        for i, v in pairs(self.timers) do
            if timer.pause(v) <= 0 then
                --print("Pause timer "..i.."fail")
                expiredTimers[#expiredTimers+1] = i
            end            
        end
        for i, v in pairs(expiredTimers) do
            --print("Cleanup!")
            self:removeTimer(v)
        end
    end

    function object:unfreeze()
        self.paused = false
        transition.resume(self)
        local expiredTimers = {}
        for i, v in pairs(self.timers) do
            if timer.resume(v) <= 0 then
                --print("Resume timer "..i.."fail")
                expiredTimers[#expiredTimers+1] = i
            end
        end
        for i, v in pairs(expiredTimers) do
            --print("Cleanup!")
            self:removeTimer(v)
        end
    end

    function object:slow()
        self.shifting = 0.5
    end

    return object
end

return GameObject