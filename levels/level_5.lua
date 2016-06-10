local move = require("move")
local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("1-st level", "keviner2004")
local Turret = require("enemies.Turret")
function sublevel:show(options)
    print("Show")
    --New victim
    local turret = Turret.new({player = self.player})
    turret.x = display.contentWidth/2
    turret.y = display.contentHeight/2
    self.view:insert(turret)
    --victim:enableAutoDestroy()
end

return sublevel