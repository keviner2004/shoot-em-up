local BasicScene = require("scenes.templates.BasicScene")
local scene = BasicScene.new()

function scene:create( event )

end

function scene:show( event )
    local phase = event.phase
    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end

-- "scene:hide()"
function scene:hide( event )
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

end

function scene:onKeyCancel(event)

end
return scene
