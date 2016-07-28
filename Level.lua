local logger = require("logger")
local sfx = require("sfx")
local TimerUtil = require("TimerUtil")
local TAG = "Level"
local Level = {}
local config = require("gameConfig")

Level.load = function()
    local level = {}
    --[[local level = 
    {
        {
            kind = "enemy", 
            time = 1000, 
            moves = {
                {
                    mode = "straight",
                    startPos = {x = 100, y = 0}, 
                    endPos = {x = 100, y = display.contentHeight},
                    time = 4000
                }
            },

            items = {
                {
                    kind = "powerup"
                }
            }
        },

    }
    return level--]]
    --level.vistedLevels = {}
    level.levels = {}
    level.levelCandidates = {}
    level.bossCandidates = {}
    level.currentSublevel = nil
    level.count = 0
    level.timerUtil = TimerUtil.new()
    level.fightsBeforeEncounterBoss = config.fightBeforeEncounterBoss
    --Reqire all level module
    for i, v in ipairs(config.gameLevels) do
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

    function level:init(scene, view, players, stageSpeed, game)
        self.players = players
        self.view = view
        self.scene = scene
        self.stageSpeed = stageSpeed
        self.game = game
    end

    function level:setPlayer(players)
        self.players = players
        self.currentSublevel:setPlayer(players)
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
        levelTitle.x = display.contentWidth/2
        levelTitle.y = display.contentHeight/2
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

    function level:startLevel()
        logger:info(TAG, "startLevel")
        --Get a random level from levels
        if #self.levelCandidates == 0  then
            logger:warn(TAG, "Repeat normal level")
            self:initLevelCandidate()
        end

        if #self.bossCandidates == 0  then
            self:initBossCandidate()
        end

        local idx = 0

        if (#self.bossCandidates > 0 and self.count == self.fightsBeforeEncounterBoss) or #self.levelCandidates == 0 then
            self.count = 0
            idx = self:pickupLevel(self.bossCandidates)
        elseif #self.levelCandidates > 0 then
            self.count = self.count + 1
            logger:debug(TAG, "normal levels before pick "..#self.levelCandidates)
            idx = self:pickupLevel(self.levelCandidates)
            logger:debug(TAG, "normal levels after pick "..#self.levelCandidates)
        end

        if idx == 0 then
            logger:warn(TAG, "no level found")
            return
        end

        self.levels[idx]:init(self.scene, self.view, self.players, self.stageSpeed, self.game, {
            onComplete = function()
                self:startLevel()
            end
        })
        --show the level name
        --boss fight
        if self.levels[idx].isBossFight then
            self.jsutBossFight = true
            sfx:fadeOut(sfx.CHANNEL_BG, 1000)
            local warningLevel = require("levels.level_bossfight_warning")
            warningLevel:init(self.scene, self.view, self.players, self.stageSpeed, self.game, {
                onComplete = function()
                    logger:debug(TAG, "Boss level %d", idx)
                    self.currentSublevel = self.levels[idx]
                    logger:debug(TAG, "play boss music")
                    self.changeSound = true
                    self.channelBossFightBg = sfx:play("bgBoss", {loops = -1})
                    self.levels[idx]:start()
                end
            })
            self.currentSublevel = warningLevel
            warningLevel:start({author = self.levels[idx].author, name = self.levels[idx].name})
        else
            logger:debug(TAG, "Normal level %d", idx)
            self.currentSublevel = self.levels[idx]
            self:showInfo()
            if self.changeSound then
                if sfx.channelBossFightBg then
                    sfx:fadeOut(sfx.channelBossFightBg, 1000)
                end
                sfx:play("bg", {loops = -1})
                self.changeSound = false
            end
            self.levels[idx]:start()
        end
    end

    function level:pause()
        self.timerUtil:pause()
        if self.currentSublevel then
            self.currentSublevel:pause()
        end
    end

    function level:resume()
        self.timerUtil:resume()
        if self.currentSublevel then
            self.currentSublevel:resume()
        end 
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
        logger:debug(TAG, "level:start")
        if options and options.delay then
            self.timerUtil:addTimer(options.delay, 
                function ()
                    logger:debug(TAG, "Continue to next level")
                    self:startLevel()
                end
            )
        else
            self:startLevel()
        end
        --self:startLevel()
    end

    return level

end

return Level