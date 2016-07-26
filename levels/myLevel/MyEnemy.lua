local Enemy = require("Enemy")
local Sprite = require("Sprite")
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
    --setup shoot
    myEnemy:setDefaultBullet("bullets.Laser", {frame = "Lasers/2"})

    myEnemy:addTimer(1000,
        function()
            myEnemy:shoot({x = myEnemy.x + part1.width/2 , degree = myEnemy.dir, speed = 1000})
            myEnemy:shoot({x = myEnemy.x - part1.width/2 , degree = myEnemy.dir, speed = 1000})
        end
    , -1)

    --enable physic
    myEnemy:enablePhysics()
    return myEnemy
end

return MyEnemy