local GlassPanel = require("ui.GlassPanel")
local Square = require("ui.Square")
local ScaleText = require("ui.ScaleText")
local GameObject = require("GameObject")
local gameConfig = require("gameConfig")
local M = {}

M.new = function(options)
    
    local hpBar = GameObject.new()
    --print("initHPBar: ", hpBar.x, hpBar.y, hpBar.parent)
    hpBar.numOfLifes =  options.numOfLifes or 3
    hpBar.lifes = {}

    local glassPanel = GlassPanel.new(
        options.w or gameConfig.contentWidth*0.88,
        options.h or gameConfig.contentWidth*0.1
    )
    
    local colors = {"green", "yellow", "red"}

    local base = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, "shadow")

    base.x = 0
    base.y = 0
    glassPanel.x = 0
    glassPanel.y = 0
    hpBar.type = "hpBar"
    hpBar.name = "hpBar"

    hpBar:insert(glassPanel)
    hpBar:insert(base)

    local numOfColors = #colors
    for i = 1, hpBar.numOfLifes do
        local hpColorIndex = i%numOfColors
        if hpColorIndex == 0 then
            hpColorIndex = numOfColors
        end
        local hpValue = Square.new(glassPanel.width*0.97, glassPanel.height*0.85, colors[hpColorIndex])
        hpBar:insert(hpValue)
        hpBar.lifes[i] = hpValue
    end

    hpBar.hpText = ScaleText.new({
      text = "0/0",
      x = gameConfig.contentWidth/2,
      y = hpBar.y,
      font = "kenvector_future_thin",
      fontSize = 18
    })
    hpBar.nameText = ScaleText.new({
      text = options.title or "Boss",
      x = gameConfig.contentWidth/2,
      y = hpBar.y,
      font = "kenvector_future_thin",
      fontSize = 18
    })
    hpBar.hpText.x = 0
    hpBar.hpText.y = 0
    hpBar.nameText.x = -glassPanel.contentWidth * 0.4
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
                --print("set "..i.."th life to zero")
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

    return hpBar
end

return M