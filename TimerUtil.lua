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

    function timerUtil:getTimer(id)
        if self.timers[id] then
            return self.timers[id].t
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
            if self.timers[tid].c and self.timers[tid].c ~= -1 then
                self.timers[tid].c = self.timers[tid].c - count
            end
            func(evnet)
            if evnet.count == count then
                self:removeTimer(tid)
            end
        end, count)
        self.timers[tid] = {}
        self.timers[tid].t = t
        self.timers[tid].f = func
        self.timers[tid].d = delay
        self.timers[tid].c = count
        self.numOfTimers = self.numOfTimers + 1
        return tid
    end

    function timerUtil:removeTimer(id)
        --print("remove timer "..id)
        self.numOfTimers = self.numOfTimers - 1
        self.timers[id] = nil
    end

    function timerUtil:cancel(id)
        if id == nil then
            return
        end
        if not self:getTimer(id) then
            print("The timer is removed, id is "..id)
            return
        end
        timer.cancel(self:getTimer(id))
        self:removeTimer(id)
    end

    function timerUtil:clear()
        for i, v in pairs(self.timers) do
            --print("clear timer "..i)
            self:cancel(i)
        end
    end

    function timerUtil:pause(id)
        if id ~= nil then
            timer.pause(self:getTimer(id))
        else
            for i, v in pairs(self.timers) do
                timer.pause(v.t)
            end
        end
    end

    function timerUtil:resume(id)
        if id ~= nil then
            timer.resume(self:getTimer(id))
        else
            for i, v in pairs(self.timers) do
                timer.resume(v.t)
            end
        end
    end

    function timerUtil:slow(id, slow)
        local expiredTimers = {}
        local v = self.timers[id]
        local remaingTime = self:cancel(id)
        if remaingTime > 0 then
            if v.c and v.c ~= -1 then
                v.c = v.c - 1
            end
            self:addTimer(remaingTime * slow, v.f, v.c)
        end
        if v.c > 0 or v.c == -1 then
            self:addTimer(v.d * slow, v.f, v.c)
        end
    end

    return timerUtil
end
return TimerUtil