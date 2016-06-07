local Enemy = {}
local move = require("move")
local Bullet = require("Bullet")
local Item = require("Item")
local GameObject = require("GameObject")
local Sprite = require("Sprite")

Enemy.new = function(options)
    local enemy = GameObject.new()
    enemy:addTag(enemy)
    enemy.damage = 10
    enemy.name = "enemy"
    enemy.type = "enemy"
    enemy.hp = (options and options.hp) or 50
    enemy.items = (options and options.items) or {}
    enemy.score = 1
    enemy.preCollision = function(self, event)
        --print("enemy before hit by "..event.other.name)
        --if event.other.name == "bullet" then 
            if event.contact then
                event.contact.isEnabled = false
            else 
                print("WTF")
            end
        --end
    end

    enemy.collision = function(self, event)
        --print("enemy hit by "..event.other.name..":"..self.hp..", x:"..event.x..",y:"..event.y)
        if event.other.name == "character" then
            self:hurt(event.other.damage, event.other)
        elseif event.other.name == "bullet" then
            self:hurt(event.other.damage, event.other.owner)
        end
    end

    enemy:addEventListener("preCollision", enemy)
    enemy:addEventListener("collision", enemy)

    function enemy:addItem(class, ...)
        --print("Add item "..class.." to enemy")
        local item = {}
        item.class = class
        item.params = {...}
        self.items[#self.items+1] = item
    end

    function enemy:hurt(damage, crime)
        --print("Hurt enemy: "..damage..":"..self.hp)
        if self.hp > 0 then
            self:onHurt(damage, crime)
            if self.hp <= 0 then
                timer.performWithDelay(1, 
                    function(event)
                        self:onDead(crime)
                        if crime and crime.onKill then
                            crime:onKill(self)
                        end
                        print("Enemy dead, drop items if needed")
                        if self.items then
                            --drop items
                            print("drop items")
                            self:dropItems()
                        end
                    end
                )
            end
        end
    end

    function enemy:onHurt(damage, crime)
        self.hp = self.hp - damage
    end

    function enemy:addPhysic()
        physics.addBody(self, "dynamic", {isSensor = true, friction = 0, mass = 1, filter = {categoryBits=2, maskBits=5}})
    end

    function enemy:removePhysic()
        physics.removeBody(self)
    end

    function enemy:onDead(crime)
        print("Enemy onDead")
        --removeBody cannot be called when the world is locked and in the middle of number crunching, such as during a collision event, so we use remove the body latter
        timer.performWithDelay( 1, 
            function(e) 
                physics.removeBody(self)
            end)
        --move.stop(enemy)
    end

    function enemy:dropItems()
        if self.items then
            for i, v in ipairs(self.items) do
                print("Enemy drops item "..v.class)
                local ItemClass = require(v.class)
                local item = ItemClass.new(unpack(v.params))
                self.parent:insert(item)
                item.x = self.x
                item.y = self.y
                item._iclass = v.class
                item._iparams = v.params
                item:dropped()
            end
        end
    end

    return enemy
end

return Enemy