local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("boss level", "keviner2004", {isBossFight = true})
local Boss = require("enemies.Boss")
local composer = require("composer")
local util = require("util")
function sublevel:show(options)
    --boss
    ----[[
    self.boss = Boss.new(self.players)
    self.view:insert(self.boss)
    self.boss.x = display.contentWidth/2
    self.boss.y = 300
    local hpBar = self.boss:initHPBar()
    self.view:insert(hpBar)
    self.boss:act()
    self.game:showScore(false)
    self.boss.onDefeated = function()
        self.game:showScore(true)
        print("Boss is defeated, show victory window")
        self.scene:checkScore(function()
            local options = {
                effect = "fade",
                time = 500,
                isModal = true,
                params = {
                    score = self.player.score,
                    onClose = function()
                        
                    end
                }
            }
            for i = 1, #self.players do
                if util.isExists(self.players[i]) and self.players[i].openShield then
                    self.players[i]:openShield()
                end
            end
            composer.showOverlay( "scenes.victory", options )
        end)
    end
end

return sublevel