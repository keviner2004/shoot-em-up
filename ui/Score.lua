local ScaleText = require("ui.ScaleText")

local Score = {}
Score.new = function()
    local score = ScaleText.new({
      text = "0", x = 0, y = 0, font = "kenvector_future_thin", fontSize = 30
    })
    score.value = 0
    function score:gotScoreAnim()
        if self.animing then
            return
        end
        self.animing = true
        transition.to( self, {time = 100, xScale = 1.5, yScale = 1.5, onComplete =
            function()
                transition.to( self, {time = 100, xScale = 1, yScale = 1, onComplete =
                    function()
                        --print("text anim done!!")
                        self.animing = false
                    end})
            end})
    end

    function score:addScore(v)
        self.value = self.value + v
        self.text = self.value
    end

    function score:setScore(v)
        self.value = v
        self.text = self.value
        self:gotScoreAnim()
    end

    function score:getScore()
        return self.value
    end

    return score
end
return Score
