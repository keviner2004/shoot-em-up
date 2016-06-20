print("load config")

--debug setting
DEBUG_PHYSIC = false
DEBUG_FPS = true
DEBUG_SKIP_SPLASH = true
--config setting
CONFIG_SOUND_ON = false
CONFIG_STAGE_SPEED = 200
--game config
PLAYER_LIFES = 0
PLAYER_UNSTOPPABLE = true

rankServerUrl = "http://163.18.2.162"

gmaeLevles = {
    --"level_bossfight_warning"
    "level_boss_1",
    "level_1"
    --"level_5"
    --"level_test"
    --"level_bonus"
}

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