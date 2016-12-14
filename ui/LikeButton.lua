local LinearGroup = require("ui.LinearGroup")
local ScaleText = require("ui.ScaleText")
local Title = require("ui.Title")
local Sprite = require("Sprite")
local logger = require("logger")
local TAG = "LikeBtn"
local dbHelper = require("dbHelper")
local Level = require("Level")
local gameConfig = require("gameConfig")
local facebook = require("facebook")
local Button = {}

Button.new = function(options)
  local button = display.newGroup()
  dbHelper:syncLikeNum(Level.currentLevelId)
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
  local shareIcon = Sprite["expansion-9"].new("UI/Icons/Share")
  local space = display.newRect(0, 0, 3 * gameConfig.scaleFactor, 1)
  space.alpha = 0
  shareIcon.xScale = 0.5
  shareIcon.yScale = 0.5
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
  starBarGroup:insert(space)
  starBarGroup:insert(shareIcon)
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

  button.group = {
    {
      instance = starGroup, 
      action = function()
        if dbHelper:getUserId() == "anonymous" and not gameConfig.fbskip then
          if options and options.auth then
            options.auth()
          end
        else
          button:like()
        end
      end   
    },
    {
      instance = shareIcon, 
      action = function()
        if dbHelper:getUserId() == "anonymous" and not gameConfig.fbskip then
          if options and options.auth then
            options.auth()
          end
        else
          facebook.share()
          print("Share...")
        end
      end   
    }
  }

  button.groupIdx = 1
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
    --logger:info(TAG, "syncLikeRequest")
    dbHelper:syncLikeRequest()
  end

  return button
end

return Button