local gameConfig = require("gameConfig")
local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("9999999-004", "1-st level", "keviner2004", {duration = 1000})
local Victim = require("victims.Victim")
function sublevel:show(options)
    --New victim
    local victim = Victim.new()
    victim.x = gameConfig.contentWidth/4*3
    victim.y = -victim.height
    self.view:insert(victim)
    --victim:float(5, 800)
    victim:yell()
    victim:setLinearVelocity( 0, self.stageSpeed )
    
    victim:callWhenInStage(
        function()
            victim:enableAutoDestroy()        
        end
    )
end

return sublevel