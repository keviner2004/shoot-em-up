local TimerUtil = {}
TimerUtil.new = function(options)
    local timerUtil = {}
    timerUtil.timers = {}
    timerUtil.timerId = 0
    timerUtil.maxTimers = 3000
    timerUtil.numOfTimers = 0
    timerUtil.baseTime = (options and options.baseTime) or 0

    function timerUtil:getTimerId()
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

    function timerUtil:addTimer(delay, func, count)
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
        local t = timer.performWithDelay(self.baseTime + delay, function(evnet)
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

    function timerUtil:removeTimer(id)
        --print("remove timer "..id)
        self.numOfTimers = self.numOfTimers - 1
        self.timers[id] = nil
    end

    function timerUtil:pause()
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

    function timerUtil:resume()
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

    return timerUtil
end
return TimerUtil