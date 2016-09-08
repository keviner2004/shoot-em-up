local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("9999999-008", "boss level", "keviner2004", {isBossFight = true})
local Boss = require("enemies.Boss")
local composer = require("composer")
local util = require("util")
local sfx = require("sfx")

function sublevel:create()
  self.isDefeated = false
end

function sublevel:show(options)
    --boss
    ----[[
    local function initBoss()
      self.boss = Boss.new(self.players)
      self.view:insert(self.boss)
      self.boss.x = gameConfig.contentWidth/2
      self.boss.y = 300
      local hpBar = self.boss:initHPBar()
      self.view:insert(hpBar)
      self.boss:act()
      self.game:showScore(false)
      self.boss.onDefeated = function()
          self.isDefeated = true
          self.game:showScore(true)
          sfx:play("bg", {loops = -1})
      end
    end

    self:showWarning({
      onComplete = function()
        initBoss()
      end
    })

end

function sublevel:isFinish()
    return self.isDefeated
end

return sublevel
