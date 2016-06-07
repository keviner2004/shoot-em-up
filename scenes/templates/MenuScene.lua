local composer = require( "composer" )
local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local Menu = {}

Menu.new = function()
    local scene = composer.newScene()

    function scene:create( event )
       local sceneGroup = self.view
       local panelHeight = 0
       local panelWidth = 0
       local titleValue = self:getTitleText()
       local glassPanel = GlassCornersPanel.new(math.round(display.contentWidth*0.9), math.round(display.contentHeight*0.9))
       glassPanel.x = display.contentWidth/2
       glassPanel.y = display.contentHeight/2
       local titleText = display.newText(titleValue, 0, 0, "kenvector_future_thin", 40)
       titleText.x = glassPanel.x
       titleText.y = glassPanel.y - glassPanel.contentWidth / 2
       sceneGroup:insert(glassPanel)
       sceneGroup:insert(titleText)
       self.onClose = event.params and event.params.onClose
       self.buttonGap = 10
       self.buttons = display.newGroup()
       self.view:insert(self.buttons)
       --center these buttons
       self.buttons.x = display.contentWidth / 2
       self.buttons.y = display.contentHeight / 2
       self:insertButtons()
       self:resizeButtons()
    end

    function scene:getTitleText()
       return ""
    end

    function scene:newButton(text)
       local button = GlassProjectionPanel.new(display.contentWidth* 0.5, display.contentHeight *0.1)
       button:setText(text)
       return button
    end

    function scene:newResumeButton()
       local button = self:newButton("Resume")
       button.onTouch = function(button, event)
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
       elseif ( phase == "did" ) then
          -- Called when the scene is now on screen.
          -- Insert code here to make the scene come alive.
          -- Example: start timers, begin animation, play audio, etc.
       end
    end

    -- "scene:hide()"
    function scene:hide( event )
       
       local sceneGroup = self.view
       local phase = event.phase
     
       if ( phase == "will" ) then
          -- Called when the scene is on screen (but is about to go off screen).
          -- Insert code here to "pause" the scene.
          -- Example: stop timers, stop animation, stop audio, etc.
       elseif ( phase == "did" ) then
          -- Called immediately after scene goes off screen.
          if self.onClose then
             self.onClose()
          end
       end
    end
     
    -- "scene:destroy()"
    function scene:destroy( event )
     
       local sceneGroup = self.view
       -- Called prior to the removal of scene's view ("sceneGroup").
       -- Insert code here to clean up the scene.
       -- Example: remove display objects, save state, etc.
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