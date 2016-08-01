local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local composer = require( "composer" )
local scene = composer.newScene()
local leaderBoardHelper = require("leaderBoardHelper")
local gameConfig = require("gameConfig")
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
   
   --print(pathOfThisFile)
   local sceneGroup = self.view
   self.superGroup = display.newGroup()
   self.superGroup.x = gameConfig.contentX
   self.superGroup.y = gameConfig.contentY
   self.mainPanel = GlassCornersPanel.new(gameConfig.contentWidth/1.3, gameConfig.contentHeight/1.3)
   self.marginTop = 180
   self.marginBottom = 10
   self.marginLeft = 10
   self.marginRight = 10

   self.mainPanel.x = gameConfig.contentWidth/2
   self.mainPanel.y = gameConfig.contentHeight/2
   titleButton = GlassProjectionPanel.new(gameConfig.contentWidth/2 - 150, 70)
   titleButton.x = self.mainPanel.x
   titleButton.y = self.mainPanel.y - self.mainPanel.contentHeight / 2 + 80 
   titleButton:setText("Local Rank")
   self.superGroup:insert(self.mainPanel)
   self.superGroup:insert(titleButton)

   local exitButton = GlassProjectionPanel.new(gameConfig.contentWidth/2 - 180, 70)
   exitButton.x = self.mainPanel.x
   exitButton.y = self.mainPanel.y + self.mainPanel.contentHeight/2 - 80
   exitButton:setText("Exit")
   self.superGroup:insert(exitButton)
   sceneGroup:insert(superGroup)

   function exitButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         composer.gotoScene((event.params and event.params.back or "gamesScene"), {params = {giveup = true}})
      end
   end

   function titleButton:onTouch(event)
      if event.phase == "ended" then
         print(scene.stype)
         if scene.stype == "local" then
            titleButton:setText("Global Rank")
            scene.stype = "global"
         elseif scene.stype == "global" then
            titleButton:setText("Local Rank")
            scene.stype = "local"
         end
         scene:clearScore()
         scene:showRank()
      end
   end
end

function scene:showRank()
   local data = nil
   local sceneGroup = self.view
   if self.stype == "local" then
      local helper = leaderBoardHelper.new()
      helper:init()
      data = helper:getData("local", 8)
   elseif self.stype == "global" then

   end
   local rowHeight = (self.mainPanel.contentHeight - self.marginTop - self.marginBottom)/ 10 
   if not data then 
      return
   end
   local len = table.getn(data)
   self.scores = display.newGroup()
   for i = 1, len do
      local name = display.newText(data[i].name, 0, 0, "kenvector_future_thin", 40)
      local score = display.newText(data[i].score, 0, 0, "kenvector_future_thin", 40)
      name.x =  self.mainPanel.x - self.mainPanel.x / 4
      name.y =  self.mainPanel.y + self.marginTop + rowHeight*(i-1) + rowHeight/2 - self.mainPanel.contentHeight/2
      score.x =  self.mainPanel.x + self.mainPanel.x / 4
      score.y =  self.mainPanel.y + self.marginTop + rowHeight*(i-1) + rowHeight/2 - self.mainPanel.contentHeight/2
      self.scores:insert(name)
      self.scores:insert(score)
   end
   self.superGroup:insert(self.scores)
end

function scene:clearScore()
   self.scores:removeSelf()
end

-- "scene:show()"
function scene:show( event )
   local sceneGroup = self.view
   local phase = event.phase 
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
      if event.params and event.params.stype then
         print("Set stype = "..event.params.stype)
         self.stype = event.params.stype
         self:showRank()
      end
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