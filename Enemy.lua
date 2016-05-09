local Enemy = {}
local curve = require("curve")
local move = require("move")
local Bullet = require("Bullet")
local Item = require("Item")
local GameObject = require("GameObject")
local Sprite = require("sprite")

Enemy.new = function(options)
    local count = 0 
    local enemy = GameObject.new()
    enemy.sheetInfo = sheetInfo
    enemy.myImageSheet = myImageSheet
    
    enemy.name = "Enemy"
    enemy.type = "Enemy"
    enemy.hp = (options and options.hp) or 50
    enemy.items = (options and options.items)
    enemy.preCollision = function(self, event)
        --print("enemy before hit by "..event.other.name)
        if event.other.name == "bullet" then 
            if event.contact then
                event.contact.isEnabled = false
            else 
                print("WTF")
            end
        end
    end

    enemy.collision = function(self, event)
        count = count + 1
        --print("enemy hit by "..event.other.name..":"..self.hp)
        if event.other.name == "bullet" then
            if self.hp > 0 then
                self:onHurt(event.other.damage) 
            end
            if self.hp <= 0 then
                self:onDead()
                if self.items then
                    --drop items
                    timer.performWithDelay(1, function(event)
                        self:dropItems()
                    end)
                end
            end
        end
    end

    enemy:addEventListener("preCollision", enemy)
    enemy:addEventListener("collision", enemy)

    function enemy:onHurt(damage)
        self.hp = self.hp - event.other.damage
    end

    function enemy:addPhysic()
        physics.addBody(self, "dynamic", {filter = {categoryBits=2, maskBits=5}})
    end

    function enemy:onDead()
        --removeBody cannot be called when the world is locked and in the middle of number crunching, such as during a collision event, so we use remove the body latter
        timer.performWithDelay( 1, 
            function(e) 
                physics.removeBody(self)
            end)
        --move.stop(enemy)
    end

    function enemy:dropItems()
        if self.items then
            for i =0, #self.items do
                local item = Item.new()
                item.x = self.x 
                item.y = self.y
            end
        end
    end

    return enemy
end

return Enemy