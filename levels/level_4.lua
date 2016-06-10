local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004")
local Victim = require("victims.Victim")
function sublevel:show(options)
    print("Show")
    --New victim
    local victim = Victim.new()
    victim.x = display.contentWidth/2
    victim.y = display.contentHeight/2
    self.view:insert(victim)
    --victim:float(5, 800)
    victim:yell()
    victim:setLinearVelocity( 0, 15 )
    victim:enableAutoDestroy()
end

return sublevel