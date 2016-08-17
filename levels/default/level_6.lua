local gameConfig = require("gameConfig")
local move = require("move")
local Sublevel = require("Sublevel")
local Supply = require("objects.Supply")
local sublevel = Sublevel.new("9999999-006", "station and cart", "keviner2004")
function sublevel:show(options)
    print("Show")
    --New victim
    local supply = Supply.new()
    supply.x = gameConfig.contentWidth/2
    supply.y = gameConfig.contentHeight/2
    self.view:insert(supply)
    supply:addItem("items.PowerUp", {level = 3})
end

return sublevel