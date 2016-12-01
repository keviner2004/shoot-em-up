local gameConfig = require("gameConfig")
local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local navigator = require("navigator")
local Sprite = require("Sprite")
local Title = require("ui.Title")
local ScaleText = require("ui.ScaleText")
local LinearGroup = require("ui.LinearGroup")
local sfx = require("sfx")
local Level = require("Level")
local dbHelper = require("dbHelper")
local logger = require("logger")
local TAG = "scenes.victory"
local scene = MenuScene.new()


function scene:getTitleText()
   return "Defeat!"
end

function scene:onWillShow(event)
    local score = (event.params and event.params.score) or 1200
    local count = 1
    local ticket = 10
    --[[
    self.scoreTimer = timer.performWithDelay( 1,
        function(event)
            if count > score then
                timer.cancel(event.source)
                count = score
            end
            self.score.text = count
            count = count + ticket
        end
    ,-1)
    --]]
    self:resizeButtons()
    if self.params and self.params.showNextLevel then
        self.nextButton.isVisible = true
        self.nextButton.y = self.nextButton.y + gameConfig.contentHeight*0.06
        --self.rankButton.y = self.rankButton.y + gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y + gameConfig.contentHeight*0.06
        self.homeButton.y = self.homeButton.y + gameConfig.contentHeight*0.06
        self.likeButton.y = self.likeButton.y + gameConfig.contentHeight*0.08
    else
        self.nextButton.isVisible = false
        --self.rankButton.y = self.rankButton.y - gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y - gameConfig.contentHeight*0.03
        self.homeButton.y = self.homeButton.y - gameConfig.contentHeight*0.03
        self.likeButton.y = self.likeButton.y + gameConfig.contentHeight*0.03
        --self:resizeButtons()
    end
    self.score.text = score

    if event.params and event.params.newRecord then
        self.newIcon.isVisible = true
    else
        self.newIcon.isVisible = false
    end
    --self.likeButton:poke()
    --self.nextButton.xScale = 0.9
    --self.nextButton.yScale = 0.8
end

function scene:insertButtons()
    self.nextButton = self:newButton("CONTINUE")
    --self.rankButton = self:newButton("Rank")
    self.restartButton = self:newRestartButton()
    self.homeButton = self:newButton("BACK")
    self.likeButton = self:newLikeButton()
    self.homeButton.action = function()
        if self.parent then
          self.parent:clearGame()
          sfx:play("title", {loops = -1})
        end
        self:back()
    end

    self.nextButton.action = function()
        composer.gotoScene("scenes.game", {
            params = {
                mode = gameConfig.MODE_SINGLE_LEVEL,
                levels = self.params.levels,
                levelIdx = self.params.nextLevelIdx
            }
        })
    end

    self.likeButton.action = function()
        if dbHelper:getUserId() == "anonymous" and not gameConfig.fbskip then
          self:go("scenes.victory", "scenes.login")
        else
          self.likeButton:like()
        end
    end

    self:insertButton(self.nextButton)
    self:insertButton(self.restartButton)
    self:insertButton(self.homeButton)
    self:insertButton(self.likeButton)
    --self:insertButton(self.rankButton)
end

function scene:onDidHide()

end

