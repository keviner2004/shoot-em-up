local BeamSeg = require("BeamSeg")
local move = require("move")
local Beam = {}
Beam.new = function (options)
    print("beam")
    local beam = display.newGroup()
    beam.stacking = false
    beam.offset = 10
    beam.range = options and options.range or 365
    beam.rotation = options and options.rotation or 0
    beam.myCircle = display.newCircle( 3, 3, 3 )
    beam.myCircle:setFillColor( 0.5 )
    beam.myCircle.strokeWidth = 5
    beam.myCircle:setStrokeColor( 1, 0, 0 )
    function beam:stack(offset)
        local beamSeg = BeamSeg.new()
        beamSeg.x = self[self.numChildren].x
        beamSeg.y = self[self.numChildren].y
        self:insert(beamSeg)
        self:moveOrStack(beamSeg, offset)
    end

    function beam:getLength()
        if self.numChildren == 0 then
            return 0
        end 
        if self.numChildren > 1 then
            --print("")
            return self[self.numChildren].y -  self[1].y + self[1].height
        end
        return self[1].height
    end

    function beam:resize()
        if not self[1] then
            return
        end
        local l = self:getLength()
        --print("resize with len "..l)
        self.x = self.defaultX - (l/2 - self[1].height/2) * math.sin(math.rad(self.rotation)) 
        self.y = self.defaultY + (l/2 - self[1].height/2) * math.cos(math.rad(self.rotation))
        self.myCircle.x = self.x
        self.myCircle.y = self.y
    end

    function beam:moveOrStack(beamSeg, offset)
        local remain = beamSeg.y + offset - (self[self.numChildren-1].y + self[1].height)
        if remain > 0 then
            beamSeg.y = self[self.numChildren-1].y + beamSeg.height
            self:stack(remain)
        else
            --local l1 = self:getLength()
            --print("MoveOffset: "..offset)
            beamSeg.y = beamSeg.y  + offset
            --self.y = self.y + offset /2

            for i = 1, self.numChildren do
                self[i].y = self[i].y - offset/2
            end
            self:rayCast()
            self:resize()
            --self.x = self.defaultX
            --self.y = self.defaultY
            self:reinitPhysicBody()
        end
    end

    function beam:reinitPhysicBody()
        physics.removeBody(self)
        physics.addBody(self, "dynamic", { density=1.0, friction=0, bounce=0 , filter = {categoryBits=4, maskBits=0}})
    end

    function beam:last(offset)
        local offset = offset or 1
        return self[self.numChildren - offset + 1]
    end

    function beam:first()
        return self[1]
    end

    function beam:newSeg()
        return self[self.numChildren] 
    end

    function beam:shoot()
        print("shoot")

        local max =  self.rotation + self.range
        local min =  self.rotation - self.range
        self.defaultX = self.x
        self.defaultY = self.y
        --transition.to(beam, {time = 10000, rotation = 350})
        local count = 1
        Runtime:addEventListener("enterFrame", function()
            count = count + 1
            local rotated = false
            if self.burst and self.burst.rotation then
                self.burst.rotation = self.burst.rotation + 1
            end
            if self.range and self.rotation > min then
                self.rotation = self.rotation - 1
                rotated = true
                --print("R1 "..count)
                self:resize()
                self:rayCast()
            end

            if self.numChildren == 0 then
                print("do 1")
                local beamSeg = BeamSeg.new()
                beamSeg.x = 0
                beamSeg.y = 0
                self:insert(beamSeg)
                --local numOfSegs = math.ceil(self.offset / beamSeg.height)
                --numOfSegs = numOfSegs - 1
            elseif self.numChildren == 1 and not self:isOut(self:last()) then
                --print("do 2")
                self:stack(self.offset)
            elseif self.numChildren > 1 and not self:isOut(self:last()) then
                --print("do 3")
                beam:moveOrStack(self:last(), self.offset)
            elseif self.numChildren > 1 and self:isOut(self:last(2)) then
                print("do 4 1: "..self.numChildren)
                --print("R1 "..count)
                --self:resize()
                for i = 1, self.numChildren do
                    print("Before: "..i..":"..self[i].y)
                end
                local offset = self:last().y-self:last(2).y
                self[self.numChildren]:removeSelf()

                --for i = 1, self.numChildren do
                --    print("After: "..i..":"..self[i].y)
                --end

                for i = 1, self.numChildren do
                    self[i].y = self[i].y + offset/2
                end

                --for i = 1, self.numChildren do
                --    print("Modified: "..i..":"..self[i].y)
                --end

                --print("Idea top y "..self:getLength()/2 - self[1].height/2)
                --print("do 4 2: "..self.numChildren)
                --print("R2 "..count)
                self:resize()
                self:reinitPhysicBody()

            else
                --print("do nothing")
            end

        end)
    end

    function beam:newBurst()
        return display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("Lasers/laserGreen_burst")}})
    end

    function beam:isOut(beamSeg)
        return move.isOut2(beamSeg:localToContent( 0, 0 ))
    end

    function beam:stop()
        Runtime:removeEventListener("enterFrame", self)
    end
    
    function beam:rayCast()
        if not self:first() or not self:last() then
            return
        end
        local startX, startY = self:first():localToContent( 0, 0)
        local endX, endY = self:last():localToContent( 0, self:last().height)
        --print("shoot rayCast [", startX, ",", startY, "] => ", "[", endX, ",", endY, "]")
        local hits = physics.rayCast( 
            startX, startY,
            endX, endY,
            "sorted" )
        --[[
        if ( hits ) then
            -- There's at least one hit
            print( "Hit count: " .. tostring( #hits ) )

            -- Output the results
            for i,v in ipairs( hits ) do
                print( "Hit: ", i, v.object.type, " Position: ", v.position.x, v.position.y, " Surface normal: ", v.normal.x, v.normal.y )
            end

            print( "The first object hit is: ", hits[1].object.type, " at position: ", hits[1].position.x, hits[1].position.y, " where the surface normal is: ", hits[1].normal.x, hits[1].normal.y, " and where the fraction along the ray is: ", hits[1].fraction )
        else
            -- No hits on raycast
        end
        --]]
        local hitWall = false
        if ( hits ) then
            -- There's at least one hit
            --print( "Hit count: " .. tostring( #hits ) )
            -- Output the results
            
            for i,v in ipairs( hits ) do
                --print("hit "..v.object.type)
                if v.object.type == "wall" then
                    if not self.burst then
                        self.burst = self:newBurst()
                    end
                    self.burst.x = v.position.x
                    self.burst.y = v.position.y
                    hitWall = true
                end
            end
        elseif not hit or not hitWall then
            if self.burst then
                print("not hit wall")
                self.burst:removeSelf() 
                self.burst = nil
            end
        end
    end   
    return beam

end
return Beam