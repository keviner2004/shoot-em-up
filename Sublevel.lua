local TimerUtil = require("TimerUtil")
local EnterFrameUtil = require("EnterFrameUtil")
local Sublevel = {}
local logger = require("logger")

TAG = "Sublevel"
Sublevel.new = function (name, author, options)
    local sublevel = {}
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = options and options.duration
    sublevel.isBossFight = options and options.isBossFight
    --sublevel.duration = options and options.duration or 30000
    sublevel.enterFrame = EnterFrameUtil.new({owner = "sublevel"})

    function sublevel:init(scene, view, players, stageSpeed, game, options)
        self.timerUtil = TimerUtil.new()
        self.onComplete = options and options.onComplete
        self:setPlayer(players)
        self.stageSpeed = stageSpeed
        self.view = view        
        self.scene = scene
        self.game = game
        self.stopped = false
        self._finished = false
        self:create()
    end

    function sublevel:create()

    end

    function sublevel:setPlayer(players)
        self.players = players
        self.player = players[1]
        self.firstPlayer = players[1]
        self.secondPlayer = players[2]        
    end

    function sublevel:start(options)
        self.stopped = false
        logger:info(TAG, "sublevel:start")
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
        self.stopped = true
        self.timerUtil:clear()
        --print("****************** cancelAll check task 1 *****************", self.enterFrame.numOfItems)
        self.enterFrame:cancelAll()
        --print("****************** cancelAll check task 2 *****************", self.enterFrame.numOfItems)
        self:finish()
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
        local function _check()
            --print("_check!!!!!")
            if self.stopped then
                --print("Stop checking please 1: ", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)
                --print("Stop checking please 2: ", self.enterFrame.numOfItems)
                print("sublevel is canceled")
                self:finish()
                return
            end
            if self:isFinish() then
                print("Sublevel is complete!!!!!")
                self.enterFrame:cancel(_check)
                if self.onComplete then
                    logger:verbose(TAG, "==========Sublevel complete: %d", self.enterFrame.numOfItems)
                    --print("Call oncomplete")
                    self.onComplete()
                    self:finish()
                end
            end
        end
        --print("****************** Assign check task 1 *****************", self.enterFrame.numOfItems)
        self.enterFrame:each(_check)
        --print("****************** Assign check task 2 *****************", self.enterFrame.numOfItems)
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