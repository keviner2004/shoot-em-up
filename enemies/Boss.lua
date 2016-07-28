local Boss = {}
local BossBullet = require("bullets.BossBullet")
local Missile = require("bullets.Missile")
local move = require("move")
local Enemy = require("Enemy")
local Square = require("ui.Square")
local GlassPanel = require("ui.GlassPanelEmpty")
local Sprite = require("Sprite")
local Ufo = require("enemies.AlienUFO")
local util = require("util")
local sfx = require("sfx")
local bossId = 0

Boss.new = function(players, options)
    bossId = bossId + 1
    local boss = Enemy.new()
    boss:addTag("boss")
    boss.bossId = bossId
    boss.players = players
    boss.master = (options and options.master) or boss
    boss.name = (options and options.name) or "boss"
    boss.hp = (options and options.hp) or 900
    boss.maxHp = (options and options.maxHp) or 900
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
                    "AlienUFOs/Ships/2"
                })

    --boss.ring = Sprite.new("Boss/ring")
    boss.defaultX = display.contentWidth / 2
    boss.defaultY = 300
    boss:insert(boss.head)
    --boss:insert(boss.ring)
    --boss.head:play()
    boss.maskBits = PHYSIC_CATEGORY_CHARACTER + PHYSIC_CATEGORY_ENEMY + PHYSIC_CATEGORY_BULLET + PHYSIC_CATEGORY_WALL
    boss.autoDestroy = false
    --timer.performWithDelay(1, function()
    
    --end)
    boss:setDefaultBullet("bullets.BossBullet")


    boss.preCollision = function(self, event)
        --print("boss before hit by "..event.other.name)
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

    physics.addBody(boss, "dynamic", {bounce = 1, radius = boss.width * boss.xScale / 2, filter = {categoryBits=PHYSIC_CATEGORY_ENEMY, maskBits=boss.maskBits}})

    function boss:getPlayer()
        for i = 1, #self.players do
            if util.isExists(self.players[i]) then
                return self.players[i]
            end
        end
    end
    
    function boss:initHPBar()
        print("initHPBar")
        local hpBar = display.newGroup()
        local glassPanel = GlassPanel.new(display.contentWidth*0.88, 80)
        local base = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, "shadow")
        local hpValue = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, "red")
        local hpValue2 = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, "yellow")
        local hpValue3 = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, "green")

        base.x = 0
        glassPanel.x = 0
        base.y = 0
        glassPanel.y = 0
        hpBar.type = "hpBar"
        hpBar.name = "hpBar"
        
        hpBar:insert(base)
        hpBar:insert(hpValue)
        hpBar:insert(hpValue2)
        hpBar:insert(hpValue3)
        hpBar:insert(glassPanel)
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
            local megnitude = ratio * #self.lifes * base.width
            local count = 1
            --print ("R:", cur, max, ratio * 100 / (100/#self.lifes))
            while megnitude >= 0 and count <= #self.lifes do
                --print("megnitude: "..megnitude)
                local remain = megnitude - base.width
                
                if remain > 0 then
                    --print("set h w", count, base.width)
                    self.lifes[count]:setWidth(base.width)
                else
                    --print("set h w", count, megnitude)
                    self.lifes[count]:setWidth(megnitude)
                    --print("M: "..megnitude..", "..count.." / "..#self.lifes, self.lifes[count].contentWidth)
                end
                self.lifes[count].x = (self.lifes[count].contentWidth - base.width)/2
                self.lifes[count].y = 0
                megnitude = remain
                --print("hp remain ", remain)
                if remain >= 0 then 
                    count = count + 1 
                end
                --count = count + 1
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

        function hpBar:hide(onComplete)
            transition.to(self, {alpha = 0, onComplete = onComplete})
        end

        function hpBar:show(onComplete)
            transition.to(self, {alpha = 1, onComplete = onComplete})
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
        print("Hurt on "..self.bossId..", damage:"..damage..", "..self.hp.."/"..self.maxHp)
        if self.isDead then
            return
        end
        local realDamage = damage
        if damage > self.hp then
            realDamage = self.hp
        end
        self.hp = self.hp - realDamage
        print("Hurted on "..self.bossId..":"..self.hp)
        if self.hpBar then
            self.hpBar:update(self.hp , self.maxHp)
        end
        self:afterHurt(realDamage)
    end

    function boss:onDead()
        print("onDead "..self.cloneCount.."."..self.bossId)
        self.hp = 0
        self.isDead = true
        self:getPlayer().score = self:getPlayer().score + self.maxHp

        if self.cloneCount == 0 then
            self.hpBar:hide(
                function()
                    print("Destroy hp bar")
                    self.hpBar:removeSelf()
                end
            )
            self:onDefeated()
        end

        if self.cloneAfterDead and self.cloneCount < self.maxClones then
            self:split()
        end
        transition.to(self, {time = 300, alpha = 0, onComplete = function()
            if self.cloneCount == 0 then
                print("Clear boss self")
                self:clear()
            else
                self:removeSelf()
            end
        end})
    end

    function boss:onDefeated()
        print("boss is defeated")
    end

    function boss:afterHurt(damage)
        print("boss afterHurt")
    end

    function boss:stopRotation()
        transition.cancel("bossrotation")
    end

    function boss:act()
        self:stage1(function()
            print("stage 1 complete, start stage2")
            self:stage2(1, function ()
                self:stage3()
            end)
        end)
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
            self:rotateBullet(function()
                self:bashToCharacter(function()
                    print("bash complete, is finish?")
                    self:stage1(onComplete)
                end)
            end)
        else
            print("stage 1 complete")
            if onComplete then
                onComplete()
            end
        end 
    end

    function boss:createUfo(x1, y1, x2, y2)
        local ufo = Ufo.new()
        self.parent:insert(ufo)
        ufo.x = x1
        ufo.y = y1
        transition.to(ufo, {time = 1200, x = x2, y = y2, onComplete = 
            function ()
                ufo:beam(3000)
                self:addTimer(3100 ,function()
                    print("retreat ufo")
                    transition.to(ufo, {time = 500, y = -ufo.height, onComplete = 
                        function()
                            ufo:removeSelf()
                        end
                    })
                end)
        end})
    end

    --[[
        The boss in stage 2 will shoot tracking missle and summon ufos.
    --]]

    function boss:stage2(count, onComplete)
        --pull down the ring
        local missileDelay = 300
        if not count or count == 1 then
            boss:stopRotation()
            physics.removeBody(boss)
            physics.addBody(boss, "dynamic", {bounce = 1, radius = boss.head.width / 2, filter = {categoryBits=PHYSIC_CATEGORY_ENEMY, maskBits=self.maskBits}})
            --transition.to(boss.ring, {time = 300, alpha = 0, onComplete = function()
            --    boss.ring:removeSelf()
            --end})
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
            sfx:play("surround")
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
                    sfx:play("seek")
                    missile:seek(self:getPlayer(), {degree = 360 - missile.rotation, magnitude = 450})
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

            local num = 4

            local gap = display.contentWidth / (num+1)

            self:createUfo(display.contentWidth, display.contentHeight, gap, 100)
            self:createUfo(gap*2, -100, gap * 2, 100)
            self:createUfo(gap*3, -100, gap * 3, 100)
            self:createUfo(0, display.contentHeight, gap * 4, 100)
            
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
                if self.hp > 0 then
                    boss:back({onComplete = function()
                        --self.invincible = false
                        if self:isStage2() then
                            self:stage2(count, onComplete)
                        else
                            if onComplete then
                                onComplete()
                            end
                        end
                    end})
                end
            end)

        end)
        
    end

    --[[
        The boss in stage 3 will clone itself to attack the player
    --]]
    function boss:stage3()
        function boss:showDestroyEffect()
            
        end
        transition.to(self, {time = 300, alpha = 0, onComplete = function()
            self:removeSelf()
        end})
        self:split()
    end

    function boss:split()
        sfx:play("split")
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
        --local hp = self.master.maxHp  / total
        --get cloned bosses hp
        if not self.master.cloneHp then
            self.cloneHp = self.hp / total
        end
        print("Clone boss with hp "..self.cloneHp)
        local newBoss = Boss.new(
            self.players,
            {
                hp = self.cloneHp,
                maxHp = self.cloneHp,
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
            self.master:hurt(damage)
        end

        return newBoss
    end


    function boss:bash(options)
        self.ignoreWall = true
        --bash to player
        transition.to(self, { 
            time = options.time or 1000, 
            delay = options.delay or 0, y = display.contentHeight + self.height, 
            onComplete = function()
                --print("mode 1 complete")
                --self.x = display.contentWidth / 2
                if not util.isExists(self) then
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

    function boss:bashToCharacter(onComplete)
        sfx:play("bash")
        if not util.isExists(self:getPlayer()) then
            return
        end
        self.ignoreWall = true

        move.toward(self, {
            radius = math.atan2(self:getPlayer().y - self.y, self:getPlayer().x - self.x), 
            offsetX = 15,
            offsetY = 15, 
            back = true,
            autoRotation = false,
            onComplete = function()
                if onComplete then
                    onComplete()
                end
        end})
    end

    function boss:rotateBullet(onComplete)
        print("rotateBullet")
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
                local i = self:addTimer(200, 
                    function ()
                        self:shoot({degree = startDegree})
                        startDegree = startDegree + devision
                    end, 
                count)
                self:addTimer(200*count, 
                    function ()
                    self:addTimer(200, 
                        function ()
                            self:shoot({degree = startDegree})
                            startDegree = startDegree - devision
                        end, 
                    count)
                end)

                self:addTimer(400*count, 
                    function()
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