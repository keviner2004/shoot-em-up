local Title = {}
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")

Title.new = function(options)
    local title = display.newGroup()
    local iconOptions = options and options.icon
    local textOptions = options and options.text

    local width = 0
    local gap = 15
    if textOptions then
        local textValue = textOptions.value or ""
        local font = textOptions.font or gameConfig.defaultFont
        local fontSize = textOptions.fontSize or 40
        local text = display.newText(textValue, 0, 0, gameConfig.defaultFont, 40)
        width = width + text.contentWidth
        title:insert(text)
        title.text = text
    end
    
    if iconOptions and iconOptions.name and iconOptions.name ~= "" then
        local icon = Sprite.new(iconOptions.name)
        icon.xScale = iconOptions.scale or 1
        icon.yScale = iconOptions.scale or 1
        width = width + icon.contentWidth 
        title:insert(icon)
        title.icon = icon
    end

    local left = - width / 2

    if title.icon then
        title.icon.x = left + title.icon.contentWidth / 2
        left = title.icon.x + title.icon.contentWidth / 2
    end

    if title.text then
        title.text.x = left + title.text.contentWidth / 2 + gap
    end

    return title
end

return Title