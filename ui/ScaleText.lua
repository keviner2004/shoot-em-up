local gameConfig = require("gameConfig")
local Text = {}

Text.new = function(options)
  if options and options.fontSize then
    options.fontSize = math.floor(options.fontSize * gameConfig.scaleFactor  )
  end
  return display.newText(options)
end

return Text
