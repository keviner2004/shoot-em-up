local gameConfig = require("gameConfig")
local sfx = require("sfx")
local composer = require( "composer" )
local BasicScene = require("scenes.templates.BasicScene")
local Sprite = require("Sprite")
local GlassPanel = require("ui.GlassPanel")
local widget = require("widget")
local logger = require("logger")
local TAG = "LevelSelection"
local navigator = require("navigator")
local util = require("util")
local LevelSelectionScene = {}
local Title = require("ui.Title")

LevelSelectionScene.new = function(options)
  local scene = BasicScene.new()
  scene.blocks = {}

  function scene:create( event )
      self.numOfRows = (options and options.row) or 3
      self.numOfCols = (options and options.col) or 4
      self.numOfLevels = (options and options.numOfLevels) or 40
      self.pageHeight = gameConfig.contentHeight
      self.pageWidth = gameConfig.contentWidth
      self.pagePaddingRight = (options and options.pagePaddingRight) or gameConfig.contentHeight/20
      self.pagePaddingLeft = (options and options.pagePaddingLeft) or gameConfig.contentHeight/20
      self.pagePaddingTop = (options and options.pagePaddingTop) or gameConfig.contentHeight/8
      self.gap = gameConfig.contentHeight/70
      self.pagePaddingBottom = gameConfig.contentHeight/5
      self.selectedPageIndex = 1
      self.blockWidth = (self.pageWidth - self.pagePaddingLeft - self.pagePaddingRight - self.gap * (self.numOfCols -1)) / self.numOfCols
      self.blockHeight = (self.pageHeight - self.pagePaddingTop - self.pagePaddingBottom - self.gap * (self.numOfRows -1)) / self.numOfRows
      self.numOfPages = math.floor(self.numOfLevels / (self.numOfRows * self.numOfCols)) + math.ceil((self.numOfLevels % (self.numOfRows * self.numOfCols)) / (self.numOfRows * self.numOfCols))
      self.pages = {}
      self.levelCandidates = {}
      self.selectedType = "level"
      self.selectedLevelCandidate = 1
      self.previousSelectedLevelCandidate = 0

      self.title = Title.new({
        text = {
          value = (options and options.title) or "Level Selection",
          fontSize = 17
        },
        icon = {
          name = (options and options.titleIcon)
        }
      })

      self.title.x = self.pageWidth/2
      self.title.y = self.pagePaddingTop/2

      self.superGroup:insert(self.title)
      self:addSwipeSupport()
      self.backPage = navigator:peek()
      local blockLeft = self.pagePaddingLeft - self.pageWidth/2 + self.blockWidth/2
      local blockTop = self.pagePaddingTop - self.pageHeight/2 + self.blockHeight/2
      logger:debug(TAG, "w: %d, h: %d, l: %d, t: %d", self.blockWidth, self.blockHeight, blockLeft, blockTop)
      if self.blockWidth > 0 and self.blockHeight > 0 then
        local count = self.numOfLevels
        for page = 1, self.numOfPages do
            local pageGroup = display.newGroup()
            for i = 1, self.numOfRows do
                for j = 1, self.numOfCols do
                  if count <= 0 then
                    break
                  end
                  local blockIdx = self:levelCoordinateToIndex(page, i, j)
                  local block = self:createLevelBlock(blockIdx)
                  self:applyTouchToBlock(block, blockIdx)
                  self.blocks[blockIdx] = block
                  block.x = blockLeft + (j-1) * self.gap + (j-1) * block.width
                  block.y = blockTop + (i-1) * self.gap + (i-1) * block.height
                  --logger:debug(TAG, "%d x %d: w %d x h %d", j, i, block.x, block.y)
                  count = count - 1
                  pageGroup:insert(block)
                  self.levelCandidates[#self.levelCandidates+1] = block
                end
            end
            self.pages[#self.pages + 1] = pageGroup
            if page == self.selectedPageIndex then
              --show on the screen
              --pageGroup.x = gameConfig.contentWidth / 2 + (page - 1)  * self.pageWidth
              pageGroup.x = gameConfig.contentWidth / 2
              pageGroup.y = gameConfig.contentHeight / 2
            else
              self:hiddenPage(pageGroup)
            end

            self.superGroup:insert(pageGroup)
          end
      end

      self.dotGap = 10
      self.pageSelectorY = gameConfig.contentHeight * 9/10

      if self.numOfPages > 1 then
        local firstDot = Sprite["expansion-9"].new("UI/Dots/5")
        self.dotLeft = (gameConfig.contentWidth - self.numOfPages * firstDot.width - self.dotGap * (self.numOfPages - 1) + firstDot.width) / 2

        self:setDotAt(firstDot, 1)
        self.superGroup:insert(firstDot)


        for i = 2, self.numOfPages do
          local dot = Sprite["expansion-9"].new("UI/Dots/5")
          self:setDotAt(dot, i)
          self.superGroup:insert(dot)
        end

        --add back button?

        self.selectedDot = Sprite["expansion-9"].new("UI/Dots/6")
        self.superGroup:insert(self.selectedDot)
        self:setDotAt(self.selectedDot, 1)
        self:construct(event)
      end
      self:setSelectedIndex(self.selectedLevelCandidate)
  end

  function scene:construct(event)

  end

  function scene:showPage(page)
    page.x = gameConfig.contentWidth / 2
    page.y = gameConfig.contentHeight / 2
  end

  function scene:movePage()

  end

  function scene:hiddenPage(page)
    page.x = -10000
    page.y = -10000
  end

  function scene:backTo()
    if self.backPage then
      navigator:pop()
      composer.showOverlay( self.backPage, {
        isModal = true,
        effect = "fromLeft",
        time = 400,
      })
    end
  end

  function scene:onKeyCancel()
    self:backTo()
  end

  function scene:createBackButton()
    local button = widget.newButton({
      sheet = Sprite["expansion-9"].getSheet(),
      defaultFrame = Sprite["expansion-9"].getFrameIndex("UI/Icons/TriangleRight"),
      overFrame = Sprite["expansion-9"].getFrameIndex("UI/Icons/TriangleRight"),
      onEvent = function()
        self:backTo()
      end
    })
    button.xScale = -1
    self.superGroup:insert(button)
    button.x = gameConfig.contentWidth * 0.1
    button.y = gameConfig.contentHeight * 0.9
    return button
  end

  function scene:setSelectedDotAt(page)
    self:setDotAt(self.selectedDot, page)
  end

  function scene:indexToLevelCoordinate(index)
    logger:debug(TAG, "indexToLevelCoordinate %d", index)
    local numOfLevelsPerPage = self.numOfRows * self.numOfCols
    local page = math.floor(index / numOfLevelsPerPage) + math.ceil((index % numOfLevelsPerPage) / numOfLevelsPerPage)
    local numOfLastPageLevels = index % numOfLevelsPerPage
    if numOfLastPageLevels == 0  then
      row = self.numOfRows
      col = self.numOfCols
    else
      row = math.floor(numOfLastPageLevels / self.numOfCols) + math.ceil((numOfLastPageLevels % self.numOfCols) / self.numOfCols)
      col = numOfLastPageLevels - (row - 1) * self.numOfCols
    end
    return page, row, col
  end

  function scene:levelCoordinateToIndex(page, row, col)
    local index = (page - 1) * self.numOfRows * self.numOfCols + (row - 1) * self.numOfCols + col
    return index
  end

  function scene:selectCandidate(disablePointer)
    if self.isSelectLocked then
      logger:debug(TAG, "Selection is locked, you cannot select level")
      return
    end
    logger:debug(TAG, "Select level %d", self.selectedLevelCandidate)
    local selectedLevel = self:getSelectedLevel()
    if not disablePointer then
      if not self.pointer then
        self.pointer = Sprite["expansion-9"].new(gameConfig.defaultCursor)

      end
      selectedLevel.parent:insert(self.pointer)
      self.pointer.x = selectedLevel.x
      self.pointer.y = selectedLevel.y
    end
  end

  function scene:onLevelUnselect(index)

  end

  function scene:onLevelSelect(index)

  end

  function scene:getSelectedLevel()
    return self.levelCandidates[self.selectedLevelCandidate]
  end

  function scene:getLevel(index)
    return self.levelCandidates[index]
  end

  function scene:setDotAt(dot, page)
    if dot.width then
      dot.x = self.dotLeft + dot.width * (page-1) + self.dotGap * (page-1)
      dot.y = self.pageSelectorY
    end
  end

  function scene:show( event )
     local phase = event.phase

     if ( phase == "will" ) then
        if self.backPage and not self.backButton then
          self.backButton = self:createBackButton()
          self:onWillShow(event)
        end
     elseif ( phase == "did" ) then

     end
  end

  function scene:onWillHide(event)

  end

  function scene:onDidHide(event)

  end

  function scene:onWillShow(event)

  end

  function scene:onDidShow(event)

  end

  function scene:setSelectedIndex(index)
    if self.previousSelectedLevelCandidate then
      self:onLevelUnselect(self.previousSelectedLevelCandidate)
    end
    self.selectedLevelCandidate = index
    self:onLevelSelect(self.selectedLevelCandidate)
    self.previousSelectedLevelCandidate = self.selectedLevelCandidate
  end

  function scene:onKeyUp(event)
      local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
      local newRow = row - 1
      if newRow < 1 then
        newRow = self.numOfRows
      end

      local index = self:levelCoordinateToIndex(page, newRow, col)

      if index > self.numOfLevels then
        return
      end

      self:setSelectedIndex(index)

      self:selectCandidate()
  end

  function scene:onKeyDown(event)
      local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
      logger:debug(TAG, "Current cusor %d, %d, %d", page, row, col)
      local newRow = row + 1
      if newRow > self.numOfRows then
        newRow = 1
      end

      local index = self:levelCoordinateToIndex(page, newRow, col)

      if index > self.numOfLevels then
        return
      end

      self:setSelectedIndex(index)

      logger:debug(TAG, "Current selectedLevelCandidate %d", self.selectedLevelCandidate)
      self:selectCandidate()
  end

  function scene:createLevelBlock(index)
    local block = GlassPanel.new(self.blockWidth, self.blockHeight)
    return block
  end

  function scene:onLevelConfirm(index)
    logger:debug("TAG", "Comfirm level block at index: %d", index)
  end

  function scene:applyTouchToBlock(block, index)
    local function extendTouchListener(event)
      local swipeLength = math.abs(event.x - event.xStart)
      if event.phase == "ended" and swipeLength < 30 then
        self:onLevelConfirm(index, block)
      end
    end
    if block.onTouch then
        function block:onTouch(event)
          --print("=====================applyTouchToBlock 1=====================")
          extendTouchListener(event)
        end
    else
        --print("=====================applyTouchToBlock 2=====================")
        block:addEventListener( "touch", extendTouchListener)
    end
  end

  function scene:selectLeft()
    if self.isSelectLocked then
      logger:debug(TAG, "Selection is locked, you can't select level")
      return
    end
    local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
    local newCol = col - 1
    local newPage = page
    if newCol < 1 then
      --select to new page
      newCol = self.numOfCols
      newPage = newPage - 1
    end
    if newPage < 1 then
      newPage = self.numOfPages
    end

    local index = self:levelCoordinateToIndex(newPage, row, newCol)

    if index > self.numOfLevels then
      index = self.numOfLevels
    end

    self:setSelectedIndex(index)
    self:selectCandidate()
    if newPage ~= page then
      self:selectPage(-1)
    end
  end


  function scene:numOfLevelsUtilPage(page)
    local num = 0
    for i = 1, page do
      if i > self.numOfPages then
        break
      end
      num = num + self.numOfRows * self.numOfCols
    end
    if num > self.numOfLevels then
      num = self.numOfLevels
    end
  end

  function scene:selectRight()
    if self.isSelectLocked then
      logger:debug(TAG, "Selection is locked, you can't select level")
      return
    end
    local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
    local leveslUtilCurrentPage = self:numOfLevelsUtilPage(page)

    local newCol = col + 1
    local newRow = row
    local newPage = page
    local index = self:levelCoordinateToIndex(page, row, newCol)

    if newCol > self.numOfCols then
      --select to new page
      newCol = 1
      newPage = newPage + 1
    elseif index > self.numOfLevels then
      newRow = newRow - 1
      if newRow < 1 then
        newRow = 1
        newPage = newPage + 1
      end
    end

    if newPage > self.numOfPages then
      newPage = 1
    end

    index = self:levelCoordinateToIndex(newPage, newRow, newCol)

    if index > self.numOfLevels then
      index = self:levelCoordinateToIndex(newPage, 1, 1)
    end

    self:setSelectedIndex(index)
    --print("Select index: ", index)
    self:selectCandidate()
    if newPage ~= page then
      self:selectPage(1)
    end
  end

  function scene:onKeyLeft(event)
    self:selectLeft()
  end

  function scene:onKeyRight(event)
    self:selectRight()
  end

  function scene:swipLeftToRight()
    local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
    local newPage = util.getRotateIndex(page + 1, self.numOfPages)
    local index = self:levelCoordinateToIndex(newPage, 1, 1)
    self:setSelectedIndex(index)
    self:selectPage(-1)
  end

  function scene:swipRightToLeft()
    local page, row, col = self:indexToLevelCoordinate(self.selectedLevelCandidate)
    local newPage = util.getRotateIndex(page - 1, self.numOfPages)
    local index = self:levelCoordinateToIndex(newPage, 1, 1)
    self:setSelectedIndex(index)
    self:selectPage(1)
  end

  function scene:onKeyConfirm(event)
    sfx:play(gameConfig.buttonSound)
    self:onLevelConfirm(self.selectedLevelCandidate)
  end

  function scene:getSelectIndex(index, offset)
    index = index + offset

    index = index % self.numOfPages

    if index < 0 then
        index = -((-index) % self.numOfPages) + self.numOfPages + 1
    end

    if index == 0 then
      index = self.numOfPages
    end
    return index
  end

  function scene:getPageSlotXY(slot)
    local x = gameConfig.contentWidth / 2 + self.pageWidth * (slot - 1)
    local y = gameConfig.contentHeight / 2
    return x, y
  end

  function scene:movePageToSlot(page, slot)
    page.x, page.y = self:getPageSlotXY(slot)
  end

  function scene:transitionPageToSlot(page, slot, options)
    local x, y = self:getPageSlotXY(slot)
    transition.to(page, {time = 200, x = x, y = y, onComplete = (options and options.onComplete)})
  end

  function scene:selectPage(offset, options)
    if self.isSelectLocked then
      logger:debug(TAG, "Selection is locked, you can't select pages")
      return
    end

    self.newSelectedPageIndex = self:getSelectIndex(self.selectedPageIndex, offset)

    if self.newSelectedPageIndex == self.selectedPageIndex then
      return
    end

    self.isSelectLocked = true

    local newSelectedPage = self.pages[self.newSelectedPageIndex]
    local selectedPage = self.pages[self.selectedPageIndex]
    logger:debug(TAG, "new select page: %d/%d", self.newSelectedPageIndex, #self.pages)
    --prepare
    if offset > 0 then
      self:movePageToSlot(newSelectedPage, 2)
    else
      self:movePageToSlot(newSelectedPage, 0)
    end

    --slide
    if offset > 0 then
      self:transitionNewSelectedPage(newSelectedPage, 1)
      self:transitionOldSelectedPage(selectedPage, 0)
    else
      self:transitionNewSelectedPage(newSelectedPage, 1)
      self:transitionOldSelectedPage(selectedPage, 2)
    end
    --selectedPage.x =
  end

  function scene:selectLevelComplete()
    if self.newSelectedPageTransed and self.oldSelectedPageTransed then
      self.selectedPageIndex = self.newSelectedPageIndex
      scene:setSelectedDotAt(self.selectedPageIndex)
      self.isSelectLocked = false
    end
  end

  function scene:transitionNewSelectedPage(page, slot)
    self.newSelectedPageTransed = false
    self:transitionPageToSlot(page, slot, {onComplete =
      function ()
        self.newSelectedPageTransed = true
        self:selectLevelComplete()
      end
    })
  end

  function scene:transitionOldSelectedPage(page, slot)
    self.oldSelectedPageTransed = false
    self:transitionPageToSlot(page, slot, {onComplete =
      function ()
        self.oldSelectedPageTransed = true
        self:selectLevelComplete()
      end
    })
  end

  -- "scene:hide()"
  function scene:hide( event )
     local phase = event.phase

     if ( phase == "will" ) then
      if self.backButton then
        self.backButton:removeSelf()
      end
     elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

     end
  end

  -- "scene:destroy()"
  function scene:destroy( event )
     -- Called prior to the removal of scene's view ("sceneGroup").
     -- Insert code here to clean up the scene.
     -- Example: remove display objects, save state, etc.
  end

  return scene

end

return LevelSelectionScene
