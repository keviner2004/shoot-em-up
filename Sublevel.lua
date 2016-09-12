local sfx = require("sfx")
local TimerUtil = require("TimerUtil")
local EnterFrameUtil = require("EnterFrameUtil")
local logger = require("logger")
local GameObject = require("GameObject")
local gameConfig = require("gameConfig")
local Character = require("Character")
local Sublevel = {}

TAG = "Sublevel"
Sublevel.new = function (id, name, author, options)
    local sublevel = {}
    sublevel.id = id
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = options and options.duration
    sublevel.isBossFight = options and options.isBossFight

    function sublevel:init(options)
        self.enterFrame = EnterFrameUtil.new({owner = "sublevel"})
        self.timerUtil = TimerUtil.new()
        self.onComplete = options and options.onComplete
        self.onFail = options and options.onFail
        self:setPlayer(options and options.players)
        self.stageSpeed = options and options.stageSpeed
        self.view = options and options.view
        self.scene = options and options.scene
        self.game = options and options.game
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
        logger:info(TAG, "Pause sublevel!!!!!!!!!!!!!!!!!")
        self.paused = true
        self.timerUtil:pause()
    end

    function sublevel:resume()
        self.paused = false
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
        return self._finished
    end

    function sublevel:isFail()
      --print("1234", Character.totalLifes, gameConfig.numOfPlayers)
      if Character.totalLifes <= -gameConfig.numOfPlayers then
        logger:info(TAG, "isFail")
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
                logger:info(TAG, "==========Sublevel complete: %d", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)

                if self.onComplete then
                    self.onComplete({id = self.id})
                end
                self:finish()
            elseif self:isFail() then
                logger:info(TAG, "==========Sublevel fail: %d", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)
                if self.onFail then
                    self.onFail({id = self.id})
                end
                self:fail()
            end
        end
        --print("****************** Assign check task 1 *****************", self.enterFrame.numOfItems)
        self.enterFrame:each(_check)
        --print("****************** Assign check task 2 *****************", self.enterFrame.numOfItems)
    end

    function sublevel:finish()

    end

    function sublevel:fail()

    end

    function sublevel:showWarning(options)
      sfx:fadeOut(sfx.CHANNEL_BG, 1000)
      local onComplete = options and options.onComplete
      local count = 0
      --warnnig text
      self.game:showScore(false)
      local warning = GameObject.new()
      options.author = self.author
      options.name = self.name
      if options.author then
          local authorText = display.newText(options.author, gameConfig.contentWidth/2, gameConfig.contentHeight/2+120, "kenvector_future_thin", 30)
          warning:insert(authorText)
          authorText:setFillColor(1, 204/255, 0)
      end
      if options.name then
          local nameText = display.newText(options.name, gameConfig.contentWidth/2, gameConfig.contentHeight/2+150, "kenvector_future_thin", 30)
          warning:insert(nameText)
      end
      local warnigText1 = display.newText("==========================", gameConfig.contentWidth/2, gameConfig.contentHeight/2-60, "kenvector_future_thin", 80)
      local warnigText2 = display.newText("Warning!", gameConfig.contentWidth/2, gameConfig.contentHeight/2, "kenvector_future_thin", 80)
      local warnigText3 = display.newText("==========================", gameConfig.contentWidth/2, gameConfig.contentHeight/2+60, "kenvector_future_thin", 80)
      warnigText2:setFillColor( 1, 0, 0 )
      warning:insert(warnigText1)
      warning:insert(warnigText2)
      warning:insert(warnigText3)
      self.warningChannel = sfx:play("warning", {loops = -1})
      transition.blink(warning, {time = 2000, onRepeat =
          function (event)
          -- body
              count = count + 1
              if count == 4 then
                print("warning complete")
                warning:removeSelf()
                sfx:stop(self.warningChannel)
                sfx:play("bgBoss", {loops = -1})
                if onComplete then
                  onComplete()
                end
              end
      end})
      self.view:insert(warning)
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
