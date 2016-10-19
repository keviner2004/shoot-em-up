local gameConfig = require("gameConfig")
local composer = require( "composer" )
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local Sprite = require("Sprite")
local GlassPanel = require("ui.GlassPanel")
local MetalPanel = require("ui.MetalPanel")
local dbHelper = require("dbHelper")
local Bar = require("ui.BlueTopBar")
local MetalPanelPlate = require("ui.MetalPanelPlate")
local logger = require("logger")
local TAG = "ChapterSelection"
local Number = require("ui.Number")
local CHAPTER_INFINITE_MODE_INDEX = 1
local CHAPTER_LEVEL_MODE_INDEX = 2
local navigator = require("navigator")
local ScaleText = require("ui.ScaleText")
local scene = LevelSelectionScene.new({
    row = 1,
    col = 1,
    numOfLevels = 2,
    title = "Select Chapter"
  })

function scene:onLevelConfirm(index)
    logger:debug(TAG, "Select chapter %d", index)
    if self.blocks[index].locked then
      self:alert("Comming soon, check it later.")
      return
    end
    if index == CHAPTER_LEVEL_MODE_INDEX then
        navigator:push("scenes.chapterSelection")
        composer.showOverlay( "scenes.levelSelection", {
            isModal = true,
            effect = "fromRight",
            time = 400,
        })
    elseif index == CHAPTER_INFINITE_MODE_INDEX then
        --go to game
        composer.gotoScene("scenes.game")
    end
end

function scene:createChapter(options)
    local score = Number.new((options and options.score) or 1234)
    local chapter = display.newGroup()
    local bar = Bar.new(self.blockWidth, self.blockHeight * 0.16)
    local base = MetalPanel.new(self.blockWidth, self.blockHeight)
    local info = MetalPanelPlate.new(self.blockWidth * 0.92, self.blockHeight/4)
    local chapterName = ScaleText.new({
      text = (options and options.title) or "Classic",
      x = 0,
      y = 0,
      font = gameConfig.defaultFont,
      fontSize = 17
    })
    local scoreLabel = ScaleText.new({
      text = "Score",
      x = 0,
      y = 0,
      font = gameConfig.defaultFont,
      fontSize = 30
    })
    local preview = (options and options.preview) or Sprite.new("Planet/5")
    preview.y = -self.blockHeight*0.08
    scoreLabel.fill = {139/255, 147/255, 158/255}
    base.y = (self.blockHeight - base.height)/2
    bar.y = (bar.height - base.height)/2
    info.y = self.blockHeight * 0.3
    chapterName.y = bar.y
    scoreLabel.y = self.blockHeight * 0.25
    scoreLabel.x = 0
    score.y = self.blockHeight * 0.35
    score.x = -score.width * 0.05

    chapter:insert(base)
    chapter:insert(info)
    chapter:insert(bar)
    chapter:insert(chapterName)
    chapter:insert(scoreLabel)
    chapter:insert(score)
    chapter:insert(preview)
    if options and options.locked then
      local lockIcon = Sprite.new("UI/Icons/Lock")
      lockIcon.x = 0
      lockIcon.y = 0
      chapter.locked = options.locked
      chapter:insert(lockIcon)
    end
    return chapter
end

function scene:createLevelBlock(index)
    local block = nil
    if index == CHAPTER_INFINITE_MODE_INDEX then
        local highScore = dbHelper:getHighScore(gameConfig.ID_LEVEL_INFINITE, "local")
        block = self:createChapter({score = highScore, preview = Sprite.new("Planet/7")})
    elseif index == CHAPTER_LEVEL_MODE_INDEX then
        local highScore = 0
        for i = 1, #gameConfig.seperateLevels do
            highScore = highScore + dbHelper:getHighScore(require("levels."..gameConfig.seperateLevels[i]).id, "local")
        end
        local locked = false
        if gameConfig.hiddenSingleLevelChapter then
          locked = true
        end
        block = self:createChapter({title = "NKFU", score = highScore, preview = Sprite.new("Planet/4"), locked = locked})

    end
    return block
end

return scene
