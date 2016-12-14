local composer = require( "composer" )
local BasicScene = require("scenes.templates.BasicScene")
local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local logger = require("logger")
local gameConfig = require("gameConfig")
local Sprite = require("Sprite")
local util = require("util")
local ScaleText = require("ui.ScaleText")
local sfx = require("sfx")
local TAG = "MenuScene"

local Menu = {}
Menu.new = function()
    local scene = BasicScene.new()
    scene.menuWidth = math.round(gameConfig.contentWidth)
    scene.menuHeight = math.round(gameConfig.contentHeight)
    function scene:create( event )
       logger:debug(TAG, "scene create")
       --self.superGroup = display.newGroup()
       --self.superGroup.x = gameConfig.contentX
       --self.superGroup.y = gameConfig.contentY
       local sceneGroup = self.view
       local panelHeight = 0
       local panelWidth = 0
       local titleValue = self:getTitleText()
       self:init(event)
       local glassPanel = GlassCornersPanel.new(self.menuWidth, self.menuHeight)
       glassPanel.x = gameConfig.contentWidth/2
       glassPanel.y = gameConfig.contentHeight/2
       local titleText = ScaleText.new({text = titleValue, x = 0, y = 0, font = "kenvector_future_thin", fontSize = 40})
       titleText.x = glassPanel.x
       titleText.y = gameConfig.contentHeight * 0.15
       self.selectedBtnIdx = 1
       self.secondBtnIdx = 1
       self.onClose = event.params and event.params.onClose
       self.buttonGap = 10
       self.buttons = display.newGroup()
       --center these buttons
       self.buttons.x = gameConfig.contentWidth / 2
       self.buttons.y = gameConfig.contentHeight / 2
       self.glassPanel = glassPanel
       self.superGroup:insert(glassPanel)
       self.superGroup:insert(self.buttons)
       self.superGroup:insert(titleText)
       self:construct()
       self:insertButtons()
       self:resizeButtons()
    end

    function scene:init(event)

    end

    function scene:construct()

    end

    function scene:getTitleText()
       return ""
    end

    function scene:newButton(text)
       local button = GlassProjectionPanel.new(gameConfig.contentWidth* 0.5, gameConfig.contentHeight *0.1)
       button:setText(text)
       return button
    end

    function scene:registerButton(btn, subIdx)
      local btnIdx = self.buttons.numChildren
      local function extendTouchListener(event)
        if event.phase == "ended" then
          self:onConfirm(btnIdx, subIdx)
        end
      end

      local targetBtn = btn

      if subIdx > 0 then
        targetBtn = btn.group[subIdx].instance
      end

      if targetBtn.onTouch then
        function targetBtn:onTouch(event)
          extendTouchListener(event)
        end
      else
        targetBtn:addEventListener( "touch", extendTouchListener)
      end
    end

    function scene:insertButton(btn)
      self.buttons:insert(btn)
      if btn.group then
        for i = 1, #btn.group do
          self:registerButton(btn, i)
        end
      else
        self:registerButton(btn, 0)
      end
    end

    function scene:indexOf(btn)
      local idx = -1
      for i = 1, self.buttons.numChildren do
          if self.buttons[i] == btn then
            return i
          end
      end
    end

    function scene:newResumeButton()
      local button = self:newButton("Resume")
      button.action = function(button, event)
        logger:debug(TAG, "Resume button click")
        composer.hideOverlay( "fade", 400 )
        self.parent:toggleGame()
      end
      return button
    end

    function scene:newRestartButton()
       local button = self:newButton("Restart")
       logger:debug(TAG, "Restart button click")
       button.action = function(button, event)
          composer.gotoScene("scenes.game", {params = {action = "restart"}})
       end
       return button
    end

    function scene:newGiveupButton()
       local button = self:newButton("Giveup")
       logger:debug(TAG, "Giveup button click")
       button.action = function(button, event)
        logger:debug(TAG, "Give up game")
        composer.gotoScene("scenes.game", {params = {giveup = true}})
       end
       return button
    end

    function scene:insertButtons()
       local resumeButton = self:newResumeButton()
       self.buttons:insert(resumeButton)
    end

    function scene:resizeButtons()
       if self.buttons.numChildren <= 0 then
          print("not buttons found, skip")
          return
       end

       local numVisibleChildren = 0

       for i = 1, self.buttons.numChildren do
        if self.buttons[i].isVisible then
          numVisibleChildren = numVisibleChildren + 1
        end
       end

       local h = self.buttonGap * (numVisibleChildren - 1)

       for i = 1, self.buttons.numChildren do
          if self.buttons[i].isVisible then
            h = h + self.buttons[i].contentHeight
          end
       end

       local top = -h/2
       for i = 1, self.buttons.numChildren do
          if self.buttons[i].isVisible then
            top = top + self.buttons[i].contentHeight/2
            self.buttons[i].x = 0
            self.buttons[i].y = top
            top = top + self.buttons[i].contentHeight/2 + self.buttonGap
          else
            print("!!!!!!Skip inVisible button")
          end
       end
    end

    -- "scene:show()"
    function scene:show( event )
      local sceneGroup = self.view
      local phase = event.phase
      self.parent = event.parent
       if ( phase == "will" ) then
          -- Called when the scene is still off screen (but is about to come on screen).
          logger:debug(TAG, "scene will show")
          --Add key listener
          self:onWillShow(event)
       elseif ( phase == "did" ) then
          -- Called when the scene is now on screen.
          -- Insert code here to make the scene come alive.
          -- Example: start timers, begin animation, play audio, etc.
          logger:debug(TAG, "scene did show")
          self:onDidShow(event)
       end
    end

    function scene:onKeyUp()
      self:selectButton(-1)
    end

    function scene:onKeyDown()
      self:selectButton(1)
    end

    function scene:onKeyRight()
      self:selectButton(0, 1)
    end

    function scene:onKeyLeft()
      self:selectButton(0, -1)
    end

    function scene:onKeyConfirm()
      logger:debug(TAG, "onKeyConfirm")

      if self.buttons[self.selectedBtnIdx].group then
        self:onConfirm(self.selectedBtnIdx, self.buttons[self.selectedBtnIdx].groupIdx)
      else
        self:onConfirm(self.selectedBtnIdx)
      end
    end

    function scene:onConfirm(idx, subIdx)
      logger:debug(TAG, "onConfirm %dth btn", idx, subIdx)
      if subIdx and subIdx > 0 then
        self.buttons[idx].group[subIdx].action()
        sfx:play("button")
      else
        if self.buttons[idx] and self.buttons[idx].action then
          self.buttons[idx].action()
          if not self.buttons[idx].playSound then
            self.buttons[idx].playSound = function()
              --print("###################")
              sfx:play(self.buttons[idx].sound or "button")
            end
          end
          self.buttons[idx]:playSound()
        end
      end
    end

    function scene:selectButton(offset, offset2)
      --show pointer if need
      if not self.pointer then
        self.pointer = Sprite["expansion-9"].new(gameConfig.defaultCursor)
        self.view:insert(self.pointer)
      end

      if self.buttons.numChildren > 0 then
        if not self.selectedBtnIdx then
          self.selectedBtnIdx = 1
        else
          for i = 1, self.buttons.numChildren do
            local newIndex = util.getRotateIndex(self.selectedBtnIdx + offset, self.buttons.numChildren)
            if self.buttons[newIndex].isVisible then
              self.selectedBtnIdx = newIndex
              break
            else
              offset = offset + 1
            end
          end
        end

        logger:debug(TAG, "Select new menu index : %d / %d", self.selectedBtnIdx, self.buttons.numChildren)
      end

      local selectedBtn = self.buttons[self.selectedBtnIdx]
      if selectedBtn.group and selectedBtn.groupIdx then
        local newIndex = util.getRotateIndex(selectedBtn.groupIdx + (offset2 or 0), #selectedBtn.group)
        selectedBtn.groupIdx = newIndex
        local subBtn = selectedBtn.group[selectedBtn.groupIdx].instance
        self.pointer.x, self.pointer.y = subBtn:localToContent( 0, 0 )
        self.pointer.x = self.pointer.x + (subBtn.pointerOffsetX or subBtn.width/4)
        self.pointer.y = self.pointer.y + (subBtn.pointerOffestY or subBtn.height/8)
      else
        self.pointer.x, self.pointer.y = selectedBtn:localToContent( 0, 0 )
        self.pointer.x = self.pointer.x + (selectedBtn.pointerOffsetX or self.buttons.width/4)
        self.pointer.y = self.pointer.y + (selectedBtn.pointerOffestY or self.buttons.height/8)
      end
    end

    -- "scene:hide()"
    function scene:hide( event )

       local sceneGroup = self.view
       local phase = event.phase

       if ( phase == "will" ) then
          logger:debug(TAG, "scene will hide")
          self:onWillHide(event)
          --Remove key listener
          if self.pointer then
            self.pointer:removeSelf()
            self.pointer = nil
          end
          -- Called when the scene is on screen (but is about to go off screen).
          -- Insert code here to "pause" the scene.
          -- Example: stop timers, stop animation, stop audio, etc.
       elseif ( phase == "did" ) then
          logger:debug(TAG, "scene did hide")
          self:onDidHide(event)
          -- Called immediately after scene goes off screen.
          if self.onClose then
             self.onClose()
          end
       end
    end

    -- "scene:destroy()"
    function scene:destroy( event )
       logger:debug(TAG, "scene destroy")
       local sceneGroup = self.view
       -- Called prior to the removal of scene's view ("sceneGroup").
       -- Insert code here to clean up the scene.
       -- Example: remove display objects, save state, etc.
       --sceneGroup:removeSelf()
       self:onDestroy(event)
    end

    function scene:onWillShow(event)

    end

    function scene:onDidShow(event)

    end

    function scene:onWillHide(event)

    end

    function scene:onDidHide(event)

    end

    function scene:onDestroy(event)

    end

    return scene
end

return Menu
