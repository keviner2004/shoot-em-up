local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local myLevel = Sublevel.new("9999999-061", "level name", "author name")

function myLevel:prepare()
    self._myFinishFlag = false
end

function myLevel:show(options)
    if self.gameMode == gameConfig.MODE_SINGLE_LEVEL then
        self:addTimer(5000, function()
            self._myFinishFlag = true
        end)
    elseif self.gameMode == gameConfig.MODE_INFINITE_LEVEL then
        self:addTimer(1000, function()
            self._myFinishFlag = true
        end)
    end
end

function myLevel:isFinish()
    return self._myFinishFlag
end

return myLevel
