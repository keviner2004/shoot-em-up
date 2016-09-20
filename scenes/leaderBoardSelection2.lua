local gameConfig = require("gameConfig")
local composer = require( "composer" )
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local Sprite = require("Sprite")
local Panel = require("ui.MetalPanel")
local ScaleText = require("ui.ScaleText")
local InsidePanel = require("ui.MetalPanelPlate")
local logger = require("logger")
local navigator = require("navigator")
local TAG = "LevelSelection2"

local levels = gameConfig.seperateLevels

local scene = LevelSelectionScene.new({
    row = 5,
    col = 5,
    numOfLevels = #gameConfig.seperateLevels,
    title = "Select Leaderboard"
})

function scene:createSelectionBlock(text)
    local block = display.newGroup()
    local panel = Panel.new(self.blockWidth, self.blockHeight)
    local insidePanel = InsidePanel.new(self.blockWidth*0.95, self.blockHeight*0.8)
    local label = ScaleText.new({text = text, x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 20})
    label.fill = {139/255, 147/255, 158/255}
    block:insert(panel)
    block:insert(insidePanel)
    block:insert(label)

    return block
end

function scene:onLevelConfirm(index)
    local sublevel = require("levels."..gameConfig.seperateLevels[index])
    local params = {
        levelId = sublevel.id
    }
    logger:info("TAG", "Check level name: %s, id: %s", sublevel.name, sublevel.id)
    self:go("scenes.leaderBoardSelection2", "scenes.leaderBoard", params)
end

function scene:createLevelBlock(index)
    local block = nil
    block = self:createSelectionBlock(string.format("%d", index))
    return block
end

return scene
