local sfx = require("sfx")
local TimerUtil = require("TimerUtil")
local EnterFrameUtil = require("EnterFrameUtil")
local logger = require("logger")
local GameObject = require("GameObject")
local gameConfig = require("gameConfig")
local Character = require("Character")
local ScaleText = require("ui.ScaleText")
local LinearGroup = require("ui.LinearGroup")
local Sublevel = {}
local TAG = "Sublevel"

Sublevel.new = function (id, name, author, options)
    local sublevel = {}
    sublevel.id = id
    sublevel.name = name
    sublevel.author = author
    sublevel.duration = options and options.duration
    sublevel.isBossFight = options and options.isBossFight
    sublevel.bg = options and options.bg or "bg"

    function sublevel:initEverytime()
        self.stopped = false
        self._finished = false
        self:prepare()
    end

    function sublevel:init(options)
        if self.inited then
          return
        end
        self.enterFrame = EnterFrameUtil.new({owner = "sublevel"})
        self.managerObject = display.newGroup()
        self.timerUtil = TimerUtil.new()
        self.onComplete = options and options.onComplete
        self.onFail = options and options.onFail
        self:setPlayer(options and options.players)
        self.stageSpeed = options and options.stageSpeed
        self.view = options and options.view
        self.scene = options and options.scene
        self.game = options and options.game
        --logger:error(TAG, "init:new something")
        self.inited = true
        self:create()
    end

    function sublevel:prepare()
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
        --sfx:fadeOut(sfx.CHANNEL_BG, 1000)
        if sfx.channel[sfx.CHANNEL_BG] ~= self.bg then
          --print("Play~~~~~", self.bg)
          sfx:play(self.bg, {loops = -1})
        end
        self.stopped = false
        logger:debug(TAG, "sublevel:start")
        self:show(options)
        if self.duration then
            self:addTimer(self.duration,
                function()
                    self._finished = true
                end
            )
        end
        self:checkComplete()
    end

    function sublevel:show(options)

    end

    function sublevel:stop()
        --logger:error(TAG, "delete something")
        --print("sub level stop")
        self.stopped = true
        self.managerObject:removeSelf()
        self.timerUtil:clear()
        --print("****************** cancelAll check task 1 *****************", self.enterFrame.numOfItems)
        self.enterFrame:cancelAll()
        --print("****************** cancelAll check task 2 *****************", self.enterFrame.numOfItems)
        self:dispatchFinishEvent()
        self:finish()
        self.inited = false
    end

    function sublevel:pause()
        logger:debug(TAG, "Pause sublevel!!!!!!!!!!!!!!!!!")
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
      --check players lifes
      for i = 1, #self.players do
        if self.players[i] and self.players[i].lifes >= 0 then
          return false
        end
      end
      --if Character.totalLifes < 0 then
      --  logger:debug(TAG, "isFail")
      --  return true
      --end
      return true
    end

    function sublevel:getEnemies()

    end

    function sublevel:getEnemy()

    end

    function sublevel:insert(obj)
        if self.view then
          self.view:insert(obj)
        else
          logger:error(TAG, "You cannot insert game objects when the game is not already started. Maybe you are using a timer to add game objects after the game is finished")
        end
    end
    function sublevel:checkComplete()
        local function _check()
            --print("_check!!!!!")
            if self.stopped then
                --print("Stop checking please 1: ", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)
                --print("Stop checking please 2: ", self.enterFrame.numOfItems)
                self:dispatchFinishEvent()
                self:finish()
                return
            end
            if self:isFinish() then
                logger:debug(TAG, "==========Sublevel complete: %d", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)
                self:dispatchFinishEvent()
                self:finish()
                if self.onComplete then
                    self.onComplete({id = self.id})
                end
            elseif self:isFail() then
                logger:debug(TAG, "==========Sublevel fail: %d", self.enterFrame.numOfItems)
                self.enterFrame:cancel(_check)
                self:dispatchFailEvent()
                self:fail()
                if self.onFail then
                    self.onFail({id = self.id})
                end
            end
        end
        --print("****************** Assign check task 1 *****************", self.enterFrame.numOfItems)
        self.enterFrame:each(_check)
        --print("****************** Assign check task 2 *****************", self.enterFrame.numOfItems)
    end

    function sublevel:dispatchFinishEvent()
      self.managerObject:dispatchEvent({
        name = "level",
        phase = "finish"
      })
    end

    function sublevel:dispatchFailEvent()
      self.managerObject:dispatchEvent({
        name = "level",
        phase = "fail"
      })
    end

    function sublevel:addEventListener(eventName, listener)
      self.managerObject:addEventListener(eventName, listener)
    end

    function sublevel:removeEventListener(eventName, listener)
      self.managerObject:removeEventListener(eventName, listener)
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
      local hgroup = LinearGroup.new()
      local vgroup = LinearGroup.new({
        layout = LinearGroup.VERTICAL
      })

      local warnigText1 = ScaleText.new({
        text = "==========================",
        font = "kenvector_future_thin",
        fontSize = 40
      })
      local warnigText2 = ScaleText.new({
        text = "Warning!",
        font = "kenvector_future_thin",
        fontSize = 40})
      local warnigText3 = ScaleText.new({
        text = "==========================",
        font = "kenvector_future_thin",
        fontSize = 40
      })
      warnigText2:setFillColor( 1, 0, 0 )
      vgroup:insert(warnigText1)
      vgroup:insert(warnigText2)
      vgroup:insert(warnigText3)

      options.author = self.author
      options.name = self.name
      if options.author then
          local authorText = ScaleText.new({
            text = options.author,
            font = "kenvector_future_thin",
            fontSize = 15
          })
          vgroup:insert(authorText)
          authorText:setFillColor(1, 204/255, 0)
      end
      if options.name then
          local nameText = ScaleText.new({
            text = options.name,
            font = "kenvector_future_thin",
            fontSize = 15
          })
          vgroup:insert(nameText)
      end
      warning:insert(vgroup)
      vgroup:resize()
      warning.x = gameConfig.contentWidth/2
      warning.y = gameConfig.contentHeight/2
      self.warningChannel = sfx:play("warning", {loops = -1})
      local function blink(event)
            -- body
            count = count + 1
            if count == 4 then
              sfx:stop(self.warningChannel)
              sfx:play((options and options.bg) or self.bg, {loops = -1})
              if onComplete then
                onComplete()
              end
              transition.cancel(warning)
              warning:clear()
            end
        end
      transition.blink(warning, {time = 2000, onRepeat = blink})
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
