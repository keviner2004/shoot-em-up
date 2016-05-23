local Sublevel = require("Sublevel")

local sublevel = Sublevel.new("boss level", "keviner2004")
local Boss = require("enemies.Boss")
local composer = require("composer")
function sublevel:show(options)
    --boss
    ----[[
    self.boss = Boss.new(self.player)
    self.view:insert(self.boss)
    self.boss.x = display.contentWidth/2
    self.boss.y = 300
    local hpBar = self.boss:initHPBar()
    self.view:insert(hpBar)
    self.boss:act()
    self.boss.onDefeated = function()
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
            composer.showOverlay( "scene.victory", options )
        end)
    end

    self.player.onRespawned = function(obj, newCharacter)
        print("set boss player to new player")
        self.boss.player = newCharacter
    end

end

return sublevel