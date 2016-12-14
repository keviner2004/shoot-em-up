local Enemy = require("Enemy")
local Sprite = require("Sprite")
local PhaseManager = require("PhaseManager")
local logger = require("logger")
local move = require("move")
local gameConfig = require("gameConfig")
local TAG = "MyBoss"
local MyEnemy = {}

MyEnemy.new = function(options)
    local myEnemy = Enemy.new(options)

    local part1 = Sprite.new("Ships/Parts/Cockpits/Bases/18")
    local part2 = Sprite.new("Ships/Parts/Cockpits/Glass/25")
    --left wing
    local part3 = Sprite.new("Ships/Parts/Wings/68") 
    --right wing
    local part4 = Sprite.new("Ships/Parts/Wings/68") 
    local part5 = Sprite.new("Ships/Parts/Engines/6")
    local part6 = Sprite.new("Ships/Parts/Engines/6")
    --left gun
    local part7 = Sprite.new("Ships/Parts/Guns/8")
    --right gun
    local part8 = Sprite.new("Ships/Parts/Guns/8")
    --set properties
    myEnemy.dir = 270
    myEnemy.maxHp = 5000
    myEnemy.hp = 1000
    myEnemy.players = options.players
    --insert to enemy
    myEnemy:insert(part7)
    myEnemy:insert(part8)
    myEnemy:insert(part5)
    myEnemy:insert(part6)
    myEnemy:insert(part3)
    myEnemy:insert(part4)
    myEnemy:insert(part1)
    myEnemy:insert(part2)
    --flip
    part3.xScale = -1
    part8.xScale = -1
    --position
    part2.y = part1.height/8
    part3.x = -part1.width/4*3
    part3.y = -part1.height/4
    part4.x = part1.width/4*3
    part4.y = -part1.height/4
    part5.x = -part1.width/2
    part5.y = -part1.height/4
    part6.x = part1.width/2
    part6.y = -part1.height/4
    part7.x = -part1.width/2
    part7.y = part1.height/4
    part8.x = part1.width/2
    part8.y = part1.height/4

    --enable physic
    myEnemy:enablePhysics()

    local phaseManager = PhaseManager.new()

    --[[
        phaseManager(phaseName, doSomething, finishCondition, nextPhase)        
    --]]
    myEnemy:setDefaultBullet("bullets.Laser", {laserFrame = "Lasers/2"})
    function myEnemy:stage1()
        local counter = 0
        logger:info(TAG, "The boss is in stage1, shoot 1 bullet")
        --setup shoot
        self.preTimer = self:addTimer(2000,
            function()
                self:shoot({
                    x = self.x , degree = self.dir, speed = 100 * gameConfig.scaleFactor,
                    bulletClass = "bullets.Missile",
                    bulletOptions = {},
                    onShoot = function(bullet)
                        bullet:setScaleLinearVelocity(200, -500)
                        bullet:rotateTo(270)
                        move.seek(bullet, self.players[1])
                    end
                })
                self:shoot({
                    x = self.x , degree = self.dir, speed = 100 * gameConfig.scaleFactor,
                    bulletClass = "bullets.Missile",
                    bulletOptions = {},
                    onShoot = function(bullet)
                        bullet:setScaleLinearVelocity(-200, -500)
                        bullet:rotateTo(270)
                        move.seek(bullet, self.players[1])
                    end
                })
            end
        , -1)
    end

    function myEnemy:stage2()
        logger:info(TAG, "The boss is in stage2, shoot 2 bullet")
        self:cancelTimer(self.preTimer)
        self.preTimer = self:addTimer(1000,
            function()
                self:shoot({x = self.x + self.width/4 , degree = self.dir, speed = 100 * gameConfig.scaleFactor})
                self:shoot({x = self.x - self.width/4 , degree = self.dir, speed = 100 * gameConfig.scaleFactor})
            end
        , -1)
    end

    function myEnemy:stage3()
        local counter = 0
        logger:info(TAG, "The boss is in stage3, shoot 3 bullet, and a homing missile")
        self:cancelTimer(self.preTimer)
        self.preTimer = self:addTimer(1000,
            function()
                counter = counter + 1
                self:shoot({x = self.x + self.width/4 , degree = self.dir, speed = 100 * gameConfig.scaleFactor})
                self:shoot({x = self.x , degree = self.dir, speed = 100 * gameConfig.scaleFactor})
                if counter%2 == 1 then
                    self:shoot({
                        x = self.x , degree = self.dir, speed = 100 * gameConfig.scaleFactor,
                        bulletClass = "bullets.Missile",
                        bulletOptions = {},
                        onShoot = function(bullet)
                            bullet:setScaleLinearVelocity(0, 200)
                            bullet:rotateTo(270)
                            move.seek(bullet, self.players[1])
                        end
                    })
                end
                self:shoot({x = self.x - self.width/4 , degree = self.dir, speed = 100 * gameConfig.scaleFactor})
            end
        , -1)
    end

    phaseManager:registerPhase(
        "stage1",
        myEnemy, 
        function()
            return myEnemy.hp <= 666
        end,
        function()
            return "stage2"
        end
    )

    phaseManager:registerPhase(
        "stage2", 
        myEnemy,
        function()
            return myEnemy.hp <= 333
        end,
        function()
            return "stage3"
        end
    )

    phaseManager:registerPhase(
        "stage3", 
        myEnemy,
        function()
            return myEnemy.hp <= 0
        end
    )

    phaseManager:setCurrentPhase("stage1")
    --enemy is hurt
    myEnemy:addEventListener("health", function(event)
        --logger:info(TAG, "HP Event: name:%s, phase:%s, crime:%s, damage:%s, hp:%s", event.name, event.phase, event.crime.name or "", event.damage, event.hp)
        phaseManager:check()

    end)

    function myEnemy:startAction()
        phaseManager:start()
    end

    return myEnemy
end

return MyEnemy