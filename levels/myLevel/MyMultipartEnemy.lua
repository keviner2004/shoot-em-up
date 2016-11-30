local util = require("util")
local GameObject = require("GameObject")
local MyEnemy = require("levels.myLevel.MyEnemy")
local Effect = require("effects.pixelEffect1")
local Enemy = {}

Enemy.new = function(parent, options)
    local object = GameObject.new(options)
    local rect = display.newRect(0, 0, 100, 100)
    rect.alpha = 0
    object:insert(rect)
    object:enablePhysics()

    local myEnemy1 = MyEnemy.new()
    local myEnemy2 = MyEnemy.new()
    local myEnemy3 = MyEnemy.new()

    myEnemy1.hp = 100
    myEnemy2.hp = 100
    myEnemy3.hp = 100

    parent:insert(object)
    parent:insert(myEnemy1)
    parent:insert(myEnemy2)
    parent:insert(myEnemy3)

    object.deadCount = 0

    myEnemy1:addEventListener("health", function(evnet)
        if evnet.phase == "dead" then
            object:checkDead()
        end
    end)

    myEnemy2:addEventListener("health", function(evnet)
        if evnet.phase == "dead" then
            object:checkDead()
        end
    end)

    myEnemy3:addEventListener("health", function(evnet)
        if evnet.phase == "dead" then
            object:checkDead()
        end
    end)

    object.enterFrame:each(function()
        if util.isExists(myEnemy1) then
            myEnemy1.x = object.x + myEnemy1.width
            myEnemy1.y = object.y
        end
        if util.isExists(myEnemy2) then
            myEnemy2.x = object.x - myEnemy2.width
            myEnemy2.y = object.y
        end
        if util.isExists(myEnemy3) then
            myEnemy3.x = object.x
            myEnemy3.y = object.y
        end
    end)

    function object:checkDead()
        self.deadCount = self.deadCount + 1
        if self.deadCount == 3 then
            local effect = Effect.new({
                time = 800
            })
            effect.x = self.x
            effect.y = self.y
            effect:start()
            self:clear()
        end
    end


    return object
end

return Enemy