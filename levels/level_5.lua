local move = require("move")
local Station = require("buildings.Station")
local Sublevel = require("Sublevel")
local sublevel = Sublevel.new("turret and station", "keviner2004")
local Turret = require("enemies.Turret")
local util = require("util")

function sublevel:show(options)
    local station = Station.new()
    local turret1 = Turret.new({player = self.player})
    local turret2 = Turret.new({player = self.player})
    local turret3 = Turret.new({player = self.player})

    station.rotation = 15
    station.x = display.contentWidth/2
    station.y = -station.height/2
    --station.y = display.contentHeight/2
    station:enablePhysics()
    station:setLinearVelocity( 0, self.stageSpeed )
    
    --station:setLinearVelocity( xVelocity, yVelocity )

    turret1.base.rotation = 15
    turret2.base.rotation = 15
    turret3.base.rotation = 15
    
    turret1:shoot(0)
    turret2:shoot(300)
    turret3:shoot(600)

    move.stick(turret1, station, {
        offsetX = station.width * 0.48, 
        offsetY = -station.height * 0.16
    })

    move.stick(turret2, station, {
        offsetX = 0, 
        offsetY = 0
    })

    move.stick(turret3, station, {
        offsetX = -station.width * 0.22, 
        offsetY = -station.height * 0.295
    })

    station:callWhenInStage(
        function()
            print("station is on stage")
            station:enableAutoDestroy()
        end
    )

    turret1:callWhenInStage(
        function()
            print("turret1 is on stage")
            turret1:enableAutoDestroy()
        end
    )

    turret2:callWhenInStage(
        function()
            print("turret2 is on stage")
            turret2:enableAutoDestroy()
        end
    )

    turret3:callWhenInStage(
        function()
            print("turret3 is on stage")
            turret3:enableAutoDestroy()
        end
    )
    
    self.view:insert(station)
    self.view:insert(turret1)
    self.view:insert(turret2)
    self.view:insert(turret3)

    self.station = station
end

function sublevel:finish()
    if not util.isExist(self.station) then
        return true
    end
    return false
end

return sublevel