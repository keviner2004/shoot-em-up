--debug = true
print("load config")

rankServerUrl = "http://163.18.2.162"

gmaeLevles = {
    --"level_bossfight_warning"
    "level_boss_1"
    --"level_1"
    --"level_test"
}

DEBUG_PHYSIC = false

application =
{
    content =
    {
        --width = 900,
        --height = 1440,
        width = display.pixelWidth,
        height = display.pixelHeight,
        scale = "letterbox",
        --scale = "adaptive",
        fps = 60
    }
}