local Boss = {}
local BossBullet = require("BossBullet")
local Missile = require("Missile")
local move = require("move")
local Square = require("ui.square")
local GlassPanel = require("ui.GlassPanel")

Boss.new = function(player)
    local boss = display.newGroup()
    boss.player = player
    boss.type = "boss"
    boss.name = "boss"
    boss.hp = 1000
    boss.maxHp = 1000
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
        --print(self.type.." hit by "..event.other.name..":"..self.hp)
        if event.other.name == "bullet" then 
            self.hp = self.hp - event.other.damage
            self:onHurt(event.other.damage)
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

    function boss:initHPBar()
        print("initHPBar")
        local hpBar = display.newGroup()
        local glassPanel = GlassPanel.new(display.contentWidth - 100, 80)
        local base = Square.new(display.contentWidth - 150, 50, "shadow")

        local hpValue = Square.new(display.contentWidth - 150, 50, "red")
        local hpValue2 = Square.new(display.contentWidth - 150, 50, "yellow")
        local hpValue3 = Square.new(display.contentWidth - 150, 50, "green")

        base.x = 0
        glassPanel.x = 0
        base.y = 0
        glassPanel.y = 0

        hpBar:insert(glassPanel)
        hpBar:insert(base)
        hpBar:insert(hpValue)
        hpBar:insert(hpValue2)
        hpBar:insert(hpValue3)
        hpBar.lifes = {hpValue, hpValue2, hpValue3}
        hpBar.x = display.contentWidth / 2
        hpBar.y = 100
        hpBar.lifeCount = #hpBar.lifes
        hpBar.hpText = display.newText("0/0", display.contentWidth/2, 100, "kenvector_future_thin", 64)
        hpBar.nameText = display.newText("Boss", display.contentWidth/2, 100, "kenvector_future_thin", 64)
        hpBar.hpText.x = 0
        hpBar.hpText.y = 0
        nameText.x = 
        hpBar:insert(hpBar.hpText)
        hpBar:insert(hpBar.nameText)
        self.hpBar = hpBar
        
        function hpBar:update(cur, max)
            print("Update HP Bar")
            local ratio = cur/max
            self.hpText.text = string.format("%d/%d", cur, max)
            local megnitude = ratio * 100 / (100/#self.lifes) * base.width
            local count = 1
            print ("R:", cur, max, ratio * 100 / (100/#self.lifes))
            while megnitude >= 0 do
                --print("megnitude: "..megnitude)
                local remain = megnitude - base.width
                
                if remain > 0 then
                    self.lifes[count]:setWidth(base.width)
                else
                    self.lifes[count]:setWidth(megnitude)
                    print("M: "..megnitude..", "..count.." / "..#self.lifes, self.lifes[count].contentWidth)
                end
                self.lifes[count].x = (self.lifes[count].contentWidth - base.width)/2
                self.lifes[count].y = 0
                megnitude = remain
                if remain > 0 then count = count + 1 end
            end
            if count < #self.lifes then
                for i = count+1, #self.lifes do
                    print("set "..i.."th life to zero")
                    self.lifes[i]:setWidth(0)
                    self.lifes[i].x = (self.lifes[i].contentWidth - base.width)/2
                    self.lifes[i].y = 0
                end
            end
            
        end
        hpBar:update(self.hp , self.maxHp)

        self.hpBar = hpBar
        --hpValue3:setWidth(500)
        --hpValue3:setWidth(500)
        --hpValue3:setWidth(500)
        --hpValue3.x = (hpValue3.contentWidth - base.width)/2
    end

    function boss:onHurt(damage)
        self.hp = self.hp - damage
        if self.hp < 0 then
            self.hp = 0
        end
        self.hpBar:update(self.hp , self.maxHp)
    end

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