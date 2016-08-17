local gameConfig = require("gameConfig")
local composer = require( "composer" )
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local Sprite = require("Sprite")
local Panel = require("ui.MetalPanel")
local InsidePanel = require("ui.MetalPanelPlate")
local logger = require("logger")
local navigator = require("navigator")
local TAG = "LevelSelection"

local levels = gameConfig.seperateLevels

local scene = LevelSelectionScene.new({
    row = 5,
    col = 1,
    numOfLevels = 2,
    title = "Select Leaderboard"
})

function scene:createSelectionBlock(text)
    local block = display.newGroup()
    local panel = Panel.new(self.blockWidth, self.blockHeight)
    local insidePanel = InsidePanel.new(self.blockWidth*0.95, self.blockHeight*0.8)
    local label = display.newText(text, 0, 0, gameConfig.defaultFont, 40)
    label.fill = {139/255, 147/255, 158/255}
    block:insert(panel)
    block:insert(insidePanel)
    block:insert(label)

    return block
end

function scene:onLevelConfirm(index)
    logger:info(TAG, "Select %d th leaderboard", index)
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
        block = self:createSelectionBlock("NKFU")
    end
    return block
end

return scene

