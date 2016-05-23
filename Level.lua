local Level = {}
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
    level.currentSublevel = nil

    --Reqire all file in levels' folder
    --local subLevel = require("levels.bossLevel")
    local subLevel = require("levels.level_1")
    print("Author: "..subLevel.author)
    print("Sub level name: "..subLevel.name)
    level.levels[#level.levels+1] = subLevel

    function level:initLevelCandidate()
        self.levelCandidates = {}
        for i, v in ipairs(self.levels) do
            self.levelCandidates[i] = i
        end
    end

    function level:init(scene, view, players)
        self.players = players
        self.view = view
        self.scene = scene
    end

    function level:startLevel(idx)
        --Get a random level from levels
        if not idx then
            if #self.levelCandidates == 0  then
                self:initLevelCandidate()
            end

            local r = math.random(#self.levelCandidates)
            idx = self.levelCandidates[r]
            table.remove(self.levelCandidates, r)
        end
        self.currentSublevel = self.levels[idx]
        self.levels[idx]:init(self.scene, self.view, self.players, {
            onComplete = function()
                self:startLevel()
            end
        })
        --show the level name
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
        transition.to(levelTitle, {time = 500, alpha = 1, onComplete = function ()
            transition.to(levelTitle, {time = 800, alpha = 0, onComplete = function ()
                levelTitle:removeSelf()
            end})
        end})
        self.levels[idx]:start()
    end

    function level:pause()
        if self.currentSublevel then
            self.currentSublevel:pause()
        end
    end

    function level:resume()
        if self.currentSublevel then
            self.currentSublevel:resume()
        end 
    end

    function level:start()
        self:startLevel()
    end

    return level

end

return Level