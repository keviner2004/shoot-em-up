print("load config")

--debug setting
DEBUG_PHYSIC = false
DEBUG_FPS = false
DEBUG_SKIP_SPLASH = true
--config setting
CONFIG_SOUND_ON = false
CONFIG_STAGE_SPEED = 200
--game config
PLAYER_LIFES = 3
PLAYER_UNSTOPPABLE = false
CONFIG_FIGHT_BEFORE_ENCOUNTER_BOSS = 10

rankServerUrl = "http://163.18.2.162"

gmaeLevles = {
    --"level_bossfight_warning"
    "level_boss_1",
    "level_1",
    "level_2",
    "level_3",
    "level_4",
    "level_5",
    --"level_test"
    "level_bonus"
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