function scene:newLikeButton()
  local button = display.newGroup()
  button.starNum = dbHelper:getNumOfLikes(Level.currentLevelId)
  local unlikeText = "Credit the author if you like it!"
  local likeText = "Thank you!"
  local tip = Title.new({
    text = {
      value = unlikeText,
      fontSize = 15,
      width = display.contentWidth
    }
  })
  local starHoleIcon = Sprite["expansion-9"].new("UI/Icons/Stars/2")
  local starIcon = Sprite["expansion-9"].new("UI/Icons/Stars/5")
  local starNumText = ScaleText.new({
    text = button.starNum or 0,
    font = gameConfig.defaultFont,
    fontSize = 40
  })
  local starXText = ScaleText.new({
    text = "x",
    font = native.systemFontBold,
    fontSize = 20
  })
  local starGroup = display.newGroup()

  local container = LinearGroup.new({
    layout = LinearGroup.VERTICAL,
    gap = display.contentHeight * 0.01
  })

  local starBarGroup = LinearGroup.new({
    layout = LinearGroup.HORIZONTAL,
    gap = display.contentHeight * 0.02
  })

  starGroup:insert(starHoleIcon)
  starGroup:insert(starIcon)
  starBarGroup:insert(starGroup)
  starBarGroup:insert(starXText)
  starBarGroup:insert(starNumText)
  starBarGroup:resize()
  --position
  container:insert(starBarGroup)
  container:insert(tip)
  container:resize()
  if dbHelper:isLike(Level.currentLevelId) then
    button.liked = true
    starIcon.alpha = 1
  else
    button.liked = false
    starIcon.alpha = 0
  end
  button.tip = tip
  button.starHoleIcon = starHoleIcon
  button.starIcon = starIcon
  button.starNumText = starNumText
  button:insert(container)
  --define functions
  function button:poke()
    if not self.poker then
      self.holeX, self.holeY = self.parent.parent:contentToLocal(self.starHoleIcon:localToContent(0, 0))
      self.poker = Sprite["expansion-9"].new("UI/Cursors/6")
      self.pokeDeg = math.rad(-45)
      self.pokeDistance = 40 * gameConfig.scaleFactor
      self.pokeOffset = 20 * gameConfig.scaleFactor
      self.poker.x = math.cos(self.pokeDeg) * self.pokeOffset + self.holeX
      self.poker.y = -math.sin(self.pokeDeg) * self.pokeOffset + self.holeY
      self.parent.parent:insert(self.poker)
      self.dst = {
        x = math.cos(self.pokeDeg) * self.pokeDistance +  self.holeX,
        y = -math.sin(self.pokeDeg) * self.pokeDistance + self.holeY
      }
    end

    local ox = self.poker.x
    local oy = self.poker.y
    transition.to(self.poker, {
      time = 500,
      x = self.dst.x,
      y = self.dst.y,
      onComplete = function()
        self.dst = {x = ox, y = oy}
        self:poke()
      end
    })
  end

  function button:like()
    if not self.liked then
      self.liked = true
      self.starIcon.xScale = 0.1
      self.starIcon.yScale = 0.1
      self.starIcon.alpha = 1
      self.starNum = self.starNum + 1
      self.starNumText.text = self.starNum
      self.tip:setText(likeText)
      dbHelper:updateLikeRequest(Level.currentLevelId, 1)
      dbHelper:changeNumOfLikes(Level.currentLevelId, 1)
      transition.to(self.starIcon, {time = 100, xScale = 1, yScale = 1})
    else
      self.liked = false
      self.starIcon.alpha = 1
      self.starNum = self.starNum - 1
      self.starNumText.text = self.starNum
      self.tip:setText(unlikeText)
      dbHelper:updateLikeRequest(Level.currentLevelId, 0)
      dbHelper:changeNumOfLikes(Level.currentLevelId, -1)
      transition.to(self.starIcon, {time = 100, xScale = 0.1, yScale = 0.1, alpha = 0})
    end
    logger:debug(TAG, "syncLikeRequest")
    dbHelper:syncLikeRequest()
  end

  return button
end

function scene:construct()
    self.buttonGap = gameConfig.contentHeight * 0.015
    self.score = ScaleText.new({text = "0/0", x = gameConfig.contentWidth/2, y = gameConfig.contentHeight*0.28, font = gameConfig.defaultFont, fontSize = 30})
    self.superGroup:insert(self.score)
    --self.buttons.y = gameConfig.contentHeight * 0.65

    self.newIcon = ScaleText.new({text = "New High Score!", x = gameConfig.contentWidth/2, y = gameConfig.contentHeight*0.22, font = gameConfig.defaultFont, fontSize = 30})
    transition.blink( self.newIcon, {time = 1500} )
    self.superGroup:insert(self.newIcon)
end

return scene
