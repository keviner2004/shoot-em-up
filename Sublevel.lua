local TimerUtil = require("TimerUtil")
local Sublevel = {}

Sublevel.new = function (name, author, options)
    local sublevel = {}
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = options and options.duration or 30000

    function sublevel:init(scene, view, players, options)
        self.timerUtil = TimerUtil.new()
        self.onComplete = options and options.onComplete
        self.players = players
        self.player = players[1]
        self.firstPlayer = players[1]
        self.secondPlayer = players[2]
        self.view = view        
        self.scene = scene
    end

    function sublevel:start()
        self:addTimer(self.duration, function()
            if options and options.onComplete then
                options.onComplete()
            end
        end)
        self:show()        
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
        self.timerUtil:addTimer(delay, func, count)
    end

    function sublevel:removeTimer(id)
       self.timerUtil:removeTimer(id) 
    end
    return sublevel
end


return Sublevel 