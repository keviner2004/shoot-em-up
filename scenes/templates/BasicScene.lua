local composer = require( "composer" )
local AlertPanel = require("ui.WhitePanel")
local gameConfig = require( "gameConfig" )
local util = require("util")
local logger = require("logger")
local navigator = require("navigator")
local id = 0
BasicScene = {}

BasicScene.new = function ()
    local TAG = "BasicScene"
    id = id + 1
    TAG = "BasicScene "..id
    logger:info(TAG, "create basic scene %d", id)
    local scene = composer.newScene()
    local proxy = {}
    scene.superGroup = display.newGroup()
    scene.superGroup.x = gameConfig.contentX
    scene.superGroup.y = gameConfig.contentY
    scene.name = "BasicScene"
    function scene:create( event )

    end

    function scene:show( event )
        local sceneGroup = self.view
        local phase = event.phase
        if ( phase == "will" ) then
          logger:info(TAG, "scene will show")
        elseif ( phase == "did" ) then
          logger:info(TAG, "scene did show")
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

    function scene:onKeyUp(event)

    end

    function scene:onKeyDown(event)

    end

    function scene:onKeyLeft(event)

    end

    function scene:onKeyRight(event)

    end

    function scene:onKeyConfirm(event)
        logger:info(TAG, "default onKeyConfirm")
    end

    function scene:onKeyCancel(event)

    end

    function scene:addSwipeSupport()
      local swipeLayer = display.newRect(0, 0, gameConfig.contentWidth, gameConfig.contentHeight )
      swipeLayer.alpha=0 --make it transparent
      swipeLayer.isHitTestable = true
      swipeLayer.x = gameConfig.contentWidth/2
      swipeLayer.y = gameConfig.contentHeight/2
      self.superGroup:insert(swipeLayer)

      self.startDrag = function(event)
        local swipeLength = math.abs(event.x - event.xStart)
        --logger:info(TAG, "Swipe touch detail event.phase: %s, swipeLength: %d, ", event.phase, swipeLength)
        local t = event.target
        local phase = event.phase
        if "began" == phase then
          return true
        elseif "moved" == phase then
        elseif "ended" == phase or "cancelled" == phase then
          if event.xStart > event.x and swipeLength > 50 then
              self:swipRightToLeft()
          elseif event.xStart < event.x and swipeLength > 50 then
              self:swipLeftToRight()
          end
        end
      end
      swipeLayer:addEventListener("touch", self.startDrag)
    end

    function scene:swipLeftToRight()
      logger:info(TAG, "swipLeftToRight")
    end

    function scene:swipRightToLeft()
      logger:info(TAG, "swipRightToLeft")
    end

    function scene:key(event)
        if self.listenerRemoved then
          logger:error(TAG, "Listener is removed")
          return
        end
        if self.ignoreKeyEvent then
          logger:info(TAG, "Key ignore")
          return
        end
        if event.phase == "up" then
            logger:info(TAG, "event.keyName "..event.keyName )
            if event.keyName == gameConfig.keyUp then
              self:onKeyUp(event)
            elseif event.keyName == gameConfig.keyDown then
              self:onKeyDown(event)
            elseif event.keyName == gameConfig.keyLeft then
              self:onKeyLeft(event)
            elseif event.keyName == gameConfig.keyRight then
              self:onKeyRight(event)
            elseif util.equalOrContain(event.keyName, gameConfig.keyConfirm) then
              --logger:info(TAG, "event.keyName Confirm"..event.keyName )
              self:onKeyConfirm(event)
            elseif util.equalOrContain(event.keyName, gameConfig.keyCancel) then
              --logger:info(TAG, "~~~~~~~~~~~~~onKeyCancel")
              self:onKeyCancel(event)
            end
        end
    end

    function scene:alert(msg)
      if self.alertPanel then
        logger:info(TAG, "alert panel is already exist")
        return
      end
      local alertPanel = AlertPanel.new(gameConfig.contentWidth * 0.8, gameConfig.contentHeight * 0.08)
      alertPanel.x = gameConfig.contentWidth/2
      alertPanel.y = -alertPanel.height/2
      alertPanel:setText(msg, "", 17)
      alertPanel.buttonText.fill = {129/255, 147/255, 158/255}
      transition.to(alertPanel, { time = 200, y = alertPanel.height/2, onComplete =
        function()
          timer.performWithDelay( 1000, function()
            transition.to(alertPanel, { time = 200, y = -alertPanel.height/2, onComplete = function()
              alertPanel:removeSelf()
              self.alertPanel = nil
            end})
          end)
        end
      })
      self.alertPanel = alertPanel
    end

    function scene:back(options)
       if navigator:peek() then
          local backPage = navigator:pop()
          composer.showOverlay( backPage, {
            isModal = true,
            effect = "fromLeft",
            time = 400,
            params = options and options.params,
          })
       end
    end

    function scene:go(source, sceneName, params)
       navigator:push(source)
       composer.showOverlay( sceneName, {
         isModal = true,
         effect = "fromLeft",
         time = 400,
         params = params
       })
    end

    function scene:popUp(sceneName, params)
      local options = {
         effect = "fade",
         time = 500,
         isModal = true,
         params = params
      }
      composer.showOverlay(sceneName, options )
    end

    function proxy:create( event )
        scene.params = event.params
        scene.view:insert(scene.superGroup)
        scene:create(event)
    end

    function proxy:show( event )
      local phase = event.phase
      if ( phase == "will" ) then
        scene.destroyed = false
        scene.params = event.params
        self.listenerRemoved = false
      elseif (phase == "did") then
        Runtime:addEventListener( "key", scene)
      end
      scene:show(event)
    end

    function proxy:hide( event )
        local phase = event.phase

        if ( phase == "will" ) then

        elseif (phase == "did") then
          logger:info(TAG, "Remove key event listener")
          self.listenerRemoved = true
          Runtime:removeEventListener( "key", scene)
        end

        scene:hide(event)
    end

    function proxy:destroy( event )
        scene.destroyed = true
        scene:destroy(event)
    end

    -- Listener setup
    scene:addEventListener( "create", proxy )
    scene:addEventListener( "show", proxy )
    scene:addEventListener( "hide", proxy )
    scene:addEventListener( "destroy", proxy )

    return scene
end

return BasicScene
