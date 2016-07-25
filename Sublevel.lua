local TimerUtil = require("TimerUtil")
local Sublevel = {}

Sublevel.new = function (name, author, options)
    local sublevel = {}
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = options and options.duration
    sublevel.isBossFight = options and options.isBossFight
    --sublevel.duration = options and options.duration or 30000

    function sublevel:init(scene, view, players, stageSpeed, game, options)
        self.timerUtil = TimerUtil.new()
        self.onComplete = options and options.onComplete
        self:setPlayer(players)
        self.stageSpeed = stageSpeed
        self.view = view        
        self.scene = scene
        self.game = game
        self._finished = false
    end

    function sublevel:setPlayer(players)
        self.players = players
        self.player = players[1]
        self.firstPlayer = players[1]
        self.secondPlayer = players[2]        
    end

    function sublevel:start(options)
        if self.duration then
            --print("Enable timer")
            self:addTimer(self.duration, 
                function()
                    --print("set finished")
                    self._finished = true
            end)
        end
        self:checkComplete()
        self:show(options)
    end

    function sublevel:show(options)

    end

    function sublevel:stop()
        print("sub level stop")
        self.timerUtil:clear()
        Runtime:removeEventListener( "enterFrame", self._check )
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

    function sublevel:isFinish()
        --print("finished? ",self._finished)
        if self._finished then
            return true
        end
        return false
    end

    function sublevel:getEnemies()
    
    end

    function sublevel:getEnemy()

    end

    function sublevel:insert(obj)
        self.view:insert(obj)
    end

    function sublevel:checkComplete()
        --print("Start check")
        self._check = function()
            --print("Check...")
            if self:isFinish() then
                --print("Sublevel complete")
                Runtime:removeEventListener( "enterFrame", self._check )
                if self.onComplete then
                    --print("Call oncomplete")
                    self.onComplete()
                    self:finish()
                end
            end
        end
        Runtime:addEventListener( "enterFrame", self._check )
    end

    function sublevel:finish()
        
    end

    setmetatable(sublevel, {
        __index = function (table, key)
            if key == "enemies" then
                --print("!!!!!! "..table.view.numChildren )
                local r = {}
                for i = 1, table.view.numChildren do
                    local obj = table.view[i]
                    if obj and obj.hasTag and obj:hasTag("enemy") then
                        r[#r+1] = obj
                    end
                end
                return r
            end
        end
    })


    return sublevel
end


return Sublevel 