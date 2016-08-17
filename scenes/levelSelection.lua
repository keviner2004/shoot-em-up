local gameConfig = require("gameConfig")
local composer = require( "composer" )
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local Sprite = require("Sprite")
local GlassPanel = require("ui.GlassPanel")
local logger = require("logger")
local navigator = require("navigator")
local TAG = "LevelSelection"

local levels = gameConfig.seperateLevels

local numOfRows = 2
local numOfCols = 2

local scene = LevelSelectionScene.new({
    row = 4,
    col = 4,
    numOfLevels = #levels,
    title = "Select Level"
})

  function scene:createLevelBlock(index)
    local block = GlassPanel.new(self.blockWidth, self.blockHeight)
    block:setText(index)
    return block
  end


function scene:onLevelConfirm(index)
    logger:info(TAG, "Start single level %d", index)
    --go to game
    navigator:push("scenes.levelSelection")
    composer.gotoScene("scenes.game", {
        params = {
            mode = gameConfig.MODE_SINGLE_LEVEL,
            levels = gameConfig.seperateLevels,
            levelIdx = index
        }
    })
end

return scene

