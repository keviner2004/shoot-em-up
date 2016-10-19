local w, h = display.pixelWidth, display.pixelHeight
local w1, h1 = display.actualContentWidth, display.actualContentHeight
local w2, h2 = display.viewableContentWidth, display.viewableContentHeight
application =
{
    content =
    {
        width = w,
        height = h,
        xAlign = "center",
        yAlign = "center",
        scale = 'letterbox',
        --width = display.pixelWidth,
        --height = display.pixelHeight,
        --scale = "letterbox",
        --scale = "adaptive",
        --scale = zoomStretch,
        --scale = zoomEven,
        fps = 60
    }
}