local gameConfig = require("gameConfig")
local logger = require("logger")
local capture = {}

local TAG = "Capture"

local prepareCapture = false

function capture:key(event)
    if event.phase == "down" then
        if event.keyName == "leftControl" or event.keyName == "rightControl" then
            logger:debug(TAG, "prepare to capture screen")
            prepareCapture = true
        end
        if prepareCapture and  string.lower(event.keyName) == "c" then
            logger:debug(TAG, "capture screen")
            prepareCapture = true
            local screenCap = display.captureScreen( true )
            screenCap:scale( 0.5, 0.5 )
            screenCap.x = gameConfig.contentCenterX
            screenCap.y = gameConfig.contentCenterY
            screenCap:removeSelf()
        end
        logger:debug(TAG, "event.keyName "..event.keyName)
    elseif event.phase == "up" then
        if event.keyName == "leftControl" or event.keyName == "rightControl" then
            logger:debug(TAG, "cancel capture screen")
            prepareCapture = false
        end
    end
    --return true
end

function capture:startCapture()
    Runtime:addEventListener( "key", self )
end

function capture:endCapture()
    Runtime:removeEventListener( "key", self )
end

return capture
