local GameObject = require("GameObject")
local Sprite = require("Sprite")
local move = require("move")
local Victim = {}
local logger = require("logger")
local ScaleText = require("ui.ScaleText")
local TAG = "victim"

Victim.new = function()
    local victim = GameObject.new()
    victim.type = "victim"
    victim.name = "victim"
    victim.helpText = ScaleText.new({
      text = "",
      x = 0, y = 0,
      font = "kenvector_future_thin",
      fontSize = 18
    })
    victim:insert(victim.helpText)
    victim.sprite = Sprite.new({
        "Aliens/Green/hurt"
    })
    victim.helpText.y = - (victim.sprite.height + victim.helpText.height)/2
    victim:addTag("victim")
    victim:insert(victim.sprite)
    victim.sprite.rotation = -10
    --physics
    victim:belongTo(PHYSIC_CATEGORY_VICTIM)
    victim:collideWith(PHYSIC_CATEGORY_CHARACTER)
    print("physic ", victim.maskBits, victim.categoryBits)
    victim:setBody({
        type = "dynamic",
        isSensor = true,
        radius = victim.sprite.height * 1.5
    })

    victim.time = 3000
    victim.remainTime = victim.time
    victim.collision = function(self, event)
        --print("collision at "..event.phase..":"..event.x.."x"..event.y)
        if event.phase == "began" then
            print(self.name.." capture "..event.other.name)
            self:drawIndicator(event.other)
        elseif event.phase == "ended" then
            print(self.name.." is abandoned by "..event.other.name)
            self:removeLine()
            self:clearIndicator()
        end
    end

    function victim:float(d, time)
        transition.to(self, {time = time, y = self.y + d, onComplete =
            function()
                transition.to(self, {time = 2*time, y = self.y-2*d, onComplete =
                    function()
                        self:float(d, time)
                end})
            end
        })
    end
    --print("Y", victim.y)

    function victim:clearIndicator()
        print("clearIndicator")
        self.enterFrame:cancel(self._drawLine)
        self._drawLine = nil
    end

    function victim:removeLine()
        if self._line and self._line.removeSelf then
            --print("clear line")
            self._line:removeSelf()
        end
    end

    function victim:drawIndicator(target)
        print("drawIndicator")
        if self._drawLine then
            return
        end
        local runtime = 0

        local function getDeltaTime()
            local dt = 0
            local temp = system.getTimer()-- Get current game time in ms
            if runtime ~= 0 then
                dt = temp-runtime
            end
            runtime = temp  -- Store game time
            return dt
        end

        self._drawLine = function(event)
            --remove line if needed
            self:removeLine()
            local deltaTime = getDeltaTime()
            if self.paused then
                return
            end
            self.remainTime = self.remainTime - deltaTime
            self:showTime(self.remainTime, 2)
            if self.remainTime <= 0 then
                print("saved")
                self:clearIndicator()
                self:thanks()
                self:removePhysics()
                self.sprite:removeSelf()
                self.sprite = Sprite.new({
                    "Aliens/Green/stand"
                })
                self.sprite.rotation = -15

                function fireEffect(target)
                    transition.to(target, {xScale = 0.8, yScale = 0.8, alpha = 0.8, onComplete =
                        function()
                            transition.to(target, {xScale = 1, yScale = 1, alpha = 1, onComplete =
                                function()
                                    fireEffect(target)
                                end
                            })
                        end
                    })
                end

                transition.to(self.sprite, {rotation = 0, onComplete =
                    function()
                        self.fire = Sprite.new("Effects/Fire/11")
                        self:insert(self.fire)
                        self.fire.y = (self.sprite.height + self.fire.height)/2 * 0.8
                        transition.cancel(self)
                        fireEffect(self.fire)
                        print("Check point")
                        --self:enableAutoDestroy()
                        move.toward(self, {degree = 90})
                    end
                })
                self:insert(self.sprite)
                return
            end

            if self.parent and target.x and target.y and self.x and self.y then
                self._line = display.newLine( self.parent, self.x, self.y, target.x, target.y)
            else
                logger:error(TAG, "Target or victim disapeared")
                print("Debug victim ",self.parent , target.x, target.y, self.x, self.y)
                return
            end
            --self._line:setStrokeColor( 1, 0, 0, 1 )
            self._line.strokeWidth = 3
        end
        self.enterFrame:each(self._drawLine)
    end

    --time:milisecond
    function victim:showTime(time, floats)
        if time < 0 then
            time = 0
        end
        local totalSeconds = time / 1000.0
        self.helpText.text = string.format("%.2f", totalSeconds)
    end

    function victim:yell()
        transition.cancel(self.helpText)
        self.helpText.text = "HELP!!"
        transition.blink(self.helpText, {time = 1500})
    end

    function victim:thanks()
        transition.cancel(self.helpText)
        self.helpText.alpha = 1
        self.helpText.text = "THANKS!!"
        --transition.blink(self.helpText, {time = 1500})
    end

    victim:enablePhysics()

    return victim
end

return Victim
