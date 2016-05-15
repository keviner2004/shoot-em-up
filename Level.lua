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
    local subLevel = require("levels.bossLevel")
    print("Author: "..subLevel.author)
    print("Sub level name: "..subLevel.name)
    level.levels[#level.levels+1] = subLevel

    function level:initLevelCandidate()
        self.levelCandidates = {}
        for i, v in ipairs(self.levels) do
            self.levelCandidates[i] = i
        end
    end

    function level:init(view, players)
        self.players = players
        self.view = view
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
        self.levels[idx]:init(self.view, self.players)
        self.levels[idx]:show({
            onComplete = function()
                self:startLevel()
            end
        })
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