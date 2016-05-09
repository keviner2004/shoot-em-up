local Boss = {}
local BossBullet = require("BossBullet")
local Missile = require("Missile")
local move = require("move")
local Enemy = require("Enemy")
local Square = require("ui.square")
local GlassPanel = require("ui.GlassPanel")
local Sprite = require("Sprite")
local Ufo = require("Ufo")
local util = require("util")
local bossId = 0

Boss.new = function(player, options)
    bossId = bossId + 1
    local boss = Enemy.new()
    boss.bossId = bossId
    boss.player = player
    boss.master = (options and options.master) or boss
    boss.type = "boss"
    boss.name = (options and options.name) or "boss"
    boss.hp = (options and options.hp) or 50
    boss.maxHp = (options and options.maxHp) or 50
    boss.dir = 180
    boss.isDead = false
    boss.ignoreWall = false
    boss.cloneCount = (options and options.cloneCount) or 0
    boss.maxClones = (options and options.maxClones) or 1
    boss.cloneAfterDead = (options and options.cloneAfterDead) or false
    boss.xScale = (options and options.xScale) or 1
    boss.yScale = (options and options.yScale) or 1
    boss.invincible = false
    boss.head = Sprite.new({
                    "Boss/Head Sequence/f1",
                    "Boss/Head Sequence/f2",
                    "Boss/Head Sequence/f3",
                    "Boss/Head Sequence/f4",
                }, {time = 800})

    boss.ring = Sprite.new("Boss/ring")
    boss.defaultX = display.contentWidth / 2
    boss.defaultY = 300
    boss:insert(boss.head)
    boss:insert(boss.ring)
    boss.head:play()
    boss.maskBits = 39
    --timer.performWithDelay(1, function()
    
    --end)

    boss.preCollision = function(self, event)
        print("boss before hit by "..event.other.name)
        if event.other.name == "bullet" then 
            if event.contact then
                event.contact.isEnabled = false
            end
        elseif event.other.name == "wall" and self.ignoreWall then 
            if event.contact then
                event.contact.isEnabled = false
            end
        elseif event.other.name == "character" then
            --print("ignore character")
            if event.contact then
                event.contact.isEnabled = false
            end
        end
    end

    physics.addBody(boss, "dynamic", {bounce = 1, radius = boss.width * boss.xScale / 2, filter = {categoryBits=2, maskBits=boss.maskBits}})

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
        hpBar.type = "hpBar"
        hpBar.name = "hpBar"
        hpBar:insert(glassPanel)
        hpBar:insert(base)
        hpBar:insert(hpValue)
        hpBar:insert(hpValue2)
        hpBar:insert(hpValue3)
        hpBar.lifes = {hpValue, hpValue2, hpValue3}
        hpBar.x = display.contentWidth / 2
        hpBar.y = 100
        hpBar.lifeCount = #hpBar.lifes
        hpBar.hpText = display.newText("0/0", display.contentWidth/2, 100, "kenvector_future_thin", 40)
        hpBar.nameText = display.newText("Boss", display.contentWidth/2, 100, "kenvector_future_thin", 40)
        hpBar.hpText.x = 0
        hpBar.hpText.y = 0
        hpBar.nameText.x = - glassPanel.contentWidth / 2 + 100
        hpBar.nameText.y = 0
        hpBar:insert(hpBar.hpText)
        hpBar:insert(hpBar.nameText)
        
        function hpBar:update(cur, max)
            --print("Update HP Bar: "..cur.."/"..max)
            local ratio = cur/max
            self.hpText.text = string.format("%d/%d", cur, max)
            local megnitude = ratio * 100 / (100/#self.lifes) * base.width
            local count = 1
            --print ("R:", cur, max, ratio * 100 / (100/#self.lifes))
            while megnitude >= 0 do
                --print("megnitude: "..megnitude)
                local remain = megnitude - base.width
                
                if remain > 0 then
                    self.lifes[count]:setWidth(base.width)
                else
                    self.lifes[count]:setWidth(megnitude)
                    --print("M: "..megnitude..", "..count.." / "..#self.lifes, self.lifes[count].contentWidth)
                end
                self.lifes[count].x = (self.lifes[count].contentWidth - base.width)/2
                self.lifes[count].y = 0
                megnitude = remain
                if remain > 0 then count = count + 1 end
            end
            if count < #self.lifes then
                for i = count+1, #self.lifes do
                    --print("set "..i.."th life to zero")
                    self.lifes[i]:setWidth(0)
                    self.lifes[i].x = (self.lifes[i].contentWidth - base.width)/2
                    self.lifes[i].y = 0
                end
            end
        end

        function hpBar:hide()
            transition.to(self, {alpha = 0})
        end

        function hpBar:show()
            transition.to(self, {alpha = 1})
        end

        hpBar:update(self.hp , self.maxHp)
        --hpValue3:setWidth(500)
        --hpValue3:setWidth(500)
        --hpValue3:setWidth(500)
        --hpValue3.x = (hpValue3.contentWidth - base.width)/2
        self.hpBar = hpBar
        return hpBar
    end

    --boss.hpBar = (options and options.hpBar) or boss:initHPBar()

    function boss:onHurt(damage)
        if self.invincible then
            print("Boss is invincible")
            return
        end
        --print("Hurt on "..self.bossId..", damage:"..damage..", "..self.hp.."/"..self.maxHp)
        if self.isDead then
            return
        end
        local realDamage = damage
        if damage > self.hp then
            realDamage = self.hp
        end
        self.hp = self.hp - damage
        if self.hpBar then
            self.hpBar:update(self.hp , self.maxHp)
        end
        self:afterHurt(realDamage)
    end

    function boss:onDead()
        print("onDead")
        self.hp = 0
        self.isDead = true
        self.player.score = self.player.score + self.maxHp
        --clear timers
        for k, v in pairs(self.timers) do
            timer.cancel(v)
        end
        self.timers = {}
        if not util.isExist(self.ufo1) then
            transition.to(self.ufo1, {time = 300, alpha = 0})
        end
        if not util.isExist(self.ufo2) then
            transition.to(self.ufo2, {time = 300, alpha = 0})
        end
        if not util.isExist(self.ufo3) then
            transition.to(self.ufo3, {time = 300, alpha = 0})
        end
        if not util.isExist(self.ufo4) then
            transition.to(self.ufo4, {time = 300, alpha = 0})
        end

        if self.cloneCount == 0 then
            self:onDefeated()
        end

        if self.cloneAfterDead and self.cloneCount < self.maxClones then
            self:split()
        end
        transition.to(self, {time = 300, alpha = 0, onComplete = function()
            self:removeSelf()
        end})
    end

    function boss:onDefeated()
        print("boss is defeated")
    end

    function boss:afterHurt(damage)
        print("boss afterHurt")
    end

    function boss:rotateRing()
        if not self.isDead then
            transition.to(boss.ring, {tag = "bossrotation", rotation = boss.ring.rotation+30, time = 1000, onComplete = rotateRing})
        end
    end

    boss:rotateRing()

    function boss:stopRotation()
        transition.cancel("bossrotation")
    end

    function boss:act()
        self:stage2()
        --self:stage1(function()
            --self:stage2()
        --end)

        --self:stage3()
    end

    function boss:isStage1()
        return self.hp/self.maxHp > 0.66
    end

    function boss:isStage2()
        return self.hp/self.maxHp > 0.33 and self.hp/self.maxHp < 0.66
    end

    function boss:isStage3()
        return self.hp/self.maxHp > 0 and self.hp/self.maxHp < 0.33
    end

    function boss:stage1(onComplete)
        boss.defaultX = self.x
        boss.defaultY = self.y
        print("mode 1_2 start")

        if self:isStage1()then
            self:mode2(function()
                self:mode1_2(function()
                    self:stage1()
                end)
            end)
        else
            if onComplete then
                onComplete()
            end
        end 
    end

    --[[
        The boss in stage 2 will shoot tracking missle and summon ufos.
    --]]

    function boss:stage2(count)
        --pull down the ring
        local missileDelay = 300
        if not count or count == 1 then
            boss:stopRotation()
            physics.removeBody(boss)
            physics.addBody(boss, "dynamic", {bounce = 1, radius = boss.head.width / 2, filter = {categoryBits=2, maskBits=boss.maskBits}})
            transition.to(boss.ring, {time = 300, alpha = 0, onComplete = function()
                boss.ring:removeSelf()
            end})
        else
            missileDelay = 0
        end

        local startDegree = 0
        --prepare rocket
        self:addTimer(missileDelay, function()
            if self.isDead then
                print("Cancel missile because boss is dead")
                return
            end
            --print("New missle")
            local num = 3
            for i = 1, num do
                local missile = Missile.new({fireTo = "character"})
                print(self.x)
                self.parent:insert(missile)
                move.rotatAround(missile, {target = self, speed = 3, distance = 150, startDegree = startDegree + 360 / num * (i-1)})
                --print("Prepare missile: "..missile.x.."x"..missile.y)
                self:addTimer(2000, function()
                    if missile.x == nil then
                        return
                    end
                    move.stop(missile)
                    --print("Frie! "..missile.rotation)
                    missile:seek(self.player, {degree = 360 - missile.rotation, magnitude = 450})
                end)
            end
        end)
        --bash
        self:addTimer(3000, function()
            if self.x == nil then
                return
            end
            
            boss:bash({
                delay = 0,
                back = false,
                time = 1000
            })
        end)
        --sumon laser plan
        local margin = 5
        self:addTimer(5000, function()
            self.ufo1 = Ufo.new()
            self.ufo2 = Ufo.new()
            self.ufo3 = Ufo.new()
            self.ufo4 = Ufo.new()
            self.parent:insert(self.ufo1)
            self.parent:insert(self.ufo2)
            self.parent:insert(self.ufo3)
            self.parent:insert(self.ufo4)
            local num = 4

            gap = display.contentWidth/5

            self.ufo1.x = display.contentWidth
            self.ufo1.y = display.contentHeight
            ----[[
            self.ufo2.x = gap * 2
            self.ufo2.y = -self.ufo2.height

            self.ufo3.x = gap * 3
            self.ufo3.y = -self.ufo3.height

            self.ufo4.x = 0
            self.ufo4.y = display.contentHeight
            print("Ufo 1s parent ")
            print(self.ufo1.parent)
            transition.to(self.ufo1, {time = 1200, x = gap, y = self.ufo1.height, onComplete = function ()
                self.ufo1:beam(3000)
                self:addTimer(3100 ,function()
                    print("Ufo 1 leave ")
                    transition.to(self.ufo1, {time = 500, y = -self.ufo1.height, onComplete = function()
                        self.ufo1:removeSelf()
                    end})
                end)
            end})
            transition.to(self.ufo4, {time = 1200, x = gap*4, y = self.ufo4.height, onComplete = function ()
                self.ufo4:beam(3000)
                self:addTimer(3100 ,function()
                    transition.to(self.ufo4, {time = 500, y = -self.ufo4.height, onComplete = function()
                        self.ufo4:removeSelf()
                    end})
                end)
            end})
            transition.to(self.ufo2, {time = 1200, y = self.ufo2.height, onComplete = function ()
                self.ufo2:beam(3000)
                self:addTimer(3100 ,function()
                    transition.to(self.ufo2, {time = 500, y = -self.ufo2.height, onComplete = function()
                        self.ufo2:removeSelf()
                    end})
                end)                
            end})
            transition.to(self.ufo3, {time = 1200, y = self.ufo3.height, onComplete = function ()
                self.ufo3:beam(3000)
                self:addTimer(3100 ,function()
                    transition.to(self.ufo3, {time = 500, y = -self.ufo3.height, onComplete = function()
                        self.ufo3:removeSelf()
                    end})
                end)

            end})
            ----]]
            
            if not count then
                count = 2
            else
                count = count + 1
            end

            self:addTimer(6000 ,function()
                if self.hpBar then
                    self.hpBar:show()
                end
                self.invincible = false
                --if self:isStage2() then
                if self.hp > 0 then
                    boss:back({onComplete = function()
                        --self.invincible = false
                        self:stage2(count)
                    end})
                end
            end)

        end)
        
    end

    --[[
        The boss in stage 3 will clone itself to attack the player
    --]]
    function boss:stage3()
        transition.to(self, {time = 300, alpha = 0, onComplete = function()
            self:removeSelf()
        end})
        self:split()
    end

    function boss:split()
        local newBoss1 = self:clone()
        local newBoss2 = self:clone()
        boss.parent:insert(newBoss1)
        boss.parent:insert(newBoss2)
        newBoss1:bounce(290, 290)
        newBoss2:bounce(-300, 300)
    end

    function boss:getTotalClones()
        local total = 0
        for i = 1, self.maxClones do
            total = total + 2^i
        end
        return total
    end
    function boss:clone()
        local total = self:getTotalClones()

        local hp = self.master.maxHp / total
        local maxHp = hp
        print("Clone boss with hp "..hp)
        local newBoss = Boss.new(
            self.player,
            {
                hp = hp,
                maxHp = hp,
                cloneAfterDead = true,
                maxClones = self.maxClones,
                cloneCount = self.cloneCount + 1,
                hpBar = self.hpBar,
                xScale = (4/5) ^ (self.cloneCount + 1),
                yScale = (4/5) ^ (self.cloneCount + 1),
                master = self.master or self,
                name = "boss-clone-"..self.cloneCount
            }
        )
        newBoss.x = self.x
        newBoss.y = self.y

        function newBoss:afterHurt(damage)
            self.master:onHurt(damage)
        end

        return newBoss
    end


    function boss:bash(options)
        self.ignoreWall = true
        --bash to player
        transition.to(self, { time = options.time or 1000, delay = options.delay or 0, y = display.contentHeight + self.height, onComplete = function()
            --print("mode 1 complete")
            --self.x = display.contentWidth / 2
            if not util.isExist(self) then
                return
            end
            self.y = - self.height
            if self.hpBar then
                self.hpBar:hide()
            end
            self.invincible = true
            if options.back then
                self:back()
            end
        end} )
    end

    function boss:back(options)
        transition.to(self, { time = 2000 ,y = self.defaultY, onComplete = function ()
            if options and options.onComplete then
                --print("mode 1 complete2")
                options.onComplete()
            end
        end})
    end

    function boss:mode1_2(onComplete)
        self.ignoreWall = true
        move.toward(self, {
            radius = math.atan2(self.player.y - self.y, self.player.x - self.x), 
            offsetX = 15,
            offsetY = 15, 
            back = true,
            onComplete = function()
                if onComplete then
                    onComplete()
                end
        end})
    end

    function boss:mode2(onComplete)
        print("mode2")
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
                self:addTimer(200, function ()
                    local bullet = BossBullet.new()
                    self.parent:insert(bullet)
                    bullet.onDestroy = function()
                        print("bullet detroyed")
                    end
                    self.parent:insert(bullet)
                    bullet.x = self.x
                    bullet.y = self.y
                    move.toward(bullet, {degree = startDegree})
                    startDegree = startDegree + devision
                end, count)
                
                self:addTimer(200*count, function ()
                    self:addTimer(200, function ()
                        local bullet = BossBullet.new()
                        self.parent:insert(bullet)
                        bullet.onDestroy = function()
                            print("bullet detroyed")
                        end
                        bullet.x = self.x
                        bullet.y = self.y
                        move.toward(bullet, {degree = startDegree})
                        startDegree = startDegree - devision
                    end, count)
                end)

                self:addTimer(400*count, function()
                    if onComplete then
                        onComplete()
                    end
                end)
            end
        })
    end

    --bounce and roll mode
    function boss:bounce(vx, vy)
        self.ignoreWall = false
        self:setLinearVelocity(vx, vy)
        local num = 4
        self:addTimer(1000, function(event)
            if self.isDead or self.x == nil then
                timer.cancel(event.source)
                return 
            end
            --shoot bullet
            for i = 0, num - 1 do
                local bullet = BossBullet.new()
                bullet.x = self.x
                bullet.y = self.y
                if self.parent then
                    self.parent:insert(bullet)
                end
                move.toward(bullet, {degree = 360 / ( num ) * i})
            end
            local vx, vy = self:getLinearVelocity()
            if vy == 0 then 
                self:setLinearVelocity(vx, 300)
            end
        end, -1)
    end
    return boss

end
return Boss