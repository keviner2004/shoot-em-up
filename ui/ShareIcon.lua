local ShareIcon = {}
local gameConfig = require("gameConfig")
local facebook = require("facebook")
local Sprite = require("Sprite")
local dbHelper = require("dbHelper")

ShareIcon.new = function (options)
    local icon = Sprite["expansion-9"].new("UI/Icons/Share")
    icon.xScale = 0.6
    icon.yScale = 0.6
    icon.action = function()
        if dbHelper:getUserId() == "anonymous" and not gameConfig.fbskip then
          if options and options.auth then
            options.auth()
          end
        else
          facebook.share()
          print("Share...")
        end
    end 

    return icon
end


return ShareIcon