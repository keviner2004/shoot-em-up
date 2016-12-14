local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyEnemy = require("levels.myLevel.MyErrBoss")
local HpBar = require("ui.HPBar")
local util = require("util")
local myLevel = Sublevel.new("9999999-086", "custom enemy", "author name", {isBossFight = true, bg = "bg"})

function myLevel:show(options)
    self:showWarning({
      bg = "bg2",
      onComplete = function()
        self:initBoss()
      end
    })
end

function myLevel:prepare()
    self.bossInited = false
end

function myLevel:initBoss()
    local enemy = MyEnemy.new({players = self.players})
    --Set the boss to be invisible at the beginning
    enemy.invincible = true
    self.bossInited = true
    --set up hp bar
    local hpBar = HpBar.new({
        w = gameConfig.contentWidth*0.88,
        h = gameConfig.contentWidth*0.1,
        numOfLifes = 10,
        title = "Boss2"
    })
    hpBar.x = gameConfig.contentWidth / 2
    hpBar.y = hpBar.height * 0.6
    hpBar:update(enemy.hp , enemy.maxHp)
    --end of setting up hp bar
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth/2
    enemy.y = -enemy.height/2
    --add Item to the enemy
    enemy:addItem("items.PowerUp", {level = 1})
    --destroy the enemy at the right time
    enemy:autoDestroyWhenInTheScreen()

    local function checkHPBar(event)
        if util.isExists(hpBar) then
            hpBar:update(enemy.hp, enemy.maxHp)
        end
    end
    --update hp bar when enemy is hurt
    enemy:addEventListener("health", checkHPBar)
    --hide the score via the game controller
    self.game:showScore(false)

    enemy:setScaleLinearVelocity(0, 200)
    enemy:addTimer(2000, function()
        enemy:setScaleLinearVelocity(0, 0)
        --When the enemy is ready, the player can hurt it
        enemy.invincible = false
        enemy:startAction()
    end)

    self.hpBar = hpBar
    self.enemy = enemy
    --insert to the scene
    self:insert(hpBar)
    self:insert(enemy)
end

function myLevel:finish()
    self.game:showScore(true)
    if self.hpBar then
        self.hpBar:clear()
    end
    self.bossInited = false
end

function myLevel:isFinish()
    --print("isFinish!??")
    if not self.bossInited or util.isExists(self.enemy) then
        return false
    else
        return true
    end
end

return myLevel
