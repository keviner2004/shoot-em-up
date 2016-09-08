local logger = require("logger")
local sfx = require("sfx")
local TimerUtil = require("TimerUtil")
local TAG = "Level"
local Level = {}
local gameConfig = require("gameConfig")

Level.load = function()
    local level = {}
    level.levels = {}
    level.levelCandidates = {}
    level.bossCandidates = {}
    level.currentSublevel = nil
    level.count = 0
    level.timerUtil = TimerUtil.new()
    level.fightsBeforeEncounterBoss = gameConfig.fightBeforeEncounterBoss
    --Reqire all level module
    for i, v in ipairs(gameConfig.gameLevels) do
        local subLevel = require("levels."..v)
        print("Author: "..subLevel.author)
        print("Sub level name: "..subLevel.name)
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
        local levelNameTxt = display.newText(string.format("%s", self.currentSublevel.name), 0, 0, "kenvector_future_thin", 35)
        local authorTxt = display.newText(string.format("%s", self.currentSublevel.author), 0, 0, "kenvector_future_thin", 35)
        levelNameTxt.x = 0
        levelNameTxt.y = -30
        authorTxt.x = 0
        authorTxt.y = 30
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
          logger:info(TAG, "startLevel %s", levelObj)
          self.currentSublevel = require("levels."..levelObj)
        else
          logger:info(TAG, "startLevel %s", levelObj.name)
          self.currentSublevel = levelObj
        end
        self.currentSublevel:init(self:getInitOptions({
            onComplete = options and options.onComplete
        }))
        if not self.currentSublevel.isBossFight then
          self:showInfo()
        end
        self.currentSublevel:start()
    end

    function level:startSingleLevel(level, options)
        self:startLevel(level, options)
    end

    function level:startInfiniteLevel()
        logger:info(TAG, "startInfiniteLevel")
        --Get a random level from levels
        if #self.levelCandidates == 0  then
            logger:warn(TAG, "Repeat normal level")
            self:initLevelCandidate()
        end

        if #self.bossCandidates == 0  then
            self:initBossCandidate()
        end
        logger:info(TAG, "#bossCandidates: %d, #levelCandidates: %d", #self.bossCandidates, #self.levelCandidates)
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
            logger:info(TAG, "normal levels before pick "..#self.levelCandidates)
            idx = self:pickupLevel(self.levelCandidates)
            logger:info(TAG, "normal levels after pick "..#self.levelCandidates)
        end

        if idx == 0 then
            logger:error(TAG, "no level found")
            return
        end

        self:startLevel(self.levels[idx], {
          onComplete = function()
              self:startInfiniteLevel()
          end
        })
    end

    function level:pause()
        logger:info(TAG, "Pause level")
        self.timerUtil:pause()
        if self.currentSublevel then
            logger:info(TAG, "Pause current sublevel")
            self.currentSublevel:pause()
        else
            logger:info(TAG, "no current sublevel need to be paused")
        end
        self.paused = true
    end

    function level:resume()
        self.timerUtil:resume()
        if self.currentSublevel then
            self.currentSublevel:resume()
        end
        self.paused = false
    end

    function level:stop()
        logger:info(TAG, "level:stop()")
        self.timerUtil:clear()
        self:clearLevelCandidate()
        self:clearBossCandidate()
        if self.currentSublevel then
            self.currentSublevel:stop()
        end
        self.count = 0
        self.stopped = true
    end

    function level:start(options)
        local delay = (options and options.delay) or 0
        logger:info(TAG, "level:start with delay: %d", delay)
        self.timerUtil:addTimer(delay,
            function ()
                if options and options.mode == gameConfig.MODE_SINGLE_LEVEL then
                    logger:info(TAG, "start single mode")
                    print("levelName~~~~~~~~~~~", options.levelName)
                    if not options.levelName then
                        logger:error(TAG, "Level name must be specified in single level mode")
                        return
                    end
                    self:startSingleLevel(options.levelName, options)
                else
                    self:startInfiniteLevel()
                end
                if self.currentSublevel and self.paused then
                    logger:info(TAG, "Pause lossing current sublevel")
                    self.currentSublevel:pause()
                end
            end
        )
    end

    return level
end

Level.goto = function(levelName, options)
    logger:info(TAG, "startLevel %s", levelName)
    self.currentSublevel = require("levels."..levelName)
    self.currentSublevel:init(self:getInitOptions({
        onComplete = options and options.onComplete
    }))
    self.currentSublevel:start()
end

return Level
