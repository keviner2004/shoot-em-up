local Boss = {}
local BossBullet = require("BossBullet")
local Missile = require("Missile")
local move = require("move")

Boss.new = function(player)
    local boss = display.newGroup()
    boss.player = player
    boss.hp = 100000
    boss.head = display.newSprite( myImageSheet , 
        {
            frames={
                sheetInfo:getFrameIndex("Boss/Head Sequence/f1"),
                sheetInfo:getFrameIndex("Boss/Head Sequence/f2"),
                sheetInfo:getFrameIndex("Boss/Head Sequence/f3"),
                sheetInfo:getFrameIndex("Boss/Head Sequence/f4"),
            },
            time = 800
        }
    )
    boss.ring = display.newSprite( myImageSheet , 
        {
            frames={
                sheetInfo:getFrameIndex("Boss/ring"),
            }
        }
    ) 
    boss.defaultX = display.contentWidth / 2
    boss.defaultY = 300
    boss:insert(boss.head)
    boss:insert(boss.ring)

    boss.head:play()

    physics.addBody(boss, "dynamic", {radius = boss.ring.width / 2, filter = {categoryBits=2, maskBits=39}})

    boss.preCollision = function(self, event)
        --print("before hit by "..event.other.name)
        if event.other.name == "bullet" then 
            if event.contact then
                event.contact.isEnabled = false
            else 
                print("WTF")
            end

        end
    end

    boss.collision = function(self, event)
        --print("hit by "..event.other.name..":"..self.hp)
        if event.other.name == "bullet" then 
            self.hp = self.hp - event.other.damage
            if self.hp < 0 then
                --removeBody cannot be called when the world is locked and in the middle of number crunching, such as during a collision event, so we use remove the body latter
                timer.performWithDelay( 1, 
                    function(e) 
                        physics.removeBody(self)
                    end)
                if self.items then
                    --drop items
                    timer.performWithDelay(1, function(event)
                        self:dropItems()
                    end)
                    
                end
            end
        end
    end

    boss:addEventListener("preCollision", boss)
    boss:addEventListener("collision", boss)

    function rotateRing()
        transition.to(boss.ring, {rotation = boss.ring.rotation+30, time = 1000, onComplete = rotateRing})
    end
    rotateRing()

    function boss:mode1()
        --bash to player
        transition.to(self, { time = 1000, delay = 2000, y = display.contentHeight + self.height, onComplete = function()
            --self.x = display.contentWidth / 2
            self.y = - self.height
            transition.to(self, { time = 2000 ,y =  self.height})
        end} )
    end

    function boss:mode2()
        --rotated and bullet
        local startDegree = 0
        local devision = 15
        local count = math.floor(360 / devision) 
        local once = 5
        transition.to(self, {
            x = display.contentWidth / 2,
            y = display.contentHeight / 2,
            time = 1000, 
            onComplete = function()
                timer.performWithDelay(200, function ()
                    local bullet = BossBullet.new()
                        bullet.onDestroy = function()
                            print("bullet detroyed")
                        end
                        bullet.x = self.x
                        bullet.y = self.y
                        move.toward(bullet, {degree = startDegree})
                    startDegree = startDegree + devision
                end, count)
                
                timer.performWithDelay(200*count, function ()
                    timer.performWithDelay(200, function ()
                        local bullet = BossBullet.new()
                            bullet.onDestroy = function()
                                print("bullet detroyed")
                            end
                            bullet.x = self.x
                            bullet.y = self.y
                            move.toward(bullet, {degree = startDegree})
                        startDegree = startDegree - devision
                    end, count)
                end)
            end
        })
    end

    --shoot tracking missle
    function boss:mode3()
        local num = 6
        for i = 1, num do
            --print("Fire!!")
            local missile = Missile.new({fireTo = "character"})
            missile.x = self.x
            missile.y = self.y
            missile:seek(self.player, {degree = 360 / ( num + 1) * i, magnitude = 300})
        end
    end

    --bounce and roll mode
    function boss:mode4()
        self:setLinearVelocity(-300, 300)
        local num = 8
        local t = timer.performWithDelay(1000, function()
            --print("111")
            for i = 0, num - 1 do
                local bullet = BossBullet.new()
                bullet.x = self.x
                bullet.y = self.y
                move.toward(bullet, {degree = 360 / ( num ) * i})
            end
        end, -1)
        timer.performWithDelay(6000, function()
            self:setLinearVelocity(0, 0)
            timer.cancel(t)
            transition.to(boss, {time = 1000, x = self.defaultX, y = self.defaultY})
        end)


    end
    function boss:split()

    end

    return boss

end
return Boss