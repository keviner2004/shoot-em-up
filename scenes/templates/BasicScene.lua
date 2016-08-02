local composer = require( "composer" )
local gameConfig = require( "gameConfig" )
BasicScene = {}

BasicScene.new = function ()
    local scene = composer.newScene()
    scene.superGroup = display.newGroup()
    scene.superGroup.x = gameConfig.contentX
    scene.superGroup.y = gameConfig.contentY
    return scene
end

return BasicScene