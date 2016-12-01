local logger = require("logger")
local dbHelper = require("dbHelper")
local sfx = require("sfx")
local TimerUtil = require("TimerUtil")
local ScaleText = require("ui.ScaleText")
local TAG = "Level"
local Level = {}
local gameConfig = require("gameConfig")

Level.currentLevelId = -1

Level.load = function()
    local level = {}
    level.levels = {}
    level.activeSublevelSet = {}
    level.levelCandidates = {}
    level.bossCandidates = {}
    level.currentSublevel = nil
    level.count = 0
    level.timerUtil = TimerUtil.new()
    level.fightsBeforeEncounterBoss = gameConfig.fightBeforeEncounterBoss
    --Reqire all level module
    for i, v in ipairs(gameConfig.gameLevels) do
        local subLevel = require("levels."..v)
        logger:debug(TAG, "Author: "..subLevel.author)
        logger:debug(TAG, "Sub level name: "..subLevel.name)
        level.levels[#level.levels+1] = subLevel
    end

    function level:initLevelCandidate()
        self.levelCandidates = {}
        for i, v in ipairs(self.levels) do
            if not v.isBossFight then
                table.insert(self.levelCandidates, i)
            end
        end
        logger:debug(TAG, "numOfNormalLevel: %d", #self.levelCandidates)
    end

    function level:initBossCandidate()
        self.bossCandidates = {}
        for i, v in ipairs(self.levels) do
            if v.isBossFight then
                table.insert(self.bossCandidates, i)
            end
        end
        logger:debug(TAG, "numOfBossLevel: %d", #self.bossCandidates)
    end

    function level:clearLevelCandidate()
        self.levelCandidates = {}
    end

    function level:clearBossCandidate()
        self.bossCandidates = {}
    end

    function level:init(options)
        self.players = options and options.players
        self.view = options and options.view
        self.scene = options and options.scene
        self.stageSpeed = options and options.stageSpeed
        self.game = options and options.game
    end

    function level:getInitOptions(options)
        local defaultOptions = {
            players = self.players,
            view = self.view,
            scene = self.scene,
            stageSpeed = self.stageSpeed,
            game = self.game,
        }
        for k, v in pairs(options) do
            defaultOptions[k] = v
        end
        return defaultOptions
    end

    function level:showInfo()
        local levelTitle = display.newGroup()
        local levelNameTxt = ScaleText.new({
          text = string.format("%s", self.currentSublevel.name),
          x = 0,
          y = 0,
          font = "kenvector_future_thin",
          fontSize = 17
        })
        local authorTxt = ScaleText.new({
          text = string.format("%s", self.currentSublevel.author),
          x = 0,
          y = 0,
          font = "kenvector_future_thin",
          fontSize = 17
        })
        levelNameTxt.x = 0
        levelNameTxt.y = -levelNameTxt.height/2
        authorTxt.x = 0
        authorTxt.y = authorTxt.height / 2
        levelTitle:insert(levelNameTxt)
        levelTitle:insert(authorTxt)
        levelTitle.x = gameConfig.contentWidth/2
        levelTitle.y = gameConfig.contentHeight/2
        self.view:insert(levelTitle)
        levelTitle.alpha = 0
        --Show sublevel's infomation at start
        transition.to(levelTitle, {time = 500, alpha = 1, onComplete =
            function ()
                transition.to(levelTitle, {time = 800, alpha = 0, onComplete =
                    function ()
                        levelTitle:removeSelf()
                end})
        end})
    end

    function level:pickupLevel(levels)
        local r = math.random(#levels)
        local idx = levels[r]
        table.remove(levels, r)
        return idx
    end

    function level:startLevel(levelObj, options)
        if type(levelObj) == "string" then
          logger:debug(TAG, "startLevel %s", levelObj)
          self.currentSublevel = require("levels."..levelObj)
        else
          logger:debug(TAG, "startLevel %s", levelObj.name)
          self.currentSublevel = levelObj
        end
        if not self.currentSublevel.inited then
            self.currentSublevel:init(self:getInitOptions({
                onComplete = options and options.onComplete,
                onFail = options and options.onFail
            }))
        end
        self.currentSublevel.gameMode = options.gameMode
        self.currentSublevel:initEverytime()
        if not self.currentSublevel.isBossFight then
          self:showInfo()
        end
        self.activeSublevelSet[self.currentSublevel] = true
        self.currentSublevel:start()
    end

    function level:startSingleLevel(subLevel, options)
        if not option then
            option = {}
        end
        self:startLevel(subLevel, {
            onComplete = function(event)
              if options and options.onComplete then
                self:updatePlayLog(self.game.globalScore, 1)
                options.onComplete(event)
              end
            end,
            onFail = function(event)
              if options and options.onFail then
                self:updatePlayLog(self.game.globalScore, 0)
                options.onFail(event)
              end
            end
            ,gameMode = gameConfig.MODE_SINGLE_LEVEL
        })
        self:addPlayLog()
    end

    function level:startInfiniteLevel(options)
        if not option then
            option = {}
        end
        self:addPlayLog(gameConfig.ID_LEVEL_INFINITE)
        self:_startInfiniteLevel({
            onComplete = options and options.onComplete,
            onFail = function(event)
              if options and options.onFail then
                self:updatePlayLog(self.game.globalScore, 0)
                options.onFail(event)
              end
            end,
        })
    end

    function level:addPlayLog(levelId)
        levelId = levelId or self.currentSublevel.id
        self.levelStartTime = os.time(os.date("!*t"))
        self.playId = dbHelper:addPlayLog(levelId)
        Level.currentLevelId = levelId
    end

    function level:updatePlayLog(score, cleared)
        self.levelEndTime = os.time(os.date("!*t"))
        self.levelPlayDuration = self.levelEndTime - self.levelStartTime
        dbHelper:updatePlayLog(self.playId, {
            duration = self.levelPlayDuration,
            startTime = os.date('%Y-%m-%d %H:%M:%S', self.levelStartTime),
            score = score,
            cleared = cleared
        })
        dbHelper:syncPlayLogs()
    end

    function level:_startInfiniteLevel(options)
        logger:debug(TAG, "_startInfiniteLevel")
        --Get a random level from levels
        if #self.levelCandidates == 0  then
            --logger:warn(TAG, "Repeat normal level")
            self:initLevelCandidate()
        end

        if #self.bossCandidates == 0  then
            self:initBossCandidate()
        end
        logger:debug(TAG, "#bossCandidates: %d, #levelCandidates: %d", #self.bossCandidates, #self.levelCandidates)
        if #self.bossCandidates == 0 and #self.levelCandidates == 0 then
            logger:error(TAG, "No levels are found")
            return
        end

        local idx = 0

        if #self.bossCandidates > 0 and #self.levelCandidates == 0 then
            self.count = 0
            idx = self:pickupLevel(self.bossCandidates)
        elseif (#self.bossCandidates > 0 and self.count == self.fightsBeforeEncounterBoss) or #self.levelCandidates == 0 then
            self.count = 0
            idx = self:pickupLevel(self.bossCandidates)
        elseif #self.levelCandidates > 0 then
            self.count = self.count + 1
            logger:debug(TAG, "normal levels before pick "..#self.levelCandidates)
            idx = self:pickupLevel(self.levelCandidates)
            logger:debug(TAG, "normal levels after pick "..#self.levelCandidates)
        end

        if idx == 0 then
            logger:error(TAG, "no level found")
            return
        end

        self:startLevel(self.levels[idx], {
          onComplete = function()
                self:_startInfiniteLevel(options)
          end,
          onFail = options and options.onFail,
          gameMode = gameConfig.MODE_INFINITE_LEVEL
        })
    end

    function level:pause()
        logger:debug(TAG, "Pause level")
        self.timerUtil:pause()
        for k, v in pairs(self.activeSublevelSet) do
            --logger:error(TAG, "pause level %s in the active level", k.id)
            k:pause()
        end
        self.paused = true
    end

    function level:resume()
        self.timerUtil:resume()
        for k, v in pairs(self.activeSublevelSet) do
            --logger:error(TAG, "resume level %s in the active level", k.id)
            k:resume()
        end
        self.paused = false
    end

    function level:stop()
        logger:debug(TAG, "level:stop()")
        self.timerUtil:clear()
        self:clearLevelCandidate()
        self:clearBossCandidate()
        for k, v in pairs(self.activeSublevelSet) do
            --logger:error(TAG, "stop level %s in the active level", k.id)
            k:stop()
        end
        self.activeSublevelSet = {}
        self.count = 0
        self.stopped = true
    end

    function level:start(options)
        local delay = (options and options.delay) or 0
        logger:debug(TAG, "level:start with delay: %d", delay)
        self.timerUtil:addTimer(delay,
            function ()
                if options and options.mode == gameConfig.MODE_SINGLE_LEVEL then
                    logger:debug(TAG, "start single mode")
                    --print("levelName~~~~~~~~~~~", options.levelName)
                    if not options.levelName then
                        logger:error(TAG, "Level name must be specified in single level mode")
                        return
                    end
                    self:startSingleLevel(options.levelName, options)
                else
                    self:startInfiniteLevel(options)
                end
                if self.currentSublevel and self.paused then
                    logger:debug(TAG, "Pause lossing current sublevel")
                    self.currentSublevel:pause()
                end
            end
        )
    end

    return level
end

Level.goto = function(levelName, options)
    logger:debug(TAG, "startLevel %s", levelName)
    self.currentSublevel = require("levels."..levelName)
    self.currentSublevel:init(self:getInitOptions({
        onComplete = options and options.onComplete
    }))
    self.currentSublevel:start()
end

return Level
