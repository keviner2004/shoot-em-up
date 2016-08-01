local gameConfig = require("gameConfig")
local move = require("move")
local Station = require("buildings.Station")
local Line = require("buildings.Line")
local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("turret and station", "keviner2004")
local Turret = require("enemies.Turret")
local Astronaut = require("enemies.Astronaut")
local util = require("util")

function sublevel:show(options)
    local station = Station.new()
    local line = Line.new()
    local turret1 = Turret.new({player = self.player, shootInterval = 1000, shootDelay = 0})
    local turret2 = Turret.new({player = self.player, shootInterval = 1000, shootDelay = 300})
    local turret3 = Turret.new({player = self.player, shootInterval = 1000, shootDelay = 600})
    local astronaut = Astronaut.new({player = self.player, shootInterval = 500})
    
    astronaut:away()
    turret1:away()
    turret2:away()
    turret3:away()
    line:away()

    station.rotation = 15
    line.rotation = -45
    station.x = gameConfig.contentWidth/2
    station.y = -station.height/2
    station:enablePhysics()
    
    turret1.base.rotation = 15
    turret2.base.rotation = 15
    turret3.base.rotation = 15
    
    turret1:startShootLoop(0)
    turret2:startShootLoop(300)
    turret3:startShootLoop(600)
    astronaut:startShootLoop()

    turret1.x = station.x + station.width * 0.48
    turret1.y = station.y -station.height * 0.16

    turret2.x = station.x
    turret2.y = station.y

    turret3.x = station.x -station.width * 0.22
    turret3.y = station.y -station.height * 0.295
    
    line.x = station.x -station.width * 0.4
    line.y = station.y -station.height * 0.45

    astronaut.x = station.x -station.width * 0.55
    astronaut.y = station.y -station.height * 0.45

    station:setLinearVelocity( 0, self.stageSpeed )
    turret1:setLinearVelocity( 0, self.stageSpeed )
    turret2:setLinearVelocity( 0, self.stageSpeed )
    turret3:setLinearVelocity( 0, self.stageSpeed )
    astronaut:setLinearVelocity( 0, self.stageSpeed )
    line:enablePhysics()
    line:setLinearVelocity( 0, self.stageSpeed )

    station:callWhenInStage(
        function()
            print("********station is on stage")
            station:enableAutoDestroy()
        end
    )

    turret1:callWhenInStage(
        function()
            print("********turret1 is on stage")
            turret1:enableAutoDestroy()
        end
    )

    turret2:callWhenInStage(
        function()
            print("********turret2 is on stage")
            turret2:enableAutoDestroy()
        end
    )

    turret3:callWhenInStage(
        function()
            print("********turret3 is on stage")
            turret3:enableAutoDestroy()
        end
    )
    line:callWhenInStage(
        function()
            print("********line is on stage")
            line:enableAutoDestroy()
        end
    )

    astronaut:callWhenInStage(
        function()
            print("********astronaut is on stage")
            astronaut:enableAutoDestroy()
        end
    )
    
    self.view:insert(line)
    self.view:insert(station)
    self.view:insert(turret1)
    self.view:insert(turret2)
    self.view:insert(turret3)
    self.view:insert(astronaut)
    self.station = station
end

function sublevel:isFinish()
    if not util.isExists(self.station) then
        return true
    end
    return false
end

return sublevel