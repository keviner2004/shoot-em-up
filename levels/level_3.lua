local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("3-st level", "keviner2004", {duration = 10000})
local BrownBig1 = require("asteroids.BrownBig1")
local BrownBig2 = require("asteroids.BrownBig2")
local BrownBig3 = require("asteroids.BrownBig3")
local BrownBig4 = require("asteroids.BrownBig4")
local BrownMed1 = require("asteroids.BrownMed1")
local BrownMed2 = require("asteroids.BrownMed2")
local BrownSmall1 = require("asteroids.BrownSmall1")
local BrownSmall2 = require("asteroids.BrownSmall2")
local BrownTiny1 = require("asteroids.BrownTiny1")
local BrownTiny2 = require("asteroids.BrownTiny2")
local GreyBig1 = require("asteroids.GreyBig1")
local GreyBig2 = require("asteroids.GreyBig2")
local GreyBig3 = require("asteroids.GreyBig3")
local GreyBig4 = require("asteroids.GreyBig4")
local GreyMed1 = require("asteroids.GreyMed1")
local GreyMed2 = require("asteroids.GreyMed2")
local GreySmall1 = require("asteroids.GreySmall1")
local GreySmall2 = require("asteroids.GreySmall2")
local GreyTiny1 = require("asteroids.GreyTiny1")
local GreyTiny2 = require("asteroids.GreyTiny2")

--[[
    Astroid
--]]

function sublevel:addAstroid(astroid, x, y, delay, destroyDelay)
    astroid.x = -500
    astroid.y = -500
    self:addTimer(delay, 
        function()
            astroid.x = x
            astroid.y = y
            astroid:setLinearVelocity( 0, self.stageSpeed)
            astroid:addTimer(destroyDelay,
                function ()
                    astroid:enableAutoDestroy()
                end)
            self.view:insert(astroid)
        end
    )
end

function sublevel:show(options)
    self:addAstroid(BrownBig1.new(), display.contentWidth / 6, 0, 0, 1000)
    self:addAstroid(BrownBig2.new(), display.contentWidth / 4 * 3, 0, 1000, 1000)
    self:addAstroid(BrownBig3.new(), display.contentWidth / 4, 0, 1500, 1000)
    self:addAstroid(BrownBig4.new(), display.contentWidth / 4 * 3, 0, 2000, 1000)
    self:addAstroid(BrownMed1.new(), display.contentWidth / 4 * 2, 0, 2500, 1000)
    self:addAstroid(BrownMed2.new(), display.contentWidth / 5 * 2, 0, 3000, 1000)
    self:addAstroid(BrownSmall1.new(), display.contentWidth / 5 , 0, 3500, 1000)
    self:addAstroid(BrownSmall2.new(), display.contentWidth / 5 * 2, 0, 4000, 1000)
    self:addAstroid(BrownTiny1.new(), display.contentWidth / 5 * 3, 0, 4500, 1000)
    self:addAstroid(BrownTiny2.new(), display.contentWidth / 5 * 4, 0, 5000, 1000)
    self:addAstroid(GreyBig1.new(), display.contentWidth / 8, 0, 5500, 1000)
    self:addAstroid(GreyBig2.new(), display.contentWidth / 4 * 3, 0, 6000, 1000)
    self:addAstroid(GreyBig3.new(), display.contentWidth / 4, 0, 6500, 1000)
    self:addAstroid(GreyBig4.new(), display.contentWidth / 4 * 3, 0, 7000, 1000)
    self:addAstroid(GreyMed1.new(), display.contentWidth / 4 * 2, 0, 7500, 1000)
    self:addAstroid(GreyMed2.new(), display.contentWidth / 5 * 2, 0, 8000, 1000)
    self:addAstroid(GreySmall1.new(), display.contentWidth / 5 , 0, 8500, 1000)
    self:addAstroid(GreySmall2.new(), display.contentWidth / 5 * 2, 0, 9000, 1000)
    self:addAstroid(GreyTiny1.new(), display.contentWidth / 5 * 3, 0, 9500, 1000)
    self:addAstroid(GreyTiny2.new(), display.contentWidth / 8 * 7, 0, 10000, 1000)
end

return sublevel