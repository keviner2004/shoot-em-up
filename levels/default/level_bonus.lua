local gameConfig = require("gameConfig")
local move = require("move")
local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("9999999-007", "bonus level", "keviner2004", {duration = 10000})
local ScoreUp = require("items.ScoreUp")

--[[
    Astroid
--]]

function sublevel:addRuby(item, x, y, delay, destroyDelay)
    item.x = -500
    item.y = -500
    self:addTimer(delay, 
        function()
            item.x = x
            item.y = y
            item:setLinearVelocity( 0, self.stageSpeed)
            item:addTimer(destroyDelay,
                function ()
                    item:enableAutoDestroy()
                end)
            self.view:insert(item)
        end
    )
end

function sublevel:show(options)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 6, 0, 0, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 3, 0, 1000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4, 0, 1500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 3, 0, 2000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 2, 0, 2500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 2, 0, 3000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 , 0, 3500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 2, 0, 4000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 3, 0, 4500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 4, 0, 5000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 8, 0, 5500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 3, 0, 6000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4, 0, 6500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 3, 0, 7000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 4 * 2, 0, 7500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 2, 0, 8000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 , 0, 8500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 2, 0, 9000, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 5 * 3, 0, 9500, 1000)
    self:addRuby(ScoreUp.new(), gameConfig.contentWidth / 8 * 7, 0, 10000, 1000)
end

return sublevel