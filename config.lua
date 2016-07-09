local w, h = display.pixelWidth, display.pixelHeight
local w1, h1 = display.actualContentWidth, display.actualContentHeight
local w2, h2 = display.viewableContentWidth, display.viewableContentHeight
print("Detect w h", w,h)
print("Detect w1 h1", w1,h1)
print("Detect w2 h2", w2,h2)
print("display.topStatusBarContentHeight",  display.topStatusBarContentHeight)
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