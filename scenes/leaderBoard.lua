local Panel = require("ui.GlassTLCornersPanel")
--local InsidePanel = require("ui.GlassCornersPanel")
local composer = require( "composer" )
local Sprite = require("Sprite")
local BasicScene = require("scenes.templates.BasicScene")
local dbHelper = require("dbHelper")
local Title = require("ui.Title")
local logger = require("logger")
local gameConfig = require("gameConfig")
local ScaleText = require("ui.ScaleText")
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
local LevelSelectionScene = require("scenes.templates.LevelSelectionScene")
local logger = require("logger")
local TAG = "LeaderBoard"

local scene = LevelSelectionScene.new({
    row = 1,
    col = 1,
    numOfLevels = 2,
    title = "",
    titleIcon = "UI/Icons/ChampionCup",
    pagePaddingRight = 0,
    pagePaddingLeft = 0
})

function scene:createRecordBlock(width, height, position, name, score)
   local block = display.newGroup()

   --local insidePanel = InsidePanel.new(self.blockWidth*0.95, self.blockHeight*0.8)
   local posStr = ""
   if position == 1 then
      posStr = "st"
   elseif position == 2 then
      posStr = "nd"
   elseif position == 3 then
      posStr = "rd"
   else
      posStr = "th"
   end

   --local panel = Panel.new(width, height)
   local gap = 0
   local numOfCeil = 3
   local paddingLeft = width * 0.05
   local paddingRihgt = width * 0.05

   local ceilWidth = {
      0.25,
      0.45,
      0.3,
   }

   local availableWidth = width - paddingLeft - paddingRihgt - gap * (#ceilWidth -1)

   local ceilLeft = {

   }

   local left = 0

   for i = 1, #ceilWidth do
      left = left + (ceilWidth[i-1] or 0) * availableWidth + gap * (i-1)
      ceilLeft[i] = left - width/2 + paddingLeft
      print("Left: ", left)
   end

   local posLabel = ScaleText.new({
     text = position..posStr,
     x = 0,
     y = 0,
     font = gameConfig.defaultFont,
     fontSize = 15
   })

   local nameLabel = ScaleText.new({
     text = name,
     x = 0,
     y = 0,
     font = gameConfig.defaultFont,
     fontSize = 15
   })

   local scoreLabel = ScaleText.new({
     text = score,
     x = 0,
     y = 0,
     font = gameConfig.defaultFont,
     fontSize = 15
   })

   --posLabel.fill = {139/255, 147/255, 158/255}
   --nameLabel.fill = {139/255, 147/255, 158/255}
   --scoreLabel.fill = {139/255, 147/255, 158/255}

   posLabel.x = ceilLeft[1] + posLabel.width/2
   nameLabel.x = ceilLeft[2] + nameLabel.width/2
   scoreLabel.x = ceilLeft[3] + scoreLabel.width/2

   --block:insert(panel)
   --block:insert(insidePanel)
   block:insert(posLabel)
   block:insert(nameLabel)
   block:insert(scoreLabel)

   return block
end

function scene:createLoadingStatus()
   local status = display.newGroup()
   local icon = Sprite.new("UI/Icons/rotate")
   local label = ScaleText.new({text = "Loading", x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 20})
   local function rotate()
      icon.rotation = 0
      transition.to(icon, {time = 1000, rotation = 360, onComplete =
         function()
            rotate()
         end})
   end
   rotate()
   status:insert(icon)
   status:insert(label)

   local height = icon.height + label.height

   icon.y = -height/2 + icon.height/2
   label.y = icon.y + icon.height/2 + label.height/2
   return status
end

function scene:createRecordList(options)
   --self.params.levelId
   local list = display.newGroup()
   local num = (options and options.num) or 10
   local stype = (options and options.type) or "local"
   local levelId = (options and options.levelId) or gameConfig.ID_LEVEL_INFINITE
   local records = dbHelper:getRecords(stype, levelId, num)
   local maxRecords = 10
   local recordHeight = self.listHeight / maxRecords
   local top = - self.listHeight * 0.5
   logger:info(TAG, "Num of records is %d", #records)
   for i = 1, #records do
      local record = records[i]
      logger:info(TAG, "Record %d: name:%s, score: %s", i, record.name, record.score)
      local block = self:createRecordBlock(self.blockWidth* 0.95, recordHeight, i, record.name, record.score)
      block.x = 0
      block.y =  top + recordHeight * (i-1) + recordHeight/2
      list:insert(block)
   end
   if #records == 0 then
      list:insert(Title.new({
         text = {
            value = "No data"
         }
      }))
   end
   return list
end

function scene:createGlobalRecordList()
  --local page = self:getLevel(1)
  dbHelper:updateGlobalData((self.params and self.params.levelId) or gameConfig.ID_LEVEL_INFINITE, {
    onComplete = function()
      if self.destroyed then
        return
      end
      self:stopLoading()
      --local page = self:getLevel(1)
      local list = self:createRecordList({
         type = "global",
         levelId = self.params and self.params.levelId
      })
      list.x = 0
      list.y = 0
      self:updateGlobalRecords(list)
    end
  })

end

function scene:createLocalRecordList()
   --local page = self:getLevel(1)
   local list = self:createRecordList({
      type = "local",
      levelId = self.params and self.params.levelId
   })
   list.x = 0
   list.y = 0
   self:updateLocalRecords(list)
end

function scene:updateLocalRecords(list)
   self:clearLocalRecords()
   self.localRecordList:insert(list)
end

function scene:updateGlobalRecords(list)
   self:clearGlobalRecords()
   self.globalRecordList:insert(list)
end

function scene:clearLocalRecords()
   self:clearGroup(self.localRecordList)
end

function scene:clearGlobalRecords()
   self:clearGroup(self.globalRecordList)
end

function scene:onLevelUnselect(index)
   local page = self:getLevel(index)
   if index == 1 then
      logger:info(TAG, "Unselect local leaderboard")

   elseif index == 2 then
      logger:info(TAG, "Unselect global leaderboard")
      self:stopLoading()
   end
end

function scene:stopLoading()
  if self.loadingStatus then
     self.loadingStatus:removeSelf()
     self.loadingStatus = nil
  end
end

function scene:clearGroup(group)
   for i = 1, group.numChildren do
      group[i]:removeSelf()
   end
end

function scene:onLevelSelect(index)
   local page = self:getLevel(index)
   if index == 1 then
      logger:info(TAG, "Select local leaderboard")
      self:createLocalRecordList()
   elseif index == 2 then
      logger:info(TAG, "Select global leaderboard")
      self:createGlobalRecordList()
      self.loadingStatus = self:createLoadingStatus()
      page:insert(self.loadingStatus)
   end
end

function scene:construct(event)
   self.globalRecordList = display.newGroup()
   self.localRecordList = display.newGroup()
   self:getLevel(1):insert(self.localRecordList)
   self:getLevel(2):insert(self.globalRecordList)
   self.localRecordList.x = 0

   self.globalRecordList.x = 0

   self.localTitle = Title.new({
      text = {
         value = "Local"
      },
      icon = {
         scale = 0.5,
         name = "UI/Icons/JoyStickRight"
      }
   })

   self.globalTitle = Title.new({
      text = {
         value = "Global"
      },
      icon = {
         scale = 0.5,
         name = "UI/Icons/ThreePlayers"
      }
   })

   self:getLevel(1):insert(self.localTitle)
   self:getLevel(2):insert(self.globalTitle)
   self.listGap = self.blockHeight * 0.03
   self.localTitle.y = - self.blockHeight * 0.5 + self.listGap + self.localTitle.height * 0.5
   self.listHeight =  self.blockHeight - self.localTitle.height - self.listGap * 3
   self.listTop = self.localTitle.y + self.localTitle.height * 0.5 + self.listGap + self.listHeight/2

   self.globalTitle.y = self.localTitle.y

   self.localRecordList.y = self.listTop
   self.globalRecordList.y = self.listTop


end

return scene
