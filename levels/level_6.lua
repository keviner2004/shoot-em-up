local move = require("move")
local Sublevel = require("Sublevel")
local Supply = require("objects.Supply")
local sublevel = Sublevel.new("station and cart", "keviner2004")
function sublevel:show(options)
    print("Show")
    --New victim
    local supply = Supply.new()
    supply.x = display.contentWidth/2
    supply.y = display.contentHeight/2
    self.view:insert(supply)
    supply:addItem("items.PowerUp", {level = 3})
end

return sublevel