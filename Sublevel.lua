local TimerUtil = require("TimerUtil")
local Sublevel = {}

Sublevel.new = function (name, author, duration)
    local sublevel = {}
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = duration

    function sublevel:init(view, players, baseTime, onComplete)
        self.timerUtil = TimerUtil.new({baseTime = baseTime})
        self.onComplete = onComplete
        self.players = players
        self.player = players[1]
        self.firstPlayer = players[1]
        self.secondPlayer = players[2]
        self.view = view        
        --self:addTimer()
    end

    function sublevel:show(options)

    end

    function sublevel:pause()
        self.timerUtil:pause()
    end

    function sublevel:resume()
        self.timerUtil:resume()
    end

    function sublevel:addTimer(delay, func, count)
        if delay > self.duration then
            print("Warning, you can't add timer because the delay time exceeds the sublevel duration")
            return
        end
        self.timerUtil:addTimer(delay, func, count)
    end

    function sublevel:removeTimer(id)
       self.timerUtil:removeTimer(id) 
    end

    
    return sublevel
end


return Sublevel 