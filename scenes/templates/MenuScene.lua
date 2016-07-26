local composer = require( "composer" )
local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local Menu = {}
local logger = require("logger")
local gameConfig = require("gameConfig")
local Sprite = require("Sprite")
local TAG = "MenuScene"

Menu.new = function()
    local scene = composer.newScene()
    scene.menuWidth = math.round(display.contentWidth*0.9)
    scene.menuHeight = math.round(display.contentHeight*0.9)

    function scene:create( event )
       logger:info(TAG, "scene create")
       local sceneGroup = self.view
       local panelHeight = 0
       local panelWidth = 0
       local titleValue = self:getTitleText()
       self:init(event)
       local glassPanel = GlassCornersPanel.new(self.menuWidth, self.menuHeight)
       glassPanel.x = display.contentWidth/2
       glassPanel.y = display.contentHeight/2
       local titleText = display.newText(titleValue, 0, 0, "kenvector_future_thin", 40)
       titleText.x = glassPanel.x
       titleText.y = glassPanel.y - glassPanel.contentWidth / 2
       self.selectedBtnIdx = 1
       self.onClose = event.params and event.params.onClose
       self.buttonGap = 10
       self.buttons = display.newGroup()
       --center these buttons
       self.buttons.x = display.contentWidth / 2
       self.buttons.y = display.contentHeight / 2
       self.glassPanel = glassPanel
       sceneGroup:insert(self.buttons)
       sceneGroup:insert(glassPanel)
       sceneGroup:insert(titleText)
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
       local button = GlassProjectionPanel.new(display.contentWidth* 0.5, display.contentHeight *0.1)
       button:setText(text)
       return button
    end

    function scene:insertButton(btn)
      if btn.action then
        function btn:onTouch(event)
          btn.action(event)
        end
      end
      self.buttons:insert(btn)
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
          composer.hideOverlay( "fade", 400 )
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

       local h = self.buttonGap * (self.buttons.numChildren - 1)

       for i = 1, self.buttons.numChildren do
          h = h + self.buttons[i].contentHeight
       end

       local top = -h/2
       for i = 1, self.buttons.numChildren do
          top = top + self.buttons[i].contentHeight/2
          self.buttons[i].x = 0
          self.buttons[i].y = top
          top = top + self.buttons[i].contentHeight/2 + self.buttonGap
       end
    end

    -- "scene:show()"
    function scene:show( event )
       local sceneGroup = self.view
       local phase = event.phase 
      
       if ( phase == "will" ) then
          -- Called when the scene is still off screen (but is about to come on screen).
          logger:info(TAG, "scene will show")
          --Add key listener
          Runtime:addEventListener( "key", self)
          self:onWillShow(event)
       elseif ( phase == "did" ) then
          -- Called when the scene is now on screen.
          -- Insert code here to make the scene come alive.
          -- Example: start timers, begin animation, play audio, etc.
          logger:info(TAG, "scene did show")
          self:onDidShow(event)
       end
    end

    function scene:key(event)
      if event.phase == "up" then
          if event.keyName == gameConfig.keyUp then
              self:selectButton(-1)
          elseif event.keyName == gameConfig.keyDown then
              self:selectButton(1)
          elseif event.keyName == gameConfig.keyLeft then
              
          elseif event.keyName == gameConfig.keyRight then
              
          elseif event.keyName == gameConfig.keyConfirm then
              self:onConfirm(self.selectedBtnIdx)
          elseif event.keyName == gameConfig.keyCancel then
              
          end
      end
    end

    function scene:onConfirm(idx)
      logger:info("TAG", "onConfirm %dth btn", idx)
      if self.buttons[idx].action then
        self.buttons[idx].action()
        self.buttons[idx]:playSound()
      end
    end

    function scene:selectButton(offset)
      --show pointer if need
      if not self.pointer then
        self.pointer = Sprite.new("UI/Cursors/2")
      end

      if self.buttons.numChildren > 0 then
        if not self.selectedBtnIdx then
          self.selectedBtnIdx = 1
        else
          self.selectedBtnIdx = self.selectedBtnIdx - 1
          local newSelectedIndex = self.selectedBtnIdx + offset
          if newSelectedIndex < 0 then
            --logger:info(TAG, "newSelectedIndex = -((-%d) r %d) + %d", newSelectedIndex, self.buttons.numChildren, self.buttons.numChildren)
            newSelectedIndex = -((-newSelectedIndex) % self.buttons.numChildren)
            if newSelectedIndex ~= 0 then
              newSelectedIndex = newSelectedIndex + self.buttons.numChildren
            end 
          else
            newSelectedIndex = newSelectedIndex % self.buttons.numChildren
          end
          self.selectedBtnIdx = newSelectedIndex
          self.selectedBtnIdx = self.selectedBtnIdx + 1
        end
        
        logger:info(TAG, "Select new menu index : %d / %d", self.selectedBtnIdx, self.buttons.numChildren)
      end
      local selectedBtn = self.buttons[self.selectedBtnIdx]
      self.pointer.x, self.pointer.y = selectedBtn:localToContent( 0, 0 )
      self.pointer.x = self.pointer.x + self.buttons.width/4
      self.pointer.y = self.pointer.y + self.buttons.height/8
    end

    -- "scene:hide()"
    function scene:hide( event )
       
       local sceneGroup = self.view
       local phase = event.phase
     
       if ( phase == "will" ) then
          logger:info(TAG, "scene will hide")
          self:onWillHide(event)
          --Remove key listener
          Runtime:removeEventListener( "key", self)
          if self.pointer then
            self.pointer:removeSelf()
            self.pointer = nil
          end
          -- Called when the scene is on screen (but is about to go off screen).
          -- Insert code here to "pause" the scene.
          -- Example: stop timers, stop animation, stop audio, etc.
       elseif ( phase == "did" ) then
          logger:info(TAG, "scene did hide")
          self:onDidHide(event)
          -- Called immediately after scene goes off screen.
          if self.onClose then
             self.onClose()
          end
       end
    end
    
    -- "scene:destroy()"
    function scene:destroy( event )
       logger:info(TAG, "scene destroy")
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
    ---------------------------------------------------------------------------------
     
    -- Listener setup
    scene:addEventListener( "create", scene )
    scene:addEventListener( "show", scene )
    scene:addEventListener( "hide", scene )
    scene:addEventListener( "destroy", scene )
    
    ---------------------------------------------------------------------------------
    return scene
end

return Menu