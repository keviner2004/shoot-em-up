local Button = {}
local TAG = "Button"
local logger = require("logger")

Button.new = function()
  local button = display.newGroup()

  button.click = function(event)
    logger:debug(TAG, "Button was clicked")
  end

  function button:touch(event)
    if event.phase == "began" then
      button:pressEffect()
    elseif event.phase == "ended" then
      button:unPressEffect()
      button:click(event)
    else
    end
    return true
  end

  function button:pressEffect()
    transition.to(self, {
      time = 100,
      xScale = 0.98,
      ySscale = 0.98
    })
  end

  function button:unPressEffect()
    transition.to(self, {
      time = 100,
      xScale = 1,
      ySscale = 1
    })
  end

  button:addEventListener("touch", button)

  return button
end

return Button
