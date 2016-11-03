local gameConfig = require("gameConfig")
local composer = require( "composer" )
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local Sprite = require("Sprite")
local Panel = require("ui.MetalPanel")
local InsidePanel = require("ui.MetalPanelPlate")
local logger = require("logger")
local navigator = require("navigator")
local ScaleText = require("ui.ScaleText")
local TAG = "LevelSelection"

local levels = gameConfig.seperateLevels

local scene = LevelSelectionScene.new({
    row = 5,
    col = 1,
    numOfLevels = 2,
    title = "Select Leaderboard"
})

function scene:createSelectionBlock(text, locked)
    local block = display.newGroup()
    local panel = Panel.new(self.blockWidth, self.blockHeight)
    local insidePanel = InsidePanel.new(self.blockWidth*0.95, self.blockHeight*0.8)
    local label = ScaleText.new({text = text, x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 20})
    label.fill = {139/255, 147/255, 158/255}
    block:insert(panel)
    block:insert(insidePanel)
    block:insert(label)
    if locked then
      block.locked = true
      local lockIcon = Sprite["expansion-9"].new("UI/Icons/Lock")
      lockIcon.xScale = 0.5
      lockIcon.yScale = 0.5
      lockIcon.x = -block.width * 0.35
      lockIcon.y = 0
      block:insert(lockIcon)
    end

    return block
end

function scene:onLevelConfirm(index)
    logger:debug(TAG, "Select %d th leaderboard", index)
    if self.blocks[index].locked then
      self:alert("Comming soon, check it later.")
      return
    end
    if index == 1 then
        self:go("scenes.leaderBoardSelection", "scenes.leaderBoard")
    elseif index == 2 then
        self:go("scenes.leaderBoardSelection", "scenes.leaderBoardSelection2")
    end
end

function scene:createLevelBlock(index)
    local block = nil
    if index == 1 then
        block = self:createSelectionBlock("Classic")
    elseif index == 2 then
        local locked = false
        if gameConfig.hiddenSingleLevelChapter then
          locked = true
        end
        block = self:createSelectionBlock("NKFU", locked)
    end
    return block
end

return scene
