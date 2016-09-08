--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e3ed8034438cb90a2c306eec8bd76f22:8b0fd9b3704eb1e5cdd5b2b801967d67:3f36a7288e3c206cad1e6347cb5668ac$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- AlienUFOs/Ships/1
            x=1494,
            y=915,
            width=189,
            height=186,

        },
        {
            -- AlienUFOs/Ships/2
            x=282,
            y=2862,
            width=189,
            height=192,

        },
        {
            -- AlienUFOs/Ships/3
            x=1293,
            y=909,
            width=189,
            height=219,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 219
        },
        {
            -- AlienUFOs/Ships/4
            x=1293,
            y=1140,
            width=189,
            height=165,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 164
        },
        {
            -- AlienUFOs/Ships/5
            x=435,
            y=2628,
            width=189,
            height=186,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 185
        },
        {
            -- AlienUFOs/Ships/Damages/1
            x=1794,
            y=825,
            width=189,
            height=102,

        },
        {
            -- AlienUFOs/Ships/Damages/10
            x=1293,
            y=1317,
            width=189,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 101
        },
        {
            -- AlienUFOs/Ships/Damages/2
            x=2265,
            y=993,
            width=189,
            height=108,

        },
        {
            -- AlienUFOs/Ships/Damages/3
            x=621,
            y=2346,
            width=189,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 135
        },
        {
            -- AlienUFOs/Ships/Damages/4
            x=1764,
            y=1206,
            width=189,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 93
        },
        {
            -- AlienUFOs/Ships/Damages/5
            x=1965,
            y=1206,
            width=189,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 101
        },
        {
            -- AlienUFOs/Ships/Damages/6
            x=1710,
            y=1311,
            width=189,
            height=102,

        },
        {
            -- AlienUFOs/Ships/Damages/7
            x=1764,
            y=1086,
            width=189,
            height=108,

        },
        {
            -- AlienUFOs/Ships/Damages/8
            x=1794,
            y=939,
            width=189,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 135
        },
        {
            -- AlienUFOs/Ships/Damages/9
            x=1911,
            y=1320,
            width=189,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 93
        },
        {
            -- AlienUFOs/Ships/Parts/Legs/1
            x=2544,
            y=1461,
            width=114,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 50
        },
        {
            -- AlienUFOs/Ships/Parts/Legs/2
            x=1770,
            y=1866,
            width=108,
            height=69,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/3
            x=2538,
            y=858,
            width=168,
            height=69,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/4
            x=1074,
            y=1731,
            width=150,
            height=69,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/1
            x=2190,
            y=1113,
            width=189,
            height=102,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/2
            x=1965,
            y=1086,
            width=189,
            height=108,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/3
            x=1995,
            y=939,
            width=189,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 135
        },
        {
            -- AlienUFOs/Ships/Parts/Main/4
            x=2190,
            y=1227,
            width=189,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 93
        },
        {
            -- AlienUFOs/Ships/Parts/Main/5
            x=2718,
            y=846,
            width=189,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 101
        },
        {
            -- AlienUFOs/Ships/Parts/dome
            x=822,
            y=1446,
            width=126,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 125,
            sourceHeight = 147
        },
        {
            -- Aliens/Green/hurt
            x=1398,
            y=1431,
            width=105,
            height=141,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 140
        },
        {
            -- Aliens/Green/stand
            x=960,
            y=1455,
            width=99,
            height=138,

        },
        {
            -- Astronauts/1
            x=1983,
            y=2679,
            width=51,
            height=66,

        },
        {
            -- Astronauts/10
            x=2916,
            y=2079,
            width=48,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 66
        },
        {
            -- Astronauts/11
            x=2829,
            y=1605,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/12
            x=2046,
            y=2439,
            width=75,
            height=66,

        },
        {
            -- Astronauts/13
            x=2913,
            y=2001,
            width=51,
            height=66,

        },
        {
            -- Astronauts/14
            x=3231,
            y=2040,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/15 Copy
            x=3426,
            y=1773,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 38
        },
        {
            -- Astronauts/15
            x=2046,
            y=2517,
            width=75,
            height=66,

        },
        {
            -- Astronauts/16
            x=2634,
            y=2400,
            width=48,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 66
        },
        {
            -- Astronauts/17
            x=3381,
            y=2136,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/18
            x=3525,
            y=1134,
            width=75,
            height=66,

        },
        {
            -- Astronauts/2
            x=2799,
            y=2355,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/3
            x=2547,
            y=2400,
            width=75,
            height=66,

        },
        {
            -- Astronauts/4
            x=2667,
            y=2856,
            width=48,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 66
        },
        {
            -- Astronauts/5
            x=3381,
            y=2214,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/6
            x=2742,
            y=1992,
            width=75,
            height=66,

        },
        {
            -- Astronauts/7
            x=2604,
            y=2853,
            width=51,
            height=66,

        },
        {
            -- Astronauts/8
            x=3381,
            y=2292,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Astronauts/9
            x=2976,
            y=2019,
            width=75,
            height=66,

        },
        {
            -- Buildings/1
            x=2898,
            y=1710,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Buildings/10
            x=3531,
            y=1638,
            width=45,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 42
        },
        {
            -- Buildings/11
            x=435,
            y=1341,
            width=156,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 21
        },
        {
            -- Buildings/12
            x=1392,
            y=1584,
            width=135,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 132
        },
        {
            -- Buildings/13 Copy
            x=2982,
            y=1392,
            width=69,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 59
        },
        {
            -- Buildings/13
            x=804,
            y=1851,
            width=102,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 101,
            sourceHeight = 128
        },
        {
            -- Buildings/2
            x=2346,
            y=2682,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Buildings/3
            x=1413,
            y=2094,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 126
        },
        {
            -- Buildings/4
            x=1422,
            y=2232,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 126
        },
        {
            -- Buildings/5
            x=3645,
            y=651,
            width=129,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 126
        },
        {
            -- Buildings/6
            x=1728,
            y=1728,
            width=129,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 126
        },
        {
            -- Buildings/7
            x=2526,
            y=2676,
            width=72,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 69
        },
        {
            -- Buildings/8
            x=3585,
            y=2424,
            width=45,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 42
        },
        {
            -- Buildings/9
            x=2610,
            y=2676,
            width=72,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 69
        },
        {
            -- Effects/Fire/1
            x=3477,
            y=2388,
            width=21,
            height=48,

        },
        {
            -- Effects/Fire/10
            x=3750,
            y=1995,
            width=27,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 60
        },
        {
            -- Effects/Fire/11
            x=2424,
            y=2682,
            width=39,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 62
        },
        {
            -- Effects/Fire/12
            x=2667,
            y=2046,
            width=36,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 80
        },
        {
            -- Effects/Fire/13
            x=2475,
            y=2682,
            width=39,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 63
        },
        {
            -- Effects/Fire/14
            x=3438,
            y=1824,
            width=36,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 80
        },
        {
            -- Effects/Fire/15
            x=3636,
            y=2274,
            width=39,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 66
        },
        {
            -- Effects/Fire/16
            x=3741,
            y=855,
            width=36,
            height=84,

        },
        {
            -- Effects/Fire/2
            x=3477,
            y=2448,
            width=21,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 50
        },
        {
            -- Effects/Fire/3
            x=3477,
            y=2511,
            width=21,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 53
        },
        {
            -- Effects/Fire/4
            x=3477,
            y=2577,
            width=21,
            height=48,

        },
        {
            -- Effects/Fire/5
            x=3348,
            y=2628,
            width=21,
            height=48,

        },
        {
            -- Effects/Fire/6
            x=3348,
            y=2688,
            width=21,
            height=48,

        },
        {
            -- Effects/Fire/7
            x=3231,
            y=2814,
            width=21,
            height=48,

        },
        {
            -- Effects/Fire/8
            x=3750,
            y=2067,
            width=27,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 60
        },
        {
            -- Effects/Fire/9
            x=3750,
            y=2139,
            width=27,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 60
        },
        {
            -- Effects/Shield/1
            x=1065,
            y=831,
            width=216,
            height=207,

        },
        {
            -- Effects/Shield/2
            x=1065,
            y=1050,
            width=216,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 216,
            sourceHeight = 179
        },
        {
            -- Effects/Shield/3
            x=1494,
            y=1113,
            width=201,
            height=162,

        },
        {
            -- Effects/Speed/1
            x=2889,
            y=1212,
            width=12,
            height=168,

        },
        {
            -- Effects/Speed/2
            x=2166,
            y=1086,
            width=12,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 192
        },
        {
            -- Effects/Speed/3
            x=933,
            y=1605,
            width=21,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 192
        },
        {
            -- Effects/Speed/4
            x=2448,
            y=1113,
            width=27,
            height=192,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 192
        },
        {
            -- Effects/Star/1
            x=3159,
            y=2592,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- Effects/Star/2
            x=3159,
            y=2397,
            width=36,
            height=36,

        },
        {
            -- Effects/Star/3
            x=3129,
            y=2640,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- Effects/smoke/1
            x=2604,
            y=2931,
            width=33,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32
        },
        {
            -- Effects/smoke/2
            x=3444,
            y=2853,
            width=39,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 39,
            sourceHeight = 38
        },
        {
            -- Effects/smoke/3
            x=2247,
            y=3009,
            width=54,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 54
        },
        {
            -- Effects/smoke/4
            x=2778,
            y=2433,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 38
        },
        {
            -- Effects/smoke/5
            x=3321,
            y=2361,
            width=48,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 50
        },
        {
            -- Effects/smoke/6
            x=3222,
            y=1092,
            width=66,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 77
        },
        {
            -- Effects/smoke/7
            x=3585,
            y=2478,
            width=45,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 44
        },
        {
            -- Effects/smoke/8
            x=1026,
            y=2898,
            width=57,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 56
        },
        {
            -- Effects/smoke/9
            x=2046,
            y=2595,
            width=75,
            height=78,

        },
        {
            -- Items/1
            x=1695,
            y=2454,
            width=81,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 81,
            sourceHeight = 80
        },
        {
            -- Items/10
            x=3171,
            y=1941,
            width=48,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 80
        },
        {
            -- Items/100
            x=3171,
            y=1086,
            width=39,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 39,
            sourceHeight = 80
        },
        {
            -- Items/101
            x=2976,
            y=2097,
            width=75,
            height=48,

        },
        {
            -- Items/102
            x=3048,
            y=1176,
            width=72,
            height=45,

        },
        {
            -- Items/103
            x=3507,
            y=1692,
            width=48,
            height=69,

        },
        {
            -- Items/104
            x=2868,
            y=2349,
            width=48,
            height=75,

        },
        {
            -- Items/105
            x=2019,
            y=2151,
            width=102,
            height=93,

        },
        {
            -- Items/106
            x=966,
            y=1764,
            width=96,
            height=66,

        },
        {
            -- Items/107
            x=2070,
            y=3006,
            width=84,
            height=57,

        },
        {
            -- Items/108
            x=2133,
            y=2019,
            width=102,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 98
        },
        {
            -- Items/109
            x=867,
            y=2493,
            width=108,
            height=102,

        },
        {
            -- Items/11
            x=1764,
            y=2976,
            width=90,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 86
        },
        {
            -- Items/110
            x=3510,
            y=2199,
            width=48,
            height=69,

        },
        {
            -- Items/111
            x=2916,
            y=2790,
            width=21,
            height=33,

        },
        {
            -- Items/112
            x=3504,
            y=2118,
            width=54,
            height=69,

        },
        {
            -- Items/113
            x=3603,
            y=2841,
            width=39,
            height=39,

        },
        {
            -- Items/114
            x=3207,
            y=2385,
            width=24,
            height=33,

        },
        {
            -- Items/115
            x=3159,
            y=2967,
            width=30,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 32
        },
        {
            -- Items/116
            x=3654,
            y=2874,
            width=39,
            height=30,

        },
        {
            -- Items/117
            x=3126,
            y=2925,
            width=36,
            height=30,

        },
        {
            -- Items/118
            x=2262,
            y=2343,
            width=99,
            height=30,

        },
        {
            -- Items/119
            x=2442,
            y=2088,
            width=114,
            height=30,

        },
        {
            -- Items/12
            x=2298,
            y=1458,
            width=69,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 104
        },
        {
            -- Items/120
            x=2919,
            y=846,
            width=72,
            height=102,

        },
        {
            -- Items/121
            x=2256,
            y=1908,
            width=75,
            height=99,

        },
        {
            -- Items/122
            x=2313,
            y=1728,
            width=87,
            height=102,

        },
        {
            -- Items/123
            x=3300,
            y=1077,
            width=75,
            height=93,

        },
        {
            -- Items/124
            x=2112,
            y=1320,
            width=66,
            height=93,

        },
        {
            -- Items/125
            x=1383,
            y=2967,
            width=69,
            height=96,

        },
        {
            -- Items/126
            x=2718,
            y=1785,
            width=96,
            height=87,

        },
        {
            -- Items/127
            x=3612,
            y=1125,
            width=87,
            height=84,

        },
        {
            -- Items/128
            x=3525,
            y=1440,
            width=72,
            height=75,

        },
        {
            -- Items/129
            x=2991,
            y=2157,
            width=63,
            height=75,

        },
        {
            -- Items/13
            x=2715,
            y=1572,
            width=102,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 101,
            sourceHeight = 83
        },
        {
            -- Items/130
            x=3687,
            y=2223,
            width=51,
            height=63,

        },
        {
            -- Items/131
            x=3324,
            y=2283,
            width=45,
            height=66,

        },
        {
            -- Items/132
            x=2670,
            y=1635,
            width=33,
            height=72,

        },
        {
            -- Items/133
            x=2352,
            y=2481,
            width=45,
            height=84,

        },
        {
            -- Items/134
            x=3645,
            y=564,
            width=132,
            height=75,

        },
        {
            -- Items/135
            x=1650,
            y=2541,
            width=33,
            height=57,

        },
        {
            -- Items/136
            x=3159,
            y=2445,
            width=39,
            height=57,

        },
        {
            -- Items/137
            x=3642,
            y=2430,
            width=33,
            height=57,

        },
        {
            -- Items/138
            x=3150,
            y=2034,
            width=69,
            height=60,

        },
        {
            -- Items/139
            x=2286,
            y=2130,
            width=72,
            height=54,

        },
        {
            -- Items/14
            x=2379,
            y=1458,
            width=69,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 105
        },
        {
            -- Items/140
            x=2046,
            y=2685,
            width=84,
            height=60,

        },
        {
            -- Items/141
            x=2133,
            y=2196,
            width=117,
            height=66,

        },
        {
            -- Items/142
            x=1881,
            y=2652,
            width=90,
            height=84,

        },
        {
            -- Items/143
            x=2370,
            y=1332,
            width=75,
            height=114,

        },
        {
            -- Items/144
            x=972,
            y=2406,
            width=123,
            height=72,

        },
        {
            -- Items/145
            x=3384,
            y=1944,
            width=54,
            height=90,

        },
        {
            -- Items/146
            x=2910,
            y=1122,
            width=81,
            height=78,

        },
        {
            -- Items/147
            x=3381,
            y=2046,
            width=57,
            height=78,

        },
        {
            -- Items/148
            x=1131,
            y=2967,
            width=72,
            height=96,

        },
        {
            -- Items/149
            x=2412,
            y=1722,
            width=72,
            height=108,

        },
        {
            -- Items/15
            x=3387,
            y=1077,
            width=57,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 98
        },
        {
            -- Items/150
            x=3231,
            y=1941,
            width=57,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 86
        },
        {
            -- Items/151
            x=3330,
            y=2496,
            width=39,
            height=51,

        },
        {
            -- Items/152
            x=2832,
            y=2589,
            width=36,
            height=48,

        },
        {
            -- Items/153
            x=2313,
            y=1575,
            width=78,
            height=141,

        },
        {
            -- Items/154
            x=3456,
            y=1080,
            width=57,
            height=99,

        },
        {
            -- Items/155
            x=2676,
            y=2484,
            width=54,
            height=78,

        },
        {
            -- Items/156
            x=1983,
            y=2469,
            width=51,
            height=78,

        },
        {
            -- Items/157
            x=2694,
            y=2673,
            width=45,
            height=72,

        },
        {
            -- Items/158
            x=2313,
            y=3000,
            width=72,
            height=63,

        },
        {
            -- Items/159
            x=2928,
            y=2241,
            width=51,
            height=81,

        },
        {
            -- Items/16
            x=3063,
            y=2028,
            width=75,
            height=66,

        },
        {
            -- Items/160
            x=3570,
            y=2274,
            width=54,
            height=66,

        },
        {
            -- Items/161
            x=2724,
            y=2346,
            width=63,
            height=57,

        },
        {
            -- Items/162
            x=2544,
            y=1359,
            width=114,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 89
        },
        {
            -- Items/163
            x=3633,
            y=2763,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 303,
            sourceHeight = 302
        },
        {
            -- Items/17
            x=3300,
            y=2046,
            width=69,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 69,
            sourceHeight = 68
        },
        {
            -- Items/18
            x=2958,
            y=732,
            width=54,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 102
        },
        {
            -- Items/19
            x=3702,
            y=1449,
            width=75,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 77
        },
        {
            -- Items/2
            x=996,
            y=2607,
            width=93,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 93,
            sourceHeight = 116
        },
        {
            -- Items/20
            x=3342,
            y=2799,
            width=27,
            height=27,

        },
        {
            -- Items/21
            x=3471,
            y=2637,
            width=27,
            height=27,

        },
        {
            -- Items/22
            x=636,
            y=2787,
            width=18,
            height=18,

        },
        {
            -- Items/23
            x=2694,
            y=2415,
            width=72,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 56
        },
        {
            -- Items/24
            x=3510,
            y=2361,
            width=48,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 50
        },
        {
            -- Items/25
            x=3003,
            y=846,
            width=57,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 101
        },
        {
            -- Items/26
            x=3066,
            y=2154,
            width=66,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 77
        },
        {
            -- Items/27
            x=2889,
            y=1392,
            width=81,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 60
        },
        {
            -- Items/28
            x=2574,
            y=1959,
            width=78,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 81
        },
        {
            -- Items/29
            x=2751,
            y=2673,
            width=60,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 75
        },
        {
            -- Items/3
            x=1380,
            y=1947,
            width=78,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 134
        },
        {
            -- Items/30
            x=1491,
            y=2769,
            width=78,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 102
        },
        {
            -- Items/31
            x=2247,
            y=2019,
            width=99,
            height=99,

        },
        {
            -- Items/32
            x=3609,
            y=1449,
            width=81,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 69
        },
        {
            -- Items/33
            x=1788,
            y=2445,
            width=81,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 90
        },
        {
            -- Items/34
            x=2667,
            y=2757,
            width=45,
            height=87,

        },
        {
            -- Items/35
            x=3069,
            y=2244,
            width=63,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 74
        },
        {
            -- Items/36
            x=2823,
            y=1683,
            width=63,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 90
        },
        {
            -- Items/37
            x=3063,
            y=2331,
            width=57,
            height=81,

        },
        {
            -- Items/38
            x=2979,
            y=1233,
            width=75,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 98
        },
        {
            -- Items/39
            x=966,
            y=1605,
            width=96,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 95,
            sourceHeight = 147
        },
        {
            -- Items/4
            x=2496,
            y=1716,
            width=66,
            height=123,

        },
        {
            -- Items/40
            x=3486,
            y=1821,
            width=51,
            height=81,

        },
        {
            -- Items/41
            x=3381,
            y=2370,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Items/42
            x=3585,
            y=2535,
            width=45,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 50
        },
        {
            -- Items/43
            x=3552,
            y=1773,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 66
        },
        {
            -- Items/44
            x=3072,
            y=837,
            width=111,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 113
        },
        {
            -- Items/45
            x=1179,
            y=2883,
            width=69,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 69,
            sourceHeight = 71
        },
        {
            -- Items/46
            x=1035,
            y=2967,
            width=84,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 83,
            sourceHeight = 95
        },
        {
            -- Items/47
            x=2568,
            y=2052,
            width=87,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 87,
            sourceHeight = 74
        },
        {
            -- Items/48
            x=3399,
            y=1428,
            width=45,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 98
        },
        {
            -- Items/49
            x=2784,
            y=2484,
            width=39,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 69
        },
        {
            -- Items/5
            x=3162,
            y=963,
            width=48,
            height=111,

        },
        {
            -- Items/50
            x=3189,
            y=2757,
            width=45,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 44
        },
        {
            -- Items/51
            x=2868,
            y=2436,
            width=39,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 69
        },
        {
            -- Items/52
            x=3075,
            y=1941,
            width=84,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 83,
            sourceHeight = 74
        },
        {
            -- Items/53
            x=3261,
            y=849,
            width=117,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 117,
            sourceHeight = 89
        },
        {
            -- Items/54
            x=3066,
            y=1233,
            width=69,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 104
        },
        {
            -- Items/55
            x=1422,
            y=2370,
            width=102,
            height=90,

        },
        {
            -- Items/56
            x=1863,
            y=2877,
            width=90,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 83
        },
        {
            -- Items/57
            x=1695,
            y=915,
            width=87,
            height=153,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 153
        },
        {
            -- Items/58
            x=1710,
            y=1281,
            width=42,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 11
        },
        {
            -- Items/59
            x=2013,
            y=2256,
            width=108,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 107,
            sourceHeight = 53
        },
        {
            -- Items/6
            x=3159,
            y=2310,
            width=36,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 74
        },
        {
            -- Items/60
            x=3510,
            y=2280,
            width=48,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 68
        },
        {
            -- Items/61
            x=3411,
            y=750,
            width=123,
            height=99,

        },
        {
            -- Items/62
            x=3300,
            y=1944,
            width=72,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 89
        },
        {
            -- Items/63
            x=3729,
            y=1692,
            width=48,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 72
        },
        {
            -- Items/64
            x=3585,
            y=2598,
            width=45,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 60
        },
        {
            -- Items/65
            x=3525,
            y=1989,
            width=63,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 62
        },
        {
            -- Items/66
            x=3600,
            y=1989,
            width=63,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 62
        },
        {
            -- Items/67
            x=3390,
            y=861,
            width=123,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 71
        },
        {
            -- Items/68
            x=3243,
            y=2280,
            width=69,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 57
        },
        {
            -- Items/69
            x=2949,
            y=2790,
            width=42,
            height=30,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 29
        },
        {
            -- Items/7
            x=3639,
            y=2184,
            width=36,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 74
        },
        {
            -- Items/70
            x=3210,
            y=2565,
            width=54,
            height=51,

        },
        {
            -- Items/71
            x=3381,
            y=2586,
            width=54,
            height=51,

        },
        {
            -- Items/72
            x=2913,
            y=1344,
            width=87,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 36
        },
        {
            -- Items/73
            x=1788,
            y=2547,
            width=72,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 50
        },
        {
            -- Items/74
            x=2358,
            y=2001,
            width=72,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 116
        },
        {
            -- Items/75
            x=2457,
            y=1317,
            width=75,
            height=120,

        },
        {
            -- Items/76
            x=621,
            y=1341,
            width=18,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 81
        },
        {
            -- Items/77
            x=3753,
            y=1050,
            width=24,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 23,
            sourceHeight = 80
        },
        {
            -- Items/78
            x=2835,
            y=2433,
            width=21,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 74
        },
        {
            -- Items/79
            x=3078,
            y=1593,
            width=39,
            height=108,

        },
        {
            -- Items/8
            x=2142,
            y=2673,
            width=84,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 83,
            sourceHeight = 68
        },
        {
            -- Items/80
            x=2238,
            y=2682,
            width=96,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 95,
            sourceHeight = 62
        },
        {
            -- Items/81
            x=1866,
            y=2973,
            width=87,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 89
        },
        {
            -- Items/82
            x=2907,
            y=2973,
            width=54,
            height=54,

        },
        {
            -- Items/83
            x=3555,
            y=1527,
            width=42,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 65
        },
        {
            -- Items/84
            x=2373,
            y=2343,
            width=30,
            height=30,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 29
        },
        {
            -- Items/85
            x=3174,
            y=2925,
            width=30,
            height=30,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 29
        },
        {
            -- Items/86
            x=3384,
            y=2943,
            width=30,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 32
        },
        {
            -- Items/87
            x=3246,
            y=2976,
            width=30,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 32
        },
        {
            -- Items/88
            x=2832,
            y=1884,
            width=69,
            height=99,

        },
        {
            -- Items/89
            x=3711,
            y=1143,
            width=66,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 102
        },
        {
            -- Items/9
            x=2340,
            y=2757,
            width=45,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 92
        },
        {
            -- Items/90
            x=3048,
            y=1086,
            width=111,
            height=78,

        },
        {
            -- Items/91
            x=2397,
            y=2994,
            width=90,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 69
        },
        {
            -- Items/92
            x=2358,
            y=2385,
            width=45,
            height=84,

        },
        {
            -- Items/93
            x=3750,
            y=1611,
            width=27,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 69
        },
        {
            -- Items/94
            x=1428,
            y=2883,
            width=54,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 71
        },
        {
            -- Items/95
            x=2409,
            y=2481,
            width=42,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 84
        },
        {
            -- Items/96
            x=1785,
            y=2328,
            width=84,
            height=105,

        },
        {
            -- Items/97
            x=2637,
            y=2478,
            width=27,
            height=84,

        },
        {
            -- Items/98
            x=1881,
            y=2550,
            width=90,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 89
        },
        {
            -- Items/99
            x=3570,
            y=2118,
            width=57,
            height=66,

        },
        {
            -- Lasers/1
            x=3210,
            y=2205,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/10
            x=2715,
            y=2046,
            width=15,
            height=81,

        },
        {
            -- Lasers/11
            x=2835,
            y=2520,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/12
            x=3450,
            y=2406,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/13
            x=1095,
            y=2883,
            width=72,
            height=72,

        },
        {
            -- Lasers/14
            x=1260,
            y=2883,
            width=72,
            height=72,

        },
        {
            -- Lasers/15
            x=2994,
            y=2427,
            width=57,
            height=57,

        },
        {
            -- Lasers/16
            x=3063,
            y=2424,
            width=57,
            height=57,

        },
        {
            -- Lasers/17
            x=3414,
            y=1584,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/18
            x=3447,
            y=1539,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/19
            x=2889,
            y=2835,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/2
            x=2577,
            y=2862,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/20
            x=3132,
            y=2430,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/21
            x=2805,
            y=2760,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/22
            x=3132,
            y=2331,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/23
            x=2892,
            y=2904,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/24
            x=3450,
            y=2475,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/25
            x=3450,
            y=2016,
            width=21,
            height=81,

        },
        {
            -- Lasers/26
            x=3477,
            y=2109,
            width=15,
            height=81,

        },
        {
            -- Lasers/27
            x=2922,
            y=2835,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/28
            x=3450,
            y=2544,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/29
            x=1344,
            y=2883,
            width=72,
            height=72,

        },
        {
            -- Lasers/3
            x=2925,
            y=2904,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/30
            x=1494,
            y=2883,
            width=72,
            height=72,

        },
        {
            -- Lasers/31
            x=3381,
            y=2448,
            width=57,
            height=57,

        },
        {
            -- Lasers/32
            x=3381,
            y=2517,
            width=57,
            height=57,

        },
        {
            -- Lasers/33
            x=2805,
            y=2859,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/34
            x=3450,
            y=2109,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/35
            x=3348,
            y=2559,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/36
            x=3132,
            y=2499,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/37
            x=2805,
            y=2958,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/38
            x=3450,
            y=2208,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/39
            x=3198,
            y=2688,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/4
            x=3132,
            y=2568,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/40
            x=3021,
            y=2877,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/41
            x=3477,
            y=2202,
            width=21,
            height=81,

        },
        {
            -- Lasers/42
            x=3483,
            y=1917,
            width=15,
            height=81,

        },
        {
            -- Lasers/43
            x=3309,
            y=2745,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/44
            x=3444,
            y=2649,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/45
            x=2829,
            y=1995,
            width=72,
            height=72,

        },
        {
            -- Lasers/46
            x=2907,
            y=2157,
            width=72,
            height=72,

        },
        {
            -- Lasers/47
            x=3063,
            y=2493,
            width=57,
            height=57,

        },
        {
            -- Lasers/48
            x=2949,
            y=2655,
            width=57,
            height=57,

        },
        {
            -- Lasers/5
            x=3450,
            y=1917,
            width=21,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 86
        },
        {
            -- Lasers/6
            x=3450,
            y=2307,
            width=15,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 86
        },
        {
            -- Lasers/7
            x=3018,
            y=2808,
            width=21,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 56
        },
        {
            -- Lasers/8
            x=3444,
            y=2718,
            width=15,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 56
        },
        {
            -- Lasers/9
            x=3477,
            y=2295,
            width=21,
            height=81,

        },
        {
            -- Lasers/Beam/1
            x=1224,
            y=1242,
            width=57,
            height=150,

        },
        {
            -- Lasers/Beam/2
            x=2196,
            y=939,
            width=57,
            height=150,

        },
        {
            -- Lasers/Beam/3
            x=1026,
            y=2736,
            width=57,
            height=150,

        },
        {
            -- Lasers/Beam/4
            x=2910,
            y=960,
            width=57,
            height=150,

        },
        {
            -- Lasers/Beam/5
            x=2979,
            y=960,
            width=57,
            height=150,

        },
        {
            -- Lasers/Burst/1
            x=1521,
            y=423,
            width=282,
            height=285,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 282,
            sourceHeight = 284
        },
        {
            -- Lasers/Burst/2
            x=1815,
            y=423,
            width=282,
            height=285,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 282,
            sourceHeight = 284
        },
        {
            -- Lasers/Burst/3
            x=2109,
            y=423,
            width=282,
            height=285,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 282,
            sourceHeight = 284
        },
        {
            -- Lasers/Burst/4 Copy
            x=3615,
            y=129,
            width=147,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 146,
            sourceHeight = 146
        },
        {
            -- Lasers/Burst/4
            x=2403,
            y=423,
            width=282,
            height=285,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 282,
            sourceHeight = 284
        },
        {
            -- Lasers/Burst/5
            x=2697,
            y=363,
            width=282,
            height=285,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 282,
            sourceHeight = 284
        },
        {
            -- Lasers/GroundBurst/1
            x=651,
            y=1188,
            width=258,
            height=117,

        },
        {
            -- Lasers/GroundBurst/2
            x=2004,
            y=720,
            width=258,
            height=117,

        },
        {
            -- Lasers/GroundBurst/3
            x=2274,
            y=720,
            width=258,
            height=117,

        },
        {
            -- Lasers/GroundBurst/4
            x=2991,
            y=588,
            width=258,
            height=117,

        },
        {
            -- Lasers/GroundBurst/5
            x=651,
            y=1317,
            width=258,
            height=117,

        },
        {
            -- Lasers/Rings/1
            x=483,
            y=3009,
            width=141,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 140,
            sourceHeight = 54
        },
        {
            -- Lasers/Rings/2
            x=1536,
            y=2334,
            width=141,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 140,
            sourceHeight = 54
        },
        {
            -- Lasers/Rings/3
            x=2037,
            y=1842,
            width=141,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 140,
            sourceHeight = 54
        },
        {
            -- Lasers/Rings/4
            x=2190,
            y=1842,
            width=141,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 140,
            sourceHeight = 54
        },
        {
            -- Lasers/Rings/5
            x=2133,
            y=2130,
            width=141,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 140,
            sourceHeight = 54
        },
        {
            -- Logo
            x=9,
            y=9,
            width=1011,
            height=339,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1011,
            sourceHeight = 338
        },
        {
            -- Meteors/Big/1
            x=2544,
            y=1221,
            width=153,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 125
        },
        {
            -- Meteors/Big/2
            x=3261,
            y=591,
            width=180,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 180,
            sourceHeight = 146
        },
        {
            -- Meteors/Big/3
            x=1275,
            y=2232,
            width=135,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 123
        },
        {
            -- Meteors/Big/4
            x=2544,
            y=1065,
            width=147,
            height=144,

        },
        {
            -- Meteors/Big/5
            x=1989,
            y=1575,
            width=153,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 125
        },
        {
            -- Meteors/Big/6
            x=3453,
            y=591,
            width=180,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 180,
            sourceHeight = 146
        },
        {
            -- Meteors/Big/7
            x=1530,
            y=1947,
            width=135,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 123
        },
        {
            -- Meteors/Big/8
            x=1071,
            y=1422,
            width=147,
            height=144,

        },
        {
            -- Meteors/Huge/1
            x=1032,
            y=9,
            width=330,
            height=333,

        },
        {
            -- Meteors/Huge/2
            x=3279,
            y=9,
            width=324,
            height=318,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 324,
            sourceHeight = 317
        },
        {
            -- Meteors/Huge/3
            x=2949,
            y=9,
            width=318,
            height=327,

        },
        {
            -- Meteors/Huge/4
            x=2616,
            y=9,
            width=321,
            height=342,

        },
        {
            -- Meteors/Med/1
            x=3300,
            y=2127,
            width=69,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 60
        },
        {
            -- Meteors/Med/2
            x=3549,
            y=1851,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Meteors/Med/3
            x=3627,
            y=1851,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Meteors/Med/4
            x=3690,
            y=1539,
            width=69,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 60
        },
        {
            -- Meteors/Small/1
            x=2973,
            y=3021,
            width=42,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 41
        },
        {
            -- Meteors/Small/2
            x=3546,
            y=2841,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 39
        },
        {
            -- Meteors/Small/3
            x=3027,
            y=3021,
            width=42,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 41
        },
        {
            -- Meteors/Small/4
            x=3687,
            y=2769,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 39
        },
        {
            -- Meteors/Tiny/1
            x=3036,
            y=2946,
            width=27,
            height=27,

        },
        {
            -- Meteors/Tiny/2
            x=435,
            y=2826,
            width=24,
            height=24,

        },
        {
            -- Meteors/Tiny/3
            x=3120,
            y=2973,
            width=27,
            height=27,

        },
        {
            -- Meteors/Tiny/4
            x=876,
            y=1815,
            width=24,
            height=24,

        },
        {
            -- Missiles/1
            x=2343,
            y=2577,
            width=30,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 93
        },
        {
            -- Missiles/10
            x=1491,
            y=2094,
            width=33,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 125
        },
        {
            -- Missiles/11
            x=2397,
            y=2757,
            width=30,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 92
        },
        {
            -- Missiles/12
            x=2385,
            y=2577,
            width=54,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 92
        },
        {
            -- Missiles/13
            x=1470,
            y=1947,
            width=48,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 135
        },
        {
            -- Missiles/14
            x=2466,
            y=993,
            width=51,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 107
        },
        {
            -- Missiles/15
            x=2670,
            y=1494,
            width=33,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 128
        },
        {
            -- Missiles/16
            x=3327,
            y=2424,
            width=42,
            height=60,

        },
        {
            -- Missiles/17
            x=3642,
            y=2352,
            width=33,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 65
        },
        {
            -- Missiles/18
            x=2439,
            y=2757,
            width=54,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 92
        },
        {
            -- Missiles/19
            x=3222,
            y=957,
            width=57,
            height=123,

        },
        {
            -- Missiles/2
            x=2451,
            y=2577,
            width=54,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 92
        },
        {
            -- Missiles/20
            x=1605,
            y=2472,
            width=33,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 125
        },
        {
            -- Missiles/21
            x=2697,
            y=2139,
            width=30,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 92
        },
        {
            -- Missiles/22
            x=2862,
            y=2244,
            width=54,
            height=93,

        },
        {
            -- Missiles/23
            x=2262,
            y=2196,
            width=48,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 135
        },
        {
            -- Missiles/24
            x=1983,
            y=2559,
            width=51,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 107
        },
        {
            -- Missiles/25
            x=1650,
            y=2400,
            width=33,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 128
        },
        {
            -- Missiles/26
            x=2952,
            y=2583,
            width=42,
            height=60,

        },
        {
            -- Missiles/27
            x=3642,
            y=2499,
            width=33,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 65
        },
        {
            -- Missiles/28
            x=3144,
            y=2205,
            width=54,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 92
        },
        {
            -- Missiles/29
            x=1263,
            y=2622,
            width=57,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 122
        },
        {
            -- Missiles/3
            x=2322,
            y=2196,
            width=48,
            height=135,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 134
        },
        {
            -- Missiles/30
            x=1497,
            y=2631,
            width=33,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 125
        },
        {
            -- Missiles/31
            x=3753,
            y=951,
            width=24,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 23,
            sourceHeight = 86
        },
        {
            -- Missiles/32
            x=2685,
            y=2574,
            width=48,
            height=87,

        },
        {
            -- Missiles/33
            x=2664,
            y=1719,
            width=42,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 129
        },
        {
            -- Missiles/34
            x=3156,
            y=1713,
            width=48,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 101
        },
        {
            -- Missiles/35
            x=2670,
            y=1359,
            width=27,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 27,
            sourceHeight = 122
        },
        {
            -- Missiles/36
            x=2868,
            y=2517,
            width=39,
            height=54,

        },
        {
            -- Missiles/37
            x=3750,
            y=2211,
            width=27,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 27,
            sourceHeight = 59
        },
        {
            -- Missiles/38
            x=2745,
            y=2574,
            width=48,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 86
        },
        {
            -- Missiles/39
            x=1605,
            y=2610,
            width=51,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 116
        },
        {
            -- Missiles/4
            x=2913,
            y=1884,
            width=51,
            height=105,

        },
        {
            -- Missiles/40
            x=2388,
            y=2862,
            width=27,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 119
        },
        {
            -- Missiles/5
            x=1659,
            y=2739,
            width=33,
            height=126,

        },
        {
            -- Missiles/6
            x=2838,
            y=2910,
            width=42,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 59
        },
        {
            -- Missiles/7
            x=3210,
            y=2430,
            width=33,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 65
        },
        {
            -- Missiles/8
            x=2928,
            y=2334,
            width=54,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 92
        },
        {
            -- Missiles/9
            x=3456,
            y=945,
            width=57,
            height=123,

        },
        {
            -- Particles/1
            x=621,
            y=1986,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/10
            x=1236,
            y=1569,
            width=144,
            height=138,

        },
        {
            -- Particles/11
            x=1539,
            y=1578,
            width=138,
            height=138,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 137,
            sourceHeight = 138
        },
        {
            -- Particles/12
            x=1707,
            y=1080,
            width=45,
            height=189,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 188
        },
        {
            -- Particles/13
            x=483,
            y=2826,
            width=171,
            height=171,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 171
        },
        {
            -- Particles/14
            x=621,
            y=2166,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/15
            x=636,
            y=2607,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/16
            x=1044,
            y=1242,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Particles/17
            x=1515,
            y=1428,
            width=144,
            height=138,

        },
        {
            -- Particles/18
            x=801,
            y=1992,
            width=138,
            height=138,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 137,
            sourceHeight = 138
        },
        {
            -- Particles/19
            x=2391,
            y=1113,
            width=45,
            height=189,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 188
        },
        {
            -- Particles/2
            x=666,
            y=2787,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Particles/20
            x=621,
            y=1620,
            width=171,
            height=171,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 171
        },
        {
            -- Particles/21
            x=3261,
            y=411,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/3
            x=801,
            y=2142,
            width=144,
            height=138,

        },
        {
            -- Particles/4
            x=822,
            y=2292,
            width=138,
            height=138,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 137,
            sourceHeight = 138
        },
        {
            -- Particles/5
            x=2487,
            y=1113,
            width=45,
            height=189,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 188
        },
        {
            -- Particles/6
            x=621,
            y=1803,
            width=171,
            height=171,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 171
        },
        {
            -- Particles/7
            x=3441,
            y=411,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/8
            x=816,
            y=2607,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 168
        },
        {
            -- Particles/9
            x=846,
            y=2787,
            width=168,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Planet/1
            x=9,
            y=1386,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/2
            x=9,
            y=1800,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/3
            x=9,
            y=2214,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 402,
            sourceHeight = 401
        },
        {
            -- Planet/4
            x=9,
            y=360,
            width=648,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 647,
            sourceHeight = 401
        },
        {
            -- Planet/5
            x=669,
            y=360,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/6
            x=651,
            y=774,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 402,
            sourceHeight = 401
        },
        {
            -- Planet/7
            x=1374,
            y=9,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 402
        },
        {
            -- Planet/8
            x=1788,
            y=9,
            width=402,
            height=402,

        },
        {
            -- Planet/9
            x=2202,
            y=9,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 402
        },
        {
            -- Power-ups/Bolt/1
            x=3687,
            y=2298,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Bolt/2
            x=3687,
            y=2439,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Bolt/3
            x=3687,
            y=2580,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Bolt/4
            x=3687,
            y=2643,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Bolt/5
            x=3264,
            y=2811,
            width=30,
            height=45,

        },
        {
            -- Power-ups/Bolt/6
            x=3402,
            y=2838,
            width=30,
            height=45,

        },
        {
            -- Power-ups/Bolt/7
            x=3471,
            y=2676,
            width=30,
            height=45,

        },
        {
            -- Power-ups/None/1
            x=3687,
            y=2706,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/None/2
            x=2955,
            y=2832,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/None/3
            x=2958,
            y=2895,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/None/4
            x=2973,
            y=2958,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Pills/1
            x=2871,
            y=2790,
            width=33,
            height=33,

        },
        {
            -- Power-ups/Pills/2
            x=3018,
            y=2718,
            width=33,
            height=33,

        },
        {
            -- Power-ups/Pills/3
            x=3018,
            y=2763,
            width=33,
            height=33,

        },
        {
            -- Power-ups/Pills/4
            x=3744,
            y=2781,
            width=33,
            height=33,

        },
        {
            -- Power-ups/Shield/2
            x=3381,
            y=2649,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Shield/3
            x=3135,
            y=2688,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Shield/4
            x=3231,
            y=2685,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Shield/5
            x=3342,
            y=2838,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Shield/6
            x=3477,
            y=2787,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Shield/7
            x=3513,
            y=2658,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Shiled/1
            x=3381,
            y=2712,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Star/1
            x=3063,
            y=2751,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Star/2
            x=3126,
            y=2751,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Star/3
            x=3246,
            y=2748,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Star/4
            x=3381,
            y=2775,
            width=51,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- Power-ups/Star/5
            x=3573,
            y=2670,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Star/6
            x=3573,
            y=2727,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Star/7
            x=3537,
            y=2784,
            width=48,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 45
        },
        {
            -- Power-ups/Things/1
            x=3051,
            y=2814,
            width=48,
            height=48,

        },
        {
            -- Power-ups/Things/2
            x=3111,
            y=2814,
            width=48,
            height=48,

        },
        {
            -- Power-ups/Things/3
            x=3171,
            y=2814,
            width=48,
            height=48,

        },
        {
            -- Rockets/Parts/1
            x=2037,
            y=1713,
            width=102,
            height=117,

        },
        {
            -- Rockets/Parts/10
            x=1647,
            y=1866,
            width=111,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 68
        },
        {
            -- Rockets/Parts/11
            x=1677,
            y=1947,
            width=102,
            height=117,

        },
        {
            -- Rockets/Parts/12
            x=822,
            y=2442,
            width=105,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 39
        },
        {
            -- Rockets/Parts/13
            x=2019,
            y=2031,
            width=102,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 107
        },
        {
            -- Rockets/Parts/14
            x=1536,
            y=2400,
            width=102,
            height=60,

        },
        {
            -- Rockets/Parts/15
            x=3048,
            y=963,
            width=102,
            height=111,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 110
        },
        {
            -- Rockets/Parts/16
            x=1374,
            y=1860,
            width=123,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 74
        },
        {
            -- Rockets/Parts/17
            x=2019,
            y=1908,
            width=102,
            height=111,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 110
        },
        {
            -- Rockets/Parts/18
            x=2556,
            y=1632,
            width=102,
            height=63,

        },
        {
            -- Rockets/Parts/19
            x=1581,
            y=2877,
            width=90,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 78
        },
        {
            -- Rockets/Parts/2
            x=807,
            y=2967,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/20
            x=3630,
            y=1773,
            width=66,
            height=66,

        },
        {
            -- Rockets/Parts/21
            x=3063,
            y=2622,
            width=54,
            height=54,

        },
        {
            -- Rockets/Parts/22
            x=3471,
            y=2733,
            width=42,
            height=42,

        },
        {
            -- Rockets/Parts/23
            x=987,
            y=1188,
            width=45,
            height=255,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 255
        },
        {
            -- Rockets/Parts/24
            x=876,
            y=1605,
            width=45,
            height=198,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 198
        },
        {
            -- Rockets/Parts/25
            x=921,
            y=1188,
            width=54,
            height=240,

        },
        {
            -- Rockets/Parts/26
            x=804,
            y=1620,
            width=60,
            height=219,

        },
        {
            -- Rockets/Parts/27
            x=1350,
            y=2496,
            width=63,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 122
        },
        {
            -- Rockets/Parts/28
            x=2343,
            y=1842,
            width=60,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 146
        },
        {
            -- Rockets/Parts/29
            x=2403,
            y=1575,
            width=57,
            height=135,

        },
        {
            -- Rockets/Parts/3
            x=921,
            y=2967,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/30
            x=2472,
            y=1575,
            width=72,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 128
        },
        {
            -- Rockets/Parts/31
            x=3525,
            y=861,
            width=48,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 125
        },
        {
            -- Rockets/Parts/4
            x=2442,
            y=1980,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/5
            x=1791,
            y=1947,
            width=102,
            height=117,

        },
        {
            -- Rockets/Parts/6
            x=2556,
            y=1524,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/7
            x=2715,
            y=1464,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/8
            x=2718,
            y=1884,
            width=102,
            height=96,

        },
        {
            -- Rockets/Parts/9
            x=1905,
            y=1947,
            width=102,
            height=117,

        },
        {
            -- Rockets/SpaceRockets/1
            x=1083,
            y=354,
            width=237,
            height=465,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 236,
            sourceHeight = 464
        },
        {
            -- Rockets/SpaceRockets/2
            x=1332,
            y=423,
            width=177,
            height=474,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 177,
            sourceHeight = 473
        },
        {
            -- Rockets/SpaceRockets/3 Copy
            x=1521,
            y=720,
            width=471,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 470,
            sourceHeight = 92
        },
        {
            -- Rockets/SpaceRockets/3
            x=435,
            y=774,
            width=204,
            height=555,

        },
        {
            -- Rockets/SpaceRockets/4
            x=423,
            y=1386,
            width=186,
            height=561,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 185,
            sourceHeight = 561
        },
        {
            -- Ruby/1
            x=2370,
            y=2130,
            width=69,
            height=54,

        },
        {
            -- Ruby/2
            x=2451,
            y=2130,
            width=69,
            height=54,

        },
        {
            -- Ruby/3
            x=1683,
            y=3009,
            width=69,
            height=54,

        },
        {
            -- Ruby/4
            x=2166,
            y=3009,
            width=69,
            height=54,

        },
        {
            -- Ships/1
            x=2151,
            y=1716,
            width=150,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 149,
            sourceHeight = 113
        },
        {
            -- Ships/10
            x=1104,
            y=2496,
            width=150,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 149,
            sourceHeight = 113
        },
        {
            -- Ships/11
            x=2529,
            y=939,
            width=168,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 168,
            sourceHeight = 113
        },
        {
            -- Ships/12
            x=1536,
            y=2082,
            width=147,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 113
        },
        {
            -- Ships/13
            x=2544,
            y=720,
            width=141,
            height=126,

        },
        {
            -- Ships/14
            x=3621,
            y=288,
            width=156,
            height=126,

        },
        {
            -- Ships/15
            x=3621,
            y=426,
            width=156,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 126
        },
        {
            -- Ships/16
            x=951,
            y=1983,
            width=123,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 128
        },
        {
            -- Ships/17
            x=2154,
            y=1575,
            width=147,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 128
        },
        {
            -- Ships/18
            x=3699,
            y=1257,
            width=78,
            height=81,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 79
        },
        {
            -- Ships/19
            x=1230,
            y=1431,
            width=156,
            height=126,

        },
        {
            -- Ships/2
            x=2709,
            y=1212,
            width=168,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 168,
            sourceHeight = 113
        },
        {
            -- Ships/20
            x=1821,
            y=1425,
            width=156,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 126
        },
        {
            -- Ships/21
            x=957,
            y=2124,
            width=123,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 128
        },
        {
            -- Ships/22
            x=918,
            y=1842,
            width=147,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 128
        },
        {
            -- Ships/23
            x=1236,
            y=1719,
            width=141,
            height=126,

        },
        {
            -- Ships/24
            x=1560,
            y=1728,
            width=156,
            height=126,

        },
        {
            -- Ships/25
            x=1869,
            y=1713,
            width=156,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 126
        },
        {
            -- Ships/26
            x=1245,
            y=1953,
            width=123,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 128
        },
        {
            -- Ships/27
            x=1077,
            y=1812,
            width=147,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 128
        },
        {
            -- Ships/28
            x=1086,
            y=1953,
            width=147,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 128
        },
        {
            -- Ships/29
            x=1092,
            y=2094,
            width=141,
            height=126,

        },
        {
            -- Ships/3
            x=1536,
            y=2208,
            width=147,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 113
        },
        {
            -- Ships/30
            x=1245,
            y=2094,
            width=156,
            height=126,

        },
        {
            -- Ships/31
            x=1107,
            y=2232,
            width=156,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 126
        },
        {
            -- Ships/32
            x=972,
            y=2265,
            width=123,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 128
        },
        {
            -- Ships/33
            x=1101,
            y=2622,
            width=150,
            height=123,

        },
        {
            -- Ships/34
            x=423,
            y=2493,
            width=171,
            height=123,

        },
        {
            -- Ships/35
            x=1389,
            y=1728,
            width=159,
            height=120,

        },
        {
            -- Ships/36
            x=621,
            y=1446,
            width=189,
            height=162,

        },
        {
            -- Ships/37
            x=1494,
            y=1287,
            width=204,
            height=129,

        },
        {
            -- Ships/38
            x=282,
            y=2628,
            width=141,
            height=222,

        },
        {
            -- Ships/39
            x=1107,
            y=2370,
            width=153,
            height=114,

        },
        {
            -- Ships/4
            x=1695,
            y=2076,
            width=150,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 149,
            sourceHeight = 113
        },
        {
            -- Ships/40
            x=1074,
            y=1578,
            width=150,
            height=141,

        },
        {
            -- Ships/41
            x=2991,
            y=348,
            width=258,
            height=228,

        },
        {
            -- Ships/5
            x=2709,
            y=1338,
            width=168,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 168,
            sourceHeight = 113
        },
        {
            -- Ships/6
            x=1695,
            y=2202,
            width=147,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 113
        },
        {
            -- Ships/7
            x=1857,
            y=2076,
            width=150,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 149,
            sourceHeight = 113
        },
        {
            -- Ships/8
            x=2190,
            y=1332,
            width=168,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 168,
            sourceHeight = 113
        },
        {
            -- Ships/9
            x=1854,
            y=2202,
            width=147,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 113
        },
        {
            -- Ships/Damages/1
            x=2133,
            y=1908,
            width=111,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 111,
            sourceHeight = 98
        },
        {
            -- Ships/Damages/2
            x=3261,
            y=750,
            width=138,
            height=87,

        },
        {
            -- Ships/Damages/3
            x=2133,
            y=2376,
            width=102,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 83
        },
        {
            -- Ships/Damages/4
            x=3024,
            y=717,
            width=126,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 126,
            sourceHeight = 107
        },
        {
            -- Ships/Damages/5
            x=2139,
            y=1458,
            width=147,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 147,
            sourceHeight = 104
        },
        {
            -- Ships/Damages/6
            x=2133,
            y=2274,
            width=117,
            height=90,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 116,
            sourceHeight = 89
        },
        {
            -- Ships/Damages/7
            x=1095,
            y=2757,
            width=135,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 113
        },
        {
            -- Ships/Damages/8
            x=3615,
            y=9,
            width=162,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 161,
            sourceHeight = 108
        },
        {
            -- Ships/Damages/9
            x=666,
            y=2967,
            width=129,
            height=96,

        },
        {
            -- Ships/Parts/Beams/1
            x=3300,
            y=1422,
            width=60,
            height=30,

        },
        {
            -- Ships/Parts/Beams/10
            x=3234,
            y=1419,
            width=54,
            height=33,

        },
        {
            -- Ships/Parts/Beams/11
            x=2532,
            y=2139,
            width=87,
            height=42,

        },
        {
            -- Ships/Parts/Beams/12
            x=3474,
            y=1608,
            width=81,
            height=18,

        },
        {
            -- Ships/Parts/Beams/13
            x=3447,
            y=1638,
            width=72,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 41
        },
        {
            -- Ships/Parts/Beams/14
            x=1425,
            y=2598,
            width=78,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 21
        },
        {
            -- Ships/Parts/Beams/2
            x=3063,
            y=2562,
            width=57,
            height=48,

        },
        {
            -- Ships/Parts/Beams/3
            x=3597,
            y=2784,
            width=45,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 44
        },
        {
            -- Ships/Parts/Beams/4
            x=2631,
            y=2250,
            width=63,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 26
        },
        {
            -- Ships/Parts/Beams/5
            x=3147,
            y=1299,
            width=60,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 38
        },
        {
            -- Ships/Parts/Beams/6
            x=2664,
            y=1998,
            width=66,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 35
        },
        {
            -- Ships/Parts/Beams/7
            x=2616,
            y=363,
            width=66,
            height=48,

        },
        {
            -- Ships/Parts/Beams/8
            x=1500,
            y=2232,
            width=24,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 23,
            sourceHeight = 102
        },
        {
            -- Ships/Parts/Beams/9
            x=2496,
            y=2334,
            width=39,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 39,
            sourceHeight = 98
        },
        {
            -- Ships/Parts/Cockpits/1
            x=2919,
            y=2439,
            width=60,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/10
            x=2826,
            y=1785,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/11
            x=2133,
            y=2568,
            width=93,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 93
        },
        {
            -- Ships/Parts/Cockpits/12
            x=3066,
            y=1350,
            width=72,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/13
            x=2460,
            y=1449,
            width=72,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Cockpits/14
            x=3150,
            y=1827,
            width=63,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/15
            x=1980,
            y=2757,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/16
            x=2574,
            y=1707,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/17
            x=3570,
            y=2352,
            width=60,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/18
            x=2901,
            y=1785,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/19
            x=2238,
            y=2577,
            width=93,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 93
        },
        {
            -- Ships/Parts/Cockpits/2
            x=2499,
            y=2976,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/20
            x=3150,
            y=1350,
            width=72,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/21
            x=1242,
            y=2757,
            width=72,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Cockpits/22
            x=3225,
            y=1827,
            width=63,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/23
            x=3147,
            y=1179,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/24
            x=2574,
            y=1833,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/25
            x=3255,
            y=2424,
            width=60,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/26
            x=2574,
            y=2976,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/27
            x=2235,
            y=2757,
            width=93,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 93
        },
        {
            -- Ships/Parts/Cockpits/28
            x=3525,
            y=1326,
            width=72,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/29
            x=1266,
            y=2496,
            width=72,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Cockpits/3
            x=1758,
            y=2871,
            width=93,
            height=93,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 93
        },
        {
            -- Ships/Parts/Cockpits/30
            x=2427,
            y=2862,
            width=63,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/31
            x=3309,
            y=1182,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/32
            x=3291,
            y=951,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/4
            x=3609,
            y=1335,
            width=72,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/5
            x=1272,
            y=2370,
            width=72,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Cockpits/6
            x=2502,
            y=2862,
            width=63,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/7
            x=3198,
            y=1587,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/8
            x=1332,
            y=2631,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/9
            x=2991,
            y=2496,
            width=60,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/Bases/1
            x=3456,
            y=1431,
            width=57,
            height=84,

        },
        {
            -- Ships/Parts/Cockpits/Bases/10
            x=2994,
            y=2331,
            width=57,
            height=84,

        },
        {
            -- Ships/Parts/Cockpits/Bases/11
            x=2661,
            y=2289,
            width=51,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/12
            x=1215,
            y=2967,
            width=72,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/13
            x=3216,
            y=1707,
            width=54,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/Bases/14
            x=3144,
            y=2106,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/Bases/15
            x=1539,
            y=2967,
            width=60,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/16
            x=2415,
            y=2334,
            width=69,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 99
        },
        {
            -- Ships/Parts/Cockpits/Bases/17
            x=1881,
            y=2328,
            width=90,
            height=99,

        },
        {
            -- Ships/Parts/Cockpits/Bases/18
            x=2976,
            y=1710,
            width=78,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/Bases/2
            x=2799,
            y=2247,
            width=51,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/3
            x=1299,
            y=2967,
            width=72,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/4
            x=3264,
            y=1464,
            width=54,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Cockpits/Bases/5
            x=2724,
            y=2247,
            width=63,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 86
        },
        {
            -- Ships/Parts/Cockpits/Bases/6
            x=1611,
            y=2967,
            width=60,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 95
        },
        {
            -- Ships/Parts/Cockpits/Bases/7
            x=2463,
            y=2445,
            width=69,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 99
        },
        {
            -- Ships/Parts/Cockpits/Bases/8
            x=1881,
            y=2439,
            width=90,
            height=99,

        },
        {
            -- Ships/Parts/Cockpits/Bases/9
            x=3066,
            y=1713,
            width=78,
            height=102,

        },
        {
            -- Ships/Parts/Cockpits/Glass/1
            x=3654,
            y=2763,
            width=21,
            height=45,

        },
        {
            -- Ships/Parts/Cockpits/Glass/10
            x=3048,
            y=2877,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/11
            x=3279,
            y=2868,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/12
            x=3075,
            y=2874,
            width=39,
            height=39,

        },
        {
            -- Ships/Parts/Cockpits/Glass/13
            x=2415,
            y=2445,
            width=24,
            height=24,

        },
        {
            -- Ships/Parts/Cockpits/Glass/14
            x=3705,
            y=2820,
            width=21,
            height=45,

        },
        {
            -- Ships/Parts/Cockpits/Glass/15
            x=3705,
            y=2877,
            width=21,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 45
        },
        {
            -- Ships/Parts/Cockpits/Glass/16
            x=3750,
            y=2679,
            width=27,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 39
        },
        {
            -- Ships/Parts/Cockpits/Glass/17
            x=3306,
            y=2931,
            width=21,
            height=42,

        },
        {
            -- Ships/Parts/Cockpits/Glass/18
            x=3228,
            y=2628,
            width=36,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 44
        },
        {
            -- Ships/Parts/Cockpits/Glass/19
            x=3210,
            y=2508,
            width=33,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 45
        },
        {
            -- Ships/Parts/Cockpits/Glass/2
            x=3306,
            y=2874,
            width=21,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 45
        },
        {
            -- Ships/Parts/Cockpits/Glass/20
            x=3750,
            y=2490,
            width=27,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/21
            x=3081,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/22
            x=3108,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/23
            x=3135,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/24
            x=3162,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/25
            x=3126,
            y=2874,
            width=39,
            height=39,

        },
        {
            -- Ships/Parts/Cockpits/Glass/26
            x=2823,
            y=2724,
            width=24,
            height=24,

        },
        {
            -- Ships/Parts/Cockpits/Glass/3
            x=3750,
            y=2730,
            width=27,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 39
        },
        {
            -- Ships/Parts/Cockpits/Glass/4
            x=3243,
            y=3021,
            width=21,
            height=42,

        },
        {
            -- Ships/Parts/Cockpits/Glass/5
            x=3525,
            y=2715,
            width=36,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 44
        },
        {
            -- Ships/Parts/Cockpits/Glass/6
            x=3642,
            y=2652,
            width=33,
            height=45,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 45
        },
        {
            -- Ships/Parts/Cockpits/Glass/7
            x=3750,
            y=2553,
            width=27,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/8
            x=3189,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Cockpits/Glass/9
            x=3216,
            y=3012,
            width=15,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Engines/1
            x=3483,
            y=1773,
            width=57,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 35
        },
        {
            -- Ships/Parts/Engines/2
            x=3525,
            y=2064,
            width=63,
            height=42,

        },
        {
            -- Ships/Parts/Engines/3
            x=3012,
            y=1344,
            width=42,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 36
        },
        {
            -- Ships/Parts/Engines/4
            x=2742,
            y=2070,
            width=75,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 68
        },
        {
            -- Ships/Parts/Engines/5
            x=3063,
            y=2106,
            width=66,
            height=36,

        },
        {
            -- Ships/Parts/Engines/6
            x=2631,
            y=2139,
            width=54,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 99
        },
        {
            -- Ships/Parts/Engines/7
            x=2505,
            y=2757,
            width=66,
            height=93,

        },
        {
            -- Ships/Parts/Engines/8
            x=2547,
            y=2289,
            width=63,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 99
        },
        {
            -- Ships/Parts/Engines/9
            x=3324,
            y=2199,
            width=45,
            height=72,

        },
        {
            -- Ships/Parts/Guns/1
            x=3639,
            y=2118,
            width=24,
            height=54,

        },
        {
            -- Ships/Parts/Guns/10
            x=3642,
            y=2577,
            width=33,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Guns/11
            x=3018,
            y=2643,
            width=33,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Guns/12
            x=636,
            y=3009,
            width=18,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 48
        },
        {
            -- Ships/Parts/Guns/13
            x=3750,
            y=2283,
            width=27,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 57
        },
        {
            -- Ships/Parts/Guns/14
            x=3306,
            y=2814,
            width=24,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 23,
            sourceHeight = 48
        },
        {
            -- Ships/Parts/Guns/15
            x=3510,
            y=1914,
            width=27,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 63
        },
        {
            -- Ships/Parts/Guns/2
            x=3750,
            y=2616,
            width=27,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Guns/3
            x=3444,
            y=2787,
            width=21,
            height=54,

        },
        {
            -- Ships/Parts/Guns/4
            x=3207,
            y=2310,
            width=24,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 24,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Guns/5
            x=3750,
            y=2352,
            width=27,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 57
        },
        {
            -- Ships/Parts/Guns/6
            x=2838,
            y=2760,
            width=21,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 21,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Guns/7
            x=2805,
            y=2565,
            width=15,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 15,
            sourceHeight = 71
        },
        {
            -- Ships/Parts/Guns/8
            x=2742,
            y=2484,
            width=30,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 78
        },
        {
            -- Ships/Parts/Guns/9
            x=3483,
            y=2010,
            width=30,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 78
        },
        {
            -- Ships/Parts/Others/1
            x=3342,
            y=2748,
            width=27,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 38
        },
        {
            -- Ships/Parts/Others/2
            x=3399,
            y=1539,
            width=36,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 32
        },
        {
            -- Ships/Parts/Others/3
            x=3075,
            y=2973,
            width=33,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 27
        },
        {
            -- Ships/Parts/Others/4
            x=1332,
            y=354,
            width=30,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 47
        },
        {
            -- Ships/Parts/Others/5
            x=3294,
            y=2685,
            width=42,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 47
        },
        {
            -- Ships/Parts/Scratches/1
            x=3180,
            y=2640,
            width=36,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 35
        },
        {
            -- Ships/Parts/Scratches/2
            x=2139,
            y=1425,
            width=24,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 24,
            sourceHeight = 20
        },
        {
            -- Ships/Parts/Wings/1
            x=3456,
            y=1191,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 108
        },
        {
            -- Ships/Parts/Wings/10
            x=1704,
            y=2739,
            width=39,
            height=126,

        },
        {
            -- Ships/Parts/Wings/11
            x=1326,
            y=2757,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/12
            x=3603,
            y=993,
            width=63,
            height=120,

        },
        {
            -- Ships/Parts/Wings/13
            x=2055,
            y=2757,
            width=78,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Wings/14
            x=1416,
            y=2757,
            width=63,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/15
            x=2415,
            y=1842,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 125
        },
        {
            -- Ships/Parts/Wings/16
            x=2493,
            y=1851,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 117
        },
        {
            -- Ships/Parts/Wings/17
            x=3456,
            y=1311,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/18
            x=2046,
            y=2322,
            width=75,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 105
        },
        {
            -- Ships/Parts/Wings/19
            x=3063,
            y=1827,
            width=75,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 101
        },
        {
            -- Ships/Parts/Wings/2
            x=1830,
            y=2610,
            width=39,
            height=126,

        },
        {
            -- Ships/Parts/Wings/20
            x=3384,
            y=1188,
            width=60,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/21
            x=3234,
            y=1299,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/22
            x=1830,
            y=2748,
            width=57,
            height=111,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 110
        },
        {
            -- Ships/Parts/Wings/23
            x=2664,
            y=1860,
            width=42,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Wings/24
            x=3195,
            y=825,
            width=54,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 119
        },
        {
            -- Ships/Parts/Wings/25
            x=3525,
            y=999,
            width=66,
            height=123,

        },
        {
            -- Ships/Parts/Wings/26
            x=2829,
            y=1464,
            width=51,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 129
        },
        {
            -- Ships/Parts/Wings/27
            x=1668,
            y=2610,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/28
            x=1356,
            y=2367,
            width=54,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/29
            x=3273,
            y=1584,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 108
        },
        {
            -- Ships/Parts/Wings/3
            x=1425,
            y=2472,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/30
            x=2232,
            y=2871,
            width=39,
            height=126,

        },
        {
            -- Ships/Parts/Wings/31
            x=1515,
            y=2472,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/32
            x=3678,
            y=990,
            width=63,
            height=120,

        },
        {
            -- Ships/Parts/Wings/33
            x=2145,
            y=2754,
            width=78,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Wings/34
            x=1422,
            y=2631,
            width=63,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/35
            x=2382,
            y=2196,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 125
        },
        {
            -- Ships/Parts/Wings/36
            x=1749,
            y=2610,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 117
        },
        {
            -- Ships/Parts/Wings/37
            x=3282,
            y=1704,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/38
            x=2976,
            y=1824,
            width=75,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 105
        },
        {
            -- Ships/Parts/Wings/39
            x=3525,
            y=1212,
            width=75,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 101
        },
        {
            -- Ships/Parts/Wings/4
            x=1755,
            y=2739,
            width=63,
            height=120,

        },
        {
            -- Ships/Parts/Wings/40
            x=3384,
            y=1308,
            width=60,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/41
            x=3309,
            y=1302,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/42
            x=3129,
            y=1590,
            width=57,
            height=111,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 110
        },
        {
            -- Ships/Parts/Wings/43
            x=2178,
            y=2871,
            width=42,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Wings/44
            x=2112,
            y=2874,
            width=54,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 119
        },
        {
            -- Ships/Parts/Wings/45
            x=3585,
            y=858,
            width=66,
            height=123,

        },
        {
            -- Ships/Parts/Wings/46
            x=1983,
            y=2328,
            width=51,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 129
        },
        {
            -- Ships/Parts/Wings/47
            x=1899,
            y=2748,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/48
            x=2046,
            y=2877,
            width=54,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/49
            x=3300,
            y=1824,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 108
        },
        {
            -- Ships/Parts/Wings/5
            x=2898,
            y=1593,
            width=78,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Wings/50
            x=2337,
            y=2862,
            width=39,
            height=126,

        },
        {
            -- Ships/Parts/Wings/51
            x=1695,
            y=2328,
            width=78,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/52
            x=1683,
            y=2877,
            width=63,
            height=120,

        },
        {
            -- Ships/Parts/Wings/53
            x=2988,
            y=1593,
            width=78,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Wings/54
            x=3381,
            y=951,
            width=63,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/55
            x=2460,
            y=2196,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 125
        },
        {
            -- Ships/Parts/Wings/56
            x=1965,
            y=2877,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 117
        },
        {
            -- Ships/Parts/Wings/57
            x=3330,
            y=1464,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/58
            x=3222,
            y=1182,
            width=75,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 105
        },
        {
            -- Ships/Parts/Wings/59
            x=3612,
            y=1221,
            width=75,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 101
        },
        {
            -- Ships/Parts/Wings/6
            x=3120,
            y=1464,
            width=63,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 63,
            sourceHeight = 113
        },
        {
            -- Ships/Parts/Wings/60
            x=3342,
            y=1584,
            width=60,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/61
            x=3351,
            y=1704,
            width=63,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 107
        },
        {
            -- Ships/Parts/Wings/62
            x=3195,
            y=1464,
            width=57,
            height=111,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 110
        },
        {
            -- Ships/Parts/Wings/63
            x=2283,
            y=2862,
            width=42,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Wings/64
            x=2913,
            y=1212,
            width=54,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 119
        },
        {
            -- Ships/Parts/Wings/65
            x=3663,
            y=855,
            width=66,
            height=123,

        },
        {
            -- Ships/Parts/Wings/66
            x=1542,
            y=2598,
            width=51,
            height=129,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 129
        },
        {
            -- Ships/Parts/Wings/67
            x=2892,
            y=1464,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/68
            x=2973,
            y=1464,
            width=54,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 116
        },
        {
            -- Ships/Parts/Wings/7
            x=1581,
            y=2739,
            width=66,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 125
        },
        {
            -- Ships/Parts/Wings/8
            x=3039,
            y=1464,
            width=69,
            height=117,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 117
        },
        {
            -- Ships/Parts/Wings/9
            x=3369,
            y=1824,
            width=57,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 108
        },
        {
            -- Stations/1
            x=423,
            y=1959,
            width=186,
            height=522,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 521
        },
        {
            -- Stations/10
            x=2697,
            y=660,
            width=261,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 260,
            sourceHeight = 60
        },
        {
            -- Stations/11
            x=2265,
            y=849,
            width=261,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 260,
            sourceHeight = 60
        },
        {
            -- Stations/2
            x=9,
            y=2628,
            width=261,
            height=435,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 260,
            sourceHeight = 434
        },
        {
            -- Stations/3
            x=9,
            y=774,
            width=414,
            height=600,

        },
        {
            -- Stations/4
            x=2265,
            y=921,
            width=252,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 252,
            sourceHeight = 59
        },
        {
            -- Stations/5
            x=3279,
            y=339,
            width=252,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 252,
            sourceHeight = 59
        },
        {
            -- Stations/6
            x=606,
            y=2493,
            width=249,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 249,
            sourceHeight = 101
        },
        {
            -- Stations/7
            x=2697,
            y=732,
            width=249,
            height=102,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 249,
            sourceHeight = 101
        },
        {
            -- Stations/8
            x=1995,
            y=849,
            width=258,
            height=78,

        },
        {
            -- Stations/9
            x=1521,
            y=825,
            width=261,
            height=78,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 260,
            sourceHeight = 78
        },
        {
            -- Stations/Parts/1
            x=2622,
            y=2289,
            width=27,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 99
        },
        {
            -- Stations/Parts/10
            x=3600,
            y=2064,
            width=63,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 42
        },
        {
            -- Stations/Parts/11
            x=3510,
            y=2424,
            width=63,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 42
        },
        {
            -- Stations/Parts/12
            x=3708,
            y=1776,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/13
            x=3570,
            y=2196,
            width=57,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/14
            x=3687,
            y=2145,
            width=51,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/15
            x=3687,
            y=2361,
            width=51,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/16
            x=1293,
            y=831,
            width=27,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/17
            x=3159,
            y=2514,
            width=39,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/18
            x=2829,
            y=2079,
            width=75,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/19
            x=3687,
            y=2502,
            width=51,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/2
            x=2838,
            y=2835,
            width=39,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 63
        },
        {
            -- Stations/Parts/20
            x=2976,
            y=1941,
            width=87,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/21
            x=3705,
            y=1854,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 66
        },
        {
            -- Stations/Parts/22
            x=2703,
            y=1131,
            width=186,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 185,
            sourceHeight = 68
        },
        {
            -- Stations/Parts/23
            x=1509,
            y=1866,
            width=126,
            height=69,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 125,
            sourceHeight = 68
        },
        {
            -- Stations/Parts/24
            x=3543,
            y=339,
            width=63,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Stations/Parts/3
            x=3003,
            y=1122,
            width=33,
            height=99,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 99
        },
        {
            -- Stations/Parts/4
            x=2709,
            y=960,
            width=189,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 87
        },
        {
            -- Stations/Parts/5
            x=1695,
            y=2547,
            width=81,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 51
        },
        {
            -- Stations/Parts/6
            x=1965,
            y=3006,
            width=93,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 57
        },
        {
            -- Stations/Parts/7
            x=3645,
            y=789,
            width=129,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 128,
            sourceHeight = 54
        },
        {
            -- Stations/Parts/8
            x=2709,
            y=1059,
            width=189,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 188,
            sourceHeight = 60
        },
        {
            -- Stations/Parts/9
            x=3510,
            y=2478,
            width=63,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 42
        },
        {
            -- Turrets/1
            x=2991,
            y=2244,
            width=66,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 75
        },
        {
            -- Turrets/2
            x=3693,
            y=1350,
            width=81,
            height=87,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 81,
            sourceHeight = 86
        },
        {
            -- Turrets/3
            x=2538,
            y=2193,
            width=81,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 84
        },
        {
            -- Turrets/Parts/Bases/1
            x=3243,
            y=2349,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Turrets/Parts/Bases/2
            x=2544,
            y=2478,
            width=81,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 81,
            sourceHeight = 83
        },
        {
            -- Turrets/Parts/Bases/3
            x=3675,
            y=1995,
            width=63,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 62
        },
        {
            -- Turrets/Parts/Bases/4
            x=3633,
            y=2709,
            width=42,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 41
        },
        {
            -- Turrets/Parts/Cannos/1
            x=3750,
            y=2421,
            width=27,
            height=57,

        },
        {
            -- Turrets/Parts/Cannos/2
            x=3006,
            y=2568,
            width=42,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 62
        },
        {
            -- Turrets/Parts/Cannos/3
            x=2823,
            y=2649,
            width=42,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 41,
            sourceHeight = 62
        },
        {
            -- UFOs/1
            x=1671,
            y=1428,
            width=138,
            height=138,

        },
        {
            -- UFOs/2
            x=1689,
            y=1578,
            width=138,
            height=138,

        },
        {
            -- UFOs/3
            x=1839,
            y=1563,
            width=138,
            height=138,

        },
        {
            -- UFOs/4
            x=1989,
            y=1425,
            width=138,
            height=138,

        },
        {
            -- UI/Bar-corners/1/3-slices/1
            x=801,
            y=2292,
            width=9,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/1/3-slices/2
            x=3774,
            y=129,
            width=3,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/1/3-slices/3
            x=996,
            y=2736,
            width=12,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/2/3-slices/1
            x=2970,
            y=660,
            width=9,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 27
        },
        {
            -- UI/Bar-corners/2/3-slices/2
            x=2529,
            y=1065,
            width=3,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 27
        },
        {
            -- UI/Bar-corners/2/3-slices/3
            x=2007,
            y=1851,
            width=12,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 27
        },
        {
            -- UI/Bar-corners/3/3-slices/1
            x=3276,
            y=3021,
            width=9,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/3/3-slices/2
            x=3219,
            y=1299,
            width=3,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/3/3-slices/3
            x=3468,
            y=2952,
            width=12,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/4/3-slices/1
            x=3492,
            y=2904,
            width=9,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/4/3-slices/2
            x=3774,
            y=168,
            width=3,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Bar-corners/4/3-slices/3
            x=3492,
            y=2943,
            width=12,
            height=27,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 26
        },
        {
            -- UI/Bars/1/9-slices/1
            x=606,
            y=2607,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/1/9-slices/2
            x=3144,
            y=2310,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/1/9-slices/3
            x=2415,
            y=1980,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/1/9-slices/4
            x=1869,
            y=1851,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/1/9-slices/5
            x=2991,
            y=2568,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/1/9-slices/6
            x=801,
            y=2331,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/1/9-slices/7
            x=2979,
            y=1212,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/1/9-slices/8
            x=3510,
            y=1989,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/1/9-slices/9
            x=2463,
            y=2556,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/1
            x=2484,
            y=2556,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/2
            x=3426,
            y=2970,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/3
            x=3711,
            y=1122,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/4
            x=3495,
            y=3003,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/5
            x=2958,
            y=2958,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/6
            x=3297,
            y=3045,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/7
            x=3732,
            y=1122,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/8
            x=3453,
            y=3006,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/2/9-slices/9
            x=2889,
            y=3051,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/1
            x=3288,
            y=2997,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/2
            x=3693,
            y=2943,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/3
            x=3651,
            y=2943,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/4
            x=3303,
            y=3060,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/3/9-slices/5
            x=3003,
            y=2817,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/3/9-slices/6
            x=3516,
            y=3006,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/3/9-slices/7
            x=3672,
            y=2943,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/8
            x=3558,
            y=2985,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/3/9-slices/9
            x=3495,
            y=2982,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/1
            x=3516,
            y=2985,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/2
            x=3558,
            y=3006,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/3
            x=3537,
            y=2985,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/4
            x=3537,
            y=3006,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/5
            x=2976,
            y=348,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/6
            x=3573,
            y=3015,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/7
            x=3312,
            y=3012,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/8
            x=3693,
            y=2964,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Bars/4/9-slices/9
            x=3333,
            y=3015,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/1
            x=2478,
            y=2976,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/1/9-slices/2
            x=2343,
            y=2001,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/1/9-slices/3
            x=2778,
            y=2415,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/1/9-slices/4
            x=3567,
            y=1605,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/1/9-slices/5
            x=1092,
            y=2232,
            width=3,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/1/9-slices/6
            x=2970,
            y=699,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/1/9-slices/7
            x=3504,
            y=2100,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/1/9-slices/8
            x=3405,
            y=3036,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/1/9-slices/9
            x=2694,
            y=2397,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/1
            x=2007,
            y=1890,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/2
            x=3543,
            y=3021,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/3
            x=2505,
            y=2556,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/4
            x=3036,
            y=2985,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/2/9-slices/5
            x=2175,
            y=1425,
            width=3,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/2/9-slices/6
            x=3447,
            y=2613,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/2/9-slices/7
            x=3573,
            y=2979,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/8
            x=3504,
            y=3057,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/2/9-slices/9
            x=3573,
            y=2997,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/1
            x=3651,
            y=2964,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/2
            x=3519,
            y=3057,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/3
            x=3672,
            y=2964,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/4
            x=3513,
            y=2898,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/3/9-slices/5
            x=1092,
            y=2232,
            width=3,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/3/9-slices/6
            x=3534,
            y=2898,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/3/9-slices/7
            x=3708,
            y=2934,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/8
            x=3522,
            y=3039,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/3/9-slices/9
            x=3708,
            y=2952,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/1
            x=3729,
            y=2934,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/2
            x=3534,
            y=3057,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/3
            x=3729,
            y=2952,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/4
            x=3555,
            y=2892,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/4/9-slices/5
            x=1092,
            y=2232,
            width=3,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/4/9-slices/6
            x=3576,
            y=2892,
            width=9,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 20
        },
        {
            -- UI/Buttons/4/9-slices/7
            x=3750,
            y=2934,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/8
            x=3537,
            y=3039,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Buttons/4/9-slices/9
            x=3750,
            y=2952,
            width=9,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 6
        },
        {
            -- UI/Crossairs/1
            x=2919,
            y=2511,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 59
        },
        {
            -- UI/Crossairs/2
            x=2880,
            y=2583,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 59
        },
        {
            -- UI/Crossairs/3
            x=2727,
            y=2841,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 65
        },
        {
            -- UI/Crossairs/4
            x=2649,
            y=2934,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 65
        },
        {
            -- UI/Crossairs/5
            x=2877,
            y=2655,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 59
        },
        {
            -- UI/Crossairs/6
            x=2838,
            y=2982,
            width=57,
            height=57,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 57,
            sourceHeight = 56
        },
        {
            -- UI/Crossairs/7
            x=2727,
            y=2919,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 65
        },
        {
            -- UI/Crossairs/8
            x=2727,
            y=2997,
            width=66,
            height=66,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 65
        },
        {
            -- UI/Cursors/1
            x=987,
            y=2490,
            width=105,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 104
        },
        {
            -- UI/Cursors/2
            x=2583,
            y=2757,
            width=72,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 83
        },
        {
            -- UI/Cursors/3
            x=2517,
            y=2574,
            width=72,
            height=90,

        },
        {
            -- UI/Cursors/4
            x=2739,
            y=2151,
            width=72,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 83
        },
        {
            -- UI/Cursors/5
            x=2601,
            y=2574,
            width=72,
            height=90,

        },
        {
            -- UI/Cursors/6
            x=2823,
            y=2157,
            width=72,
            height=75,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 71,
            sourceHeight = 75
        },
        {
            -- UI/Dots/1
            x=3177,
            y=2874,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/Dots/2
            x=3228,
            y=2874,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/Dots/3
            x=3339,
            y=2895,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/Dots/4
            x=3390,
            y=2895,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/Dots/5
            x=3441,
            y=2904,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/Dots/6
            x=3075,
            y=2925,
            width=39,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 36
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/1
            x=1515,
            y=2598,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/2
            x=957,
            y=2265,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/3
            x=3372,
            y=1428,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/4
            x=2577,
            y=2961,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/6
            x=960,
            y=1440,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/7
            x=912,
            y=1815,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/8
            x=3003,
            y=2790,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/9
            x=939,
            y=1809,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/1
            x=1542,
            y=2739,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/2
            x=3774,
            y=237,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/3
            x=3441,
            y=2952,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/4
            x=2949,
            y=348,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/6
            x=822,
            y=1605,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/7
            x=3597,
            y=2892,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/8
            x=3132,
            y=1176,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/9
            x=3624,
            y=2892,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/1
            x=3441,
            y=2979,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/2
            x=3132,
            y=1203,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/3
            x=3516,
            y=2931,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/4
            x=849,
            y=1605,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/6
            x=1839,
            y=1713,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/7
            x=3516,
            y=2958,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/8
            x=3426,
            y=2943,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/9
            x=2910,
            y=3039,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/1
            x=3495,
            y=2844,
            width=39,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/2
            x=1065,
            y=774,
            width=6,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/3
            x=3654,
            y=2820,
            width=39,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/4
            x=2391,
            y=1314,
            width=39,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 5
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/5
            x=2526,
            y=2556,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/6
            x=2427,
            y=2976,
            width=39,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 5
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/7
            x=3738,
            y=2826,
            width=39,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/8
            x=3261,
            y=348,
            width=6,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/9
            x=3738,
            y=2880,
            width=39,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 41
        },
        {
            -- UI/GlassPanel-corners/9-slices/1
            x=2937,
            y=3039,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-corners/9-slices/2
            x=3132,
            y=1203,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-corners/9-slices/3
            x=3309,
            y=2985,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-corners/9-slices/4
            x=2991,
            y=717,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/6
            x=3276,
            y=3060,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/7
            x=3336,
            y=2988,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-corners/9-slices/8
            x=3426,
            y=2943,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-corners/9-slices/9
            x=3363,
            y=2988,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-empty/9-slices/1
            x=3390,
            y=2988,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-empty/9-slices/2
            x=3318,
            y=3033,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-empty/9-slices/3
            x=3468,
            y=2991,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-empty/9-slices/4
            x=3708,
            y=2970,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/5
            x=3633,
            y=2763,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/6
            x=3729,
            y=2970,
            width=9,
            height=3,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/7
            x=3543,
            y=2931,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-empty/9-slices/8
            x=3420,
            y=3033,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 2,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-empty/9-slices/9
            x=3543,
            y=2958,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 14
        },
        {
            -- UI/GlassPanel-projection/9-slices/1
            x=3570,
            y=2925,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-projection/9-slices/2
            x=3297,
            y=3018,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-projection/9-slices/3
            x=3597,
            y=2919,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-projection/9-slices/4
            x=2991,
            y=717,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/6
            x=3276,
            y=3060,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/7
            x=3570,
            y=2952,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-projection/9-slices/8
            x=3417,
            y=3006,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel-projection/9-slices/9
            x=3624,
            y=2919,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/1
            x=3597,
            y=2946,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/2
            x=3774,
            y=237,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/3
            x=3624,
            y=2946,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/4
            x=2949,
            y=348,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/6
            x=822,
            y=1605,
            width=15,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/7
            x=3651,
            y=2916,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/8
            x=3132,
            y=1176,
            width=3,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/GlassPanel/9-slices/9
            x=3678,
            y=2916,
            width=15,
            height=15,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/Icons/1
            x=939,
            y=2442,
            width=21,
            height=39,

        },
        {
            -- UI/Icons/ChampionCup
            x=2133,
            y=2472,
            width=99,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 97,
            sourceHeight = 84
        },
        {
            -- UI/Icons/JoyStickRight
            x=2718,
            y=1668,
            width=93,
            height=105,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 91,
            sourceHeight = 105
        },
        {
            -- UI/Icons/ThreePlayers
            x=1236,
            y=1857,
            width=126,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 124,
            sourceHeight = 84
        },
        {
            -- UI/Icons/TriangleRight
            x=1464,
            y=2967,
            width=63,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 61,
            sourceHeight = 96
        },
        {
            -- UI/Icons/enter
            x=2244,
            y=2481,
            width=96,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 84
        },
        {
            -- UI/Icons/leaderBoard
            x=1890,
            y=1851,
            width=105,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 103,
            sourceHeight = 84
        },
        {
            -- UI/Icons/oneUser
            x=3162,
            y=717,
            width=87,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 85,
            sourceHeight = 96
        },
        {
            -- UI/Icons/pause
            x=3546,
            y=750,
            width=87,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 85,
            sourceHeight = 96
        },
        {
            -- UI/Icons/rotate
            x=2247,
            y=2385,
            width=99,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 97,
            sourceHeight = 84
        },
        {
            -- UI/KeyPanel/9-slices/1
            x=3057,
            y=3006,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/2
            x=3756,
            y=3003,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/3
            x=3057,
            y=3006,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/4
            x=3756,
            y=3018,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/5
            x=2442,
            y=1317,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/6
            x=3756,
            y=3018,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/7
            x=3057,
            y=3006,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/8
            x=3756,
            y=3003,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/9
            x=3057,
            y=3006,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/MetalBottomPanel/9-slices/1
            x=3216,
            y=2922,
            width=33,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32
        },
        {
            -- UI/MetalBottomPanel/9-slices/2
            x=2706,
            y=2244,
            width=6,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 32
        },
        {
            -- UI/MetalBottomPanel/9-slices/3
            x=3201,
            y=2967,
            width=33,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32
        },
        {
            -- UI/MetalBottomPanel/9-slices/4
            x=2805,
            y=3057,
            width=33,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 5
        },
        {
            -- UI/MetalBottomPanel/9-slices/5
            x=3489,
            y=3018,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/MetalBottomPanel/9-slices/6
            x=1224,
            y=1404,
            width=33,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 5
        },
        {
            -- UI/MetalBottomPanel/9-slices/7
            x=3261,
            y=2931,
            width=33,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32
        },
        {
            -- UI/MetalBottomPanel/9-slices/8
            x=1044,
            y=1188,
            width=9,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 32
        },
        {
            -- UI/MetalBottomPanel/9-slices/9
            x=3339,
            y=2943,
            width=33,
            height=33,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32
        },
        {
            -- UI/MetalPanel-plate/9-slices/1
            x=3354,
            y=3015,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel-plate/9-slices/2
            x=3432,
            y=3054,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel-plate/9-slices/3
            x=3375,
            y=3015,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel-plate/9-slices/4
            x=3750,
            y=2970,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/5
            x=3771,
            y=2997,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/6
            x=3468,
            y=3018,
            width=9,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/7
            x=3396,
            y=3015,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel-plate/9-slices/8
            x=3435,
            y=3033,
            width=3,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel-plate/9-slices/9
            x=3432,
            y=3006,
            width=9,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8
        },
        {
            -- UI/MetalPanel/9-slices/1
            x=3621,
            y=564,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/2
            x=3774,
            y=264,
            width=3,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/3
            x=2166,
            y=1290,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/4
            x=1269,
            y=1404,
            width=12,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/5
            x=3771,
            y=3012,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/6
            x=3417,
            y=2991,
            width=12,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/7
            x=1500,
            y=2346,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/8
            x=2874,
            y=3051,
            width=3,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/9
            x=2850,
            y=3051,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/Numeral/0
            x=3219,
            y=2118,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/1
            x=2724,
            y=2760,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/2
            x=3243,
            y=2199,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/3
            x=3474,
            y=1527,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/4
            x=3609,
            y=1530,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/5
            x=3426,
            y=1692,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/6
            x=3588,
            y=1611,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/7
            x=3567,
            y=1692,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/8
            x=3669,
            y=1611,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/9
            x=3648,
            y=1692,
            width=69,
            height=69,

        },
        {
            -- UI/Numeral/x
            x=3675,
            y=2070,
            width=63,
            height=63,

        },
        {
            -- UI/Parts/glassPanel_tab_1
            x=3333,
            y=3036,
            width=6,
            height=6,

        },
        {
            -- UI/Parts/glassPanel_tab_2
            x=3549,
            y=3057,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Parts/glassPanel_tab_3
            x=3351,
            y=3036,
            width=6,
            height=6,

        },
        {
            -- UI/Parts/glassPanel_tab_4
            x=1821,
            y=1563,
            width=6,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 2
        },
        {
            -- UI/Parts/glassPanel_tab_5
            x=3756,
            y=3033,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Parts/glassPanel_tab_6
            x=603,
            y=1371,
            width=6,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 2
        },
        {
            -- UI/Parts/glassPanel_tab_7
            x=3369,
            y=3036,
            width=6,
            height=6,

        },
        {
            -- UI/Parts/glassPanel_tab_8
            x=3552,
            y=3039,
            width=3,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 6
        },
        {
            -- UI/Parts/glassPanel_tab_9
            x=3387,
            y=3036,
            width=6,
            height=6,

        },
        {
            -- UI/Parts/glassPanel_tabbar_1
            x=603,
            y=1341,
            width=6,
            height=18,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 17
        },
        {
            -- UI/Parts/glassPanel_tabbar_2
            x=3774,
            y=207,
            width=3,
            height=18,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/Parts/glassPanel_tabbar_3
            x=1044,
            y=1422,
            width=15,
            height=18,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 17
        },
        {
            -- UI/Player-lifes/1
            x=3510,
            y=2532,
            width=63,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 51
        },
        {
            -- UI/Player-lifes/10
            x=3255,
            y=2496,
            width=63,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 51
        },
        {
            -- UI/Player-lifes/11
            x=2649,
            y=3012,
            width=66,
            height=51,

        },
        {
            -- UI/Player-lifes/12
            x=3276,
            y=2559,
            width=60,
            height=51,

        },
        {
            -- UI/Player-lifes/2
            x=3549,
            y=1926,
            width=66,
            height=51,

        },
        {
            -- UI/Player-lifes/3
            x=3063,
            y=2688,
            width=60,
            height=51,

        },
        {
            -- UI/Player-lifes/4
            x=3510,
            y=2595,
            width=63,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 51
        },
        {
            -- UI/Player-lifes/5
            x=3627,
            y=1926,
            width=66,
            height=51,

        },
        {
            -- UI/Player-lifes/6
            x=2946,
            y=2727,
            width=60,
            height=51,

        },
        {
            -- UI/Player-lifes/7
            x=2871,
            y=2727,
            width=63,
            height=51,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 51
        },
        {
            -- UI/Player-lifes/8
            x=3705,
            y=1932,
            width=66,
            height=51,

        },
        {
            -- UI/Player-lifes/9
            x=3276,
            y=2622,
            width=60,
            height=51,

        },
        {
            -- UI/Squares/1/9-slices/1
            x=3450,
            y=3027,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/1/9-slices/2
            x=3468,
            y=3033,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/1/9-slices/3
            x=3450,
            y=3045,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/1/9-slices/4
            x=2556,
            y=1980,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/1/9-slices/5
            x=3771,
            y=1539,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/1/9-slices/6
            x=2805,
            y=2649,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/1/9-slices/7
            x=3486,
            y=3036,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/1/9-slices/8
            x=3468,
            y=3051,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/1/9-slices/9
            x=3486,
            y=3054,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/1
            x=3597,
            y=2973,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/2
            x=3615,
            y=2973,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/3
            x=3633,
            y=2973,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/4
            x=2556,
            y=2001,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/2/9-slices/5
            x=3771,
            y=1560,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/2/9-slices/6
            x=2556,
            y=2022,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/2/9-slices/7
            x=3594,
            y=2991,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/8
            x=3594,
            y=3009,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/2/9-slices/9
            x=3612,
            y=2991,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/1
            x=3612,
            y=3009,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/2
            x=3630,
            y=2991,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/3
            x=3630,
            y=3009,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/4
            x=3771,
            y=1581,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/3/9-slices/5
            x=3057,
            y=2985,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/3/9-slices/6
            x=3288,
            y=2976,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/3/9-slices/7
            x=3651,
            y=2982,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/8
            x=3669,
            y=2982,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/3/9-slices/9
            x=3648,
            y=3000,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/1
            x=3666,
            y=3000,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/2
            x=3687,
            y=2985,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/3
            x=3705,
            y=2985,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/4
            x=3771,
            y=2934,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/4/9-slices/5
            x=3771,
            y=2955,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/4/9-slices/6
            x=3771,
            y=2976,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/4/9-slices/7
            x=3723,
            y=2985,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/8
            x=3741,
            y=2985,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/4/9-slices/9
            x=3684,
            y=3003,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/1
            x=3702,
            y=3003,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/2
            x=3720,
            y=3003,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/3
            x=3738,
            y=3003,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/4
            x=3324,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/5/9-slices/5
            x=3342,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/5/9-slices/6
            x=3360,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/5/9-slices/7
            x=3648,
            y=3018,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/8
            x=3666,
            y=3018,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/5/9-slices/9
            x=3684,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/1
            x=3702,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/2
            x=3720,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/3
            x=3738,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/4
            x=3378,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/6/9-slices/5
            x=3396,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/6/9-slices/6
            x=3414,
            y=3054,
            width=6,
            height=9,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 9
        },
        {
            -- UI/Squares/6/9-slices/7
            x=3507,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/8
            x=3525,
            y=3021,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
        {
            -- UI/Squares/6/9-slices/9
            x=3504,
            y=3039,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 5,
            sourceHeight = 5
        },
    },
    
    sheetContentWidth = 3786,
    sheetContentHeight = 3072
}

SheetInfo.frameIndex =
{

    ["AlienUFOs/Ships/1"] = 1,
    ["AlienUFOs/Ships/2"] = 2,
    ["AlienUFOs/Ships/3"] = 3,
    ["AlienUFOs/Ships/4"] = 4,
    ["AlienUFOs/Ships/5"] = 5,
    ["AlienUFOs/Ships/Damages/1"] = 6,
    ["AlienUFOs/Ships/Damages/10"] = 7,
    ["AlienUFOs/Ships/Damages/2"] = 8,
    ["AlienUFOs/Ships/Damages/3"] = 9,
    ["AlienUFOs/Ships/Damages/4"] = 10,
    ["AlienUFOs/Ships/Damages/5"] = 11,
    ["AlienUFOs/Ships/Damages/6"] = 12,
    ["AlienUFOs/Ships/Damages/7"] = 13,
    ["AlienUFOs/Ships/Damages/8"] = 14,
    ["AlienUFOs/Ships/Damages/9"] = 15,
    ["AlienUFOs/Ships/Parts/Legs/1"] = 16,
    ["AlienUFOs/Ships/Parts/Legs/2"] = 17,
    ["AlienUFOs/Ships/Parts/Legs/3"] = 18,
    ["AlienUFOs/Ships/Parts/Legs/4"] = 19,
    ["AlienUFOs/Ships/Parts/Main/1"] = 20,
    ["AlienUFOs/Ships/Parts/Main/2"] = 21,
    ["AlienUFOs/Ships/Parts/Main/3"] = 22,
    ["AlienUFOs/Ships/Parts/Main/4"] = 23,
    ["AlienUFOs/Ships/Parts/Main/5"] = 24,
    ["AlienUFOs/Ships/Parts/dome"] = 25,
    ["Aliens/Green/hurt"] = 26,
    ["Aliens/Green/stand"] = 27,
    ["Astronauts/1"] = 28,
    ["Astronauts/10"] = 29,
    ["Astronauts/11"] = 30,
    ["Astronauts/12"] = 31,
    ["Astronauts/13"] = 32,
    ["Astronauts/14"] = 33,
    ["Astronauts/15 Copy"] = 34,
    ["Astronauts/15"] = 35,
    ["Astronauts/16"] = 36,
    ["Astronauts/17"] = 37,
    ["Astronauts/18"] = 38,
    ["Astronauts/2"] = 39,
    ["Astronauts/3"] = 40,
    ["Astronauts/4"] = 41,
    ["Astronauts/5"] = 42,
    ["Astronauts/6"] = 43,
    ["Astronauts/7"] = 44,
    ["Astronauts/8"] = 45,
    ["Astronauts/9"] = 46,
    ["Buildings/1"] = 47,
    ["Buildings/10"] = 48,
    ["Buildings/11"] = 49,
    ["Buildings/12"] = 50,
    ["Buildings/13 Copy"] = 51,
    ["Buildings/13"] = 52,
    ["Buildings/2"] = 53,
    ["Buildings/3"] = 54,
    ["Buildings/4"] = 55,
    ["Buildings/5"] = 56,
    ["Buildings/6"] = 57,
    ["Buildings/7"] = 58,
    ["Buildings/8"] = 59,
    ["Buildings/9"] = 60,
    ["Effects/Fire/1"] = 61,
    ["Effects/Fire/10"] = 62,
    ["Effects/Fire/11"] = 63,
    ["Effects/Fire/12"] = 64,
    ["Effects/Fire/13"] = 65,
    ["Effects/Fire/14"] = 66,
    ["Effects/Fire/15"] = 67,
    ["Effects/Fire/16"] = 68,
    ["Effects/Fire/2"] = 69,
    ["Effects/Fire/3"] = 70,
    ["Effects/Fire/4"] = 71,
    ["Effects/Fire/5"] = 72,
    ["Effects/Fire/6"] = 73,
    ["Effects/Fire/7"] = 74,
    ["Effects/Fire/8"] = 75,
    ["Effects/Fire/9"] = 76,
    ["Effects/Shield/1"] = 77,
    ["Effects/Shield/2"] = 78,
    ["Effects/Shield/3"] = 79,
    ["Effects/Speed/1"] = 80,
    ["Effects/Speed/2"] = 81,
    ["Effects/Speed/3"] = 82,
    ["Effects/Speed/4"] = 83,
    ["Effects/Star/1"] = 84,
    ["Effects/Star/2"] = 85,
    ["Effects/Star/3"] = 86,
    ["Effects/smoke/1"] = 87,
    ["Effects/smoke/2"] = 88,
    ["Effects/smoke/3"] = 89,
    ["Effects/smoke/4"] = 90,
    ["Effects/smoke/5"] = 91,
    ["Effects/smoke/6"] = 92,
    ["Effects/smoke/7"] = 93,
    ["Effects/smoke/8"] = 94,
    ["Effects/smoke/9"] = 95,
    ["Items/1"] = 96,
    ["Items/10"] = 97,
    ["Items/100"] = 98,
    ["Items/101"] = 99,
    ["Items/102"] = 100,
    ["Items/103"] = 101,
    ["Items/104"] = 102,
    ["Items/105"] = 103,
    ["Items/106"] = 104,
    ["Items/107"] = 105,
    ["Items/108"] = 106,
    ["Items/109"] = 107,
    ["Items/11"] = 108,
    ["Items/110"] = 109,
    ["Items/111"] = 110,
    ["Items/112"] = 111,
    ["Items/113"] = 112,
    ["Items/114"] = 113,
    ["Items/115"] = 114,
    ["Items/116"] = 115,
    ["Items/117"] = 116,
    ["Items/118"] = 117,
    ["Items/119"] = 118,
    ["Items/12"] = 119,
    ["Items/120"] = 120,
    ["Items/121"] = 121,
    ["Items/122"] = 122,
    ["Items/123"] = 123,
    ["Items/124"] = 124,
    ["Items/125"] = 125,
    ["Items/126"] = 126,
    ["Items/127"] = 127,
    ["Items/128"] = 128,
    ["Items/129"] = 129,
    ["Items/13"] = 130,
    ["Items/130"] = 131,
    ["Items/131"] = 132,
    ["Items/132"] = 133,
    ["Items/133"] = 134,
    ["Items/134"] = 135,
    ["Items/135"] = 136,
    ["Items/136"] = 137,
    ["Items/137"] = 138,
    ["Items/138"] = 139,
    ["Items/139"] = 140,
    ["Items/14"] = 141,
    ["Items/140"] = 142,
    ["Items/141"] = 143,
    ["Items/142"] = 144,
    ["Items/143"] = 145,
    ["Items/144"] = 146,
    ["Items/145"] = 147,
    ["Items/146"] = 148,
    ["Items/147"] = 149,
    ["Items/148"] = 150,
    ["Items/149"] = 151,
    ["Items/15"] = 152,
    ["Items/150"] = 153,
    ["Items/151"] = 154,
    ["Items/152"] = 155,
    ["Items/153"] = 156,
    ["Items/154"] = 157,
    ["Items/155"] = 158,
    ["Items/156"] = 159,
    ["Items/157"] = 160,
    ["Items/158"] = 161,
    ["Items/159"] = 162,
    ["Items/16"] = 163,
    ["Items/160"] = 164,
    ["Items/161"] = 165,
    ["Items/162"] = 166,
    ["Items/163"] = 167,
    ["Items/17"] = 168,
    ["Items/18"] = 169,
    ["Items/19"] = 170,
    ["Items/2"] = 171,
    ["Items/20"] = 172,
    ["Items/21"] = 173,
    ["Items/22"] = 174,
    ["Items/23"] = 175,
    ["Items/24"] = 176,
    ["Items/25"] = 177,
    ["Items/26"] = 178,
    ["Items/27"] = 179,
    ["Items/28"] = 180,
    ["Items/29"] = 181,
    ["Items/3"] = 182,
    ["Items/30"] = 183,
    ["Items/31"] = 184,
    ["Items/32"] = 185,
    ["Items/33"] = 186,
    ["Items/34"] = 187,
    ["Items/35"] = 188,
    ["Items/36"] = 189,
    ["Items/37"] = 190,
    ["Items/38"] = 191,
    ["Items/39"] = 192,
    ["Items/4"] = 193,
    ["Items/40"] = 194,
    ["Items/41"] = 195,
    ["Items/42"] = 196,
    ["Items/43"] = 197,
    ["Items/44"] = 198,
    ["Items/45"] = 199,
    ["Items/46"] = 200,
    ["Items/47"] = 201,
    ["Items/48"] = 202,
    ["Items/49"] = 203,
    ["Items/5"] = 204,
    ["Items/50"] = 205,
    ["Items/51"] = 206,
    ["Items/52"] = 207,
    ["Items/53"] = 208,
    ["Items/54"] = 209,
    ["Items/55"] = 210,
    ["Items/56"] = 211,
    ["Items/57"] = 212,
    ["Items/58"] = 213,
    ["Items/59"] = 214,
    ["Items/6"] = 215,
    ["Items/60"] = 216,
    ["Items/61"] = 217,
    ["Items/62"] = 218,
    ["Items/63"] = 219,
    ["Items/64"] = 220,
    ["Items/65"] = 221,
    ["Items/66"] = 222,
    ["Items/67"] = 223,
    ["Items/68"] = 224,
    ["Items/69"] = 225,
    ["Items/7"] = 226,
    ["Items/70"] = 227,
    ["Items/71"] = 228,
    ["Items/72"] = 229,
    ["Items/73"] = 230,
    ["Items/74"] = 231,
    ["Items/75"] = 232,
    ["Items/76"] = 233,
    ["Items/77"] = 234,
    ["Items/78"] = 235,
    ["Items/79"] = 236,
    ["Items/8"] = 237,
    ["Items/80"] = 238,
    ["Items/81"] = 239,
    ["Items/82"] = 240,
    ["Items/83"] = 241,
    ["Items/84"] = 242,
    ["Items/85"] = 243,
    ["Items/86"] = 244,
    ["Items/87"] = 245,
    ["Items/88"] = 246,
    ["Items/89"] = 247,
    ["Items/9"] = 248,
    ["Items/90"] = 249,
    ["Items/91"] = 250,
    ["Items/92"] = 251,
    ["Items/93"] = 252,
    ["Items/94"] = 253,
    ["Items/95"] = 254,
    ["Items/96"] = 255,
    ["Items/97"] = 256,
    ["Items/98"] = 257,
    ["Items/99"] = 258,
    ["Lasers/1"] = 259,
    ["Lasers/10"] = 260,
    ["Lasers/11"] = 261,
    ["Lasers/12"] = 262,
    ["Lasers/13"] = 263,
    ["Lasers/14"] = 264,
    ["Lasers/15"] = 265,
    ["Lasers/16"] = 266,
    ["Lasers/17"] = 267,
    ["Lasers/18"] = 268,
    ["Lasers/19"] = 269,
    ["Lasers/2"] = 270,
    ["Lasers/20"] = 271,
    ["Lasers/21"] = 272,
    ["Lasers/22"] = 273,
    ["Lasers/23"] = 274,
    ["Lasers/24"] = 275,
    ["Lasers/25"] = 276,
    ["Lasers/26"] = 277,
    ["Lasers/27"] = 278,
    ["Lasers/28"] = 279,
    ["Lasers/29"] = 280,
    ["Lasers/3"] = 281,
    ["Lasers/30"] = 282,
    ["Lasers/31"] = 283,
    ["Lasers/32"] = 284,
    ["Lasers/33"] = 285,
    ["Lasers/34"] = 286,
    ["Lasers/35"] = 287,
    ["Lasers/36"] = 288,
    ["Lasers/37"] = 289,
    ["Lasers/38"] = 290,
    ["Lasers/39"] = 291,
    ["Lasers/4"] = 292,
    ["Lasers/40"] = 293,
    ["Lasers/41"] = 294,
    ["Lasers/42"] = 295,
    ["Lasers/43"] = 296,
    ["Lasers/44"] = 297,
    ["Lasers/45"] = 298,
    ["Lasers/46"] = 299,
    ["Lasers/47"] = 300,
    ["Lasers/48"] = 301,
    ["Lasers/5"] = 302,
    ["Lasers/6"] = 303,
    ["Lasers/7"] = 304,
    ["Lasers/8"] = 305,
    ["Lasers/9"] = 306,
    ["Lasers/Beam/1"] = 307,
    ["Lasers/Beam/2"] = 308,
    ["Lasers/Beam/3"] = 309,
    ["Lasers/Beam/4"] = 310,
    ["Lasers/Beam/5"] = 311,
    ["Lasers/Burst/1"] = 312,
    ["Lasers/Burst/2"] = 313,
    ["Lasers/Burst/3"] = 314,
    ["Lasers/Burst/4 Copy"] = 315,
    ["Lasers/Burst/4"] = 316,
    ["Lasers/Burst/5"] = 317,
    ["Lasers/GroundBurst/1"] = 318,
    ["Lasers/GroundBurst/2"] = 319,
    ["Lasers/GroundBurst/3"] = 320,
    ["Lasers/GroundBurst/4"] = 321,
    ["Lasers/GroundBurst/5"] = 322,
    ["Lasers/Rings/1"] = 323,
    ["Lasers/Rings/2"] = 324,
    ["Lasers/Rings/3"] = 325,
    ["Lasers/Rings/4"] = 326,
    ["Lasers/Rings/5"] = 327,
    ["Logo"] = 328,
    ["Meteors/Big/1"] = 329,
    ["Meteors/Big/2"] = 330,
    ["Meteors/Big/3"] = 331,
    ["Meteors/Big/4"] = 332,
    ["Meteors/Big/5"] = 333,
    ["Meteors/Big/6"] = 334,
    ["Meteors/Big/7"] = 335,
    ["Meteors/Big/8"] = 336,
    ["Meteors/Huge/1"] = 337,
    ["Meteors/Huge/2"] = 338,
    ["Meteors/Huge/3"] = 339,
    ["Meteors/Huge/4"] = 340,
    ["Meteors/Med/1"] = 341,
    ["Meteors/Med/2"] = 342,
    ["Meteors/Med/3"] = 343,
    ["Meteors/Med/4"] = 344,
    ["Meteors/Small/1"] = 345,
    ["Meteors/Small/2"] = 346,
    ["Meteors/Small/3"] = 347,
    ["Meteors/Small/4"] = 348,
    ["Meteors/Tiny/1"] = 349,
    ["Meteors/Tiny/2"] = 350,
    ["Meteors/Tiny/3"] = 351,
    ["Meteors/Tiny/4"] = 352,
    ["Missiles/1"] = 353,
    ["Missiles/10"] = 354,
    ["Missiles/11"] = 355,
    ["Missiles/12"] = 356,
    ["Missiles/13"] = 357,
    ["Missiles/14"] = 358,
    ["Missiles/15"] = 359,
    ["Missiles/16"] = 360,
    ["Missiles/17"] = 361,
    ["Missiles/18"] = 362,
    ["Missiles/19"] = 363,
    ["Missiles/2"] = 364,
    ["Missiles/20"] = 365,
    ["Missiles/21"] = 366,
    ["Missiles/22"] = 367,
    ["Missiles/23"] = 368,
    ["Missiles/24"] = 369,
    ["Missiles/25"] = 370,
    ["Missiles/26"] = 371,
    ["Missiles/27"] = 372,
    ["Missiles/28"] = 373,
    ["Missiles/29"] = 374,
    ["Missiles/3"] = 375,
    ["Missiles/30"] = 376,
    ["Missiles/31"] = 377,
    ["Missiles/32"] = 378,
    ["Missiles/33"] = 379,
    ["Missiles/34"] = 380,
    ["Missiles/35"] = 381,
    ["Missiles/36"] = 382,
    ["Missiles/37"] = 383,
    ["Missiles/38"] = 384,
    ["Missiles/39"] = 385,
    ["Missiles/4"] = 386,
    ["Missiles/40"] = 387,
    ["Missiles/5"] = 388,
    ["Missiles/6"] = 389,
    ["Missiles/7"] = 390,
    ["Missiles/8"] = 391,
    ["Missiles/9"] = 392,
    ["Particles/1"] = 393,
    ["Particles/10"] = 394,
    ["Particles/11"] = 395,
    ["Particles/12"] = 396,
    ["Particles/13"] = 397,
    ["Particles/14"] = 398,
    ["Particles/15"] = 399,
    ["Particles/16"] = 400,
    ["Particles/17"] = 401,
    ["Particles/18"] = 402,
    ["Particles/19"] = 403,
    ["Particles/2"] = 404,
    ["Particles/20"] = 405,
    ["Particles/21"] = 406,
    ["Particles/3"] = 407,
    ["Particles/4"] = 408,
    ["Particles/5"] = 409,
    ["Particles/6"] = 410,
    ["Particles/7"] = 411,
    ["Particles/8"] = 412,
    ["Particles/9"] = 413,
    ["Planet/1"] = 414,
    ["Planet/2"] = 415,
    ["Planet/3"] = 416,
    ["Planet/4"] = 417,
    ["Planet/5"] = 418,
    ["Planet/6"] = 419,
    ["Planet/7"] = 420,
    ["Planet/8"] = 421,
    ["Planet/9"] = 422,
    ["Power-ups/Bolt/1"] = 423,
    ["Power-ups/Bolt/2"] = 424,
    ["Power-ups/Bolt/3"] = 425,
    ["Power-ups/Bolt/4"] = 426,
    ["Power-ups/Bolt/5"] = 427,
    ["Power-ups/Bolt/6"] = 428,
    ["Power-ups/Bolt/7"] = 429,
    ["Power-ups/None/1"] = 430,
    ["Power-ups/None/2"] = 431,
    ["Power-ups/None/3"] = 432,
    ["Power-ups/None/4"] = 433,
    ["Power-ups/Pills/1"] = 434,
    ["Power-ups/Pills/2"] = 435,
    ["Power-ups/Pills/3"] = 436,
    ["Power-ups/Pills/4"] = 437,
    ["Power-ups/Shield/2"] = 438,
    ["Power-ups/Shield/3"] = 439,
    ["Power-ups/Shield/4"] = 440,
    ["Power-ups/Shield/5"] = 441,
    ["Power-ups/Shield/6"] = 442,
    ["Power-ups/Shield/7"] = 443,
    ["Power-ups/Shiled/1"] = 444,
    ["Power-ups/Star/1"] = 445,
    ["Power-ups/Star/2"] = 446,
    ["Power-ups/Star/3"] = 447,
    ["Power-ups/Star/4"] = 448,
    ["Power-ups/Star/5"] = 449,
    ["Power-ups/Star/6"] = 450,
    ["Power-ups/Star/7"] = 451,
    ["Power-ups/Things/1"] = 452,
    ["Power-ups/Things/2"] = 453,
    ["Power-ups/Things/3"] = 454,
    ["Rockets/Parts/1"] = 455,
    ["Rockets/Parts/10"] = 456,
    ["Rockets/Parts/11"] = 457,
    ["Rockets/Parts/12"] = 458,
    ["Rockets/Parts/13"] = 459,
    ["Rockets/Parts/14"] = 460,
    ["Rockets/Parts/15"] = 461,
    ["Rockets/Parts/16"] = 462,
    ["Rockets/Parts/17"] = 463,
    ["Rockets/Parts/18"] = 464,
    ["Rockets/Parts/19"] = 465,
    ["Rockets/Parts/2"] = 466,
    ["Rockets/Parts/20"] = 467,
    ["Rockets/Parts/21"] = 468,
    ["Rockets/Parts/22"] = 469,
    ["Rockets/Parts/23"] = 470,
    ["Rockets/Parts/24"] = 471,
    ["Rockets/Parts/25"] = 472,
    ["Rockets/Parts/26"] = 473,
    ["Rockets/Parts/27"] = 474,
    ["Rockets/Parts/28"] = 475,
    ["Rockets/Parts/29"] = 476,
    ["Rockets/Parts/3"] = 477,
    ["Rockets/Parts/30"] = 478,
    ["Rockets/Parts/31"] = 479,
    ["Rockets/Parts/4"] = 480,
    ["Rockets/Parts/5"] = 481,
    ["Rockets/Parts/6"] = 482,
    ["Rockets/Parts/7"] = 483,
    ["Rockets/Parts/8"] = 484,
    ["Rockets/Parts/9"] = 485,
    ["Rockets/SpaceRockets/1"] = 486,
    ["Rockets/SpaceRockets/2"] = 487,
    ["Rockets/SpaceRockets/3 Copy"] = 488,
    ["Rockets/SpaceRockets/3"] = 489,
    ["Rockets/SpaceRockets/4"] = 490,
    ["Ruby/1"] = 491,
    ["Ruby/2"] = 492,
    ["Ruby/3"] = 493,
    ["Ruby/4"] = 494,
    ["Ships/1"] = 495,
    ["Ships/10"] = 496,
    ["Ships/11"] = 497,
    ["Ships/12"] = 498,
    ["Ships/13"] = 499,
    ["Ships/14"] = 500,
    ["Ships/15"] = 501,
    ["Ships/16"] = 502,
    ["Ships/17"] = 503,
    ["Ships/18"] = 504,
    ["Ships/19"] = 505,
    ["Ships/2"] = 506,
    ["Ships/20"] = 507,
    ["Ships/21"] = 508,
    ["Ships/22"] = 509,
    ["Ships/23"] = 510,
    ["Ships/24"] = 511,
    ["Ships/25"] = 512,
    ["Ships/26"] = 513,
    ["Ships/27"] = 514,
    ["Ships/28"] = 515,
    ["Ships/29"] = 516,
    ["Ships/3"] = 517,
    ["Ships/30"] = 518,
    ["Ships/31"] = 519,
    ["Ships/32"] = 520,
    ["Ships/33"] = 521,
    ["Ships/34"] = 522,
    ["Ships/35"] = 523,
    ["Ships/36"] = 524,
    ["Ships/37"] = 525,
    ["Ships/38"] = 526,
    ["Ships/39"] = 527,
    ["Ships/4"] = 528,
    ["Ships/40"] = 529,
    ["Ships/41"] = 530,
    ["Ships/5"] = 531,
    ["Ships/6"] = 532,
    ["Ships/7"] = 533,
    ["Ships/8"] = 534,
    ["Ships/9"] = 535,
    ["Ships/Damages/1"] = 536,
    ["Ships/Damages/2"] = 537,
    ["Ships/Damages/3"] = 538,
    ["Ships/Damages/4"] = 539,
    ["Ships/Damages/5"] = 540,
    ["Ships/Damages/6"] = 541,
    ["Ships/Damages/7"] = 542,
    ["Ships/Damages/8"] = 543,
    ["Ships/Damages/9"] = 544,
    ["Ships/Parts/Beams/1"] = 545,
    ["Ships/Parts/Beams/10"] = 546,
    ["Ships/Parts/Beams/11"] = 547,
    ["Ships/Parts/Beams/12"] = 548,
    ["Ships/Parts/Beams/13"] = 549,
    ["Ships/Parts/Beams/14"] = 550,
    ["Ships/Parts/Beams/2"] = 551,
    ["Ships/Parts/Beams/3"] = 552,
    ["Ships/Parts/Beams/4"] = 553,
    ["Ships/Parts/Beams/5"] = 554,
    ["Ships/Parts/Beams/6"] = 555,
    ["Ships/Parts/Beams/7"] = 556,
    ["Ships/Parts/Beams/8"] = 557,
    ["Ships/Parts/Beams/9"] = 558,
    ["Ships/Parts/Cockpits/1"] = 559,
    ["Ships/Parts/Cockpits/10"] = 560,
    ["Ships/Parts/Cockpits/11"] = 561,
    ["Ships/Parts/Cockpits/12"] = 562,
    ["Ships/Parts/Cockpits/13"] = 563,
    ["Ships/Parts/Cockpits/14"] = 564,
    ["Ships/Parts/Cockpits/15"] = 565,
    ["Ships/Parts/Cockpits/16"] = 566,
    ["Ships/Parts/Cockpits/17"] = 567,
    ["Ships/Parts/Cockpits/18"] = 568,
    ["Ships/Parts/Cockpits/19"] = 569,
    ["Ships/Parts/Cockpits/2"] = 570,
    ["Ships/Parts/Cockpits/20"] = 571,
    ["Ships/Parts/Cockpits/21"] = 572,
    ["Ships/Parts/Cockpits/22"] = 573,
    ["Ships/Parts/Cockpits/23"] = 574,
    ["Ships/Parts/Cockpits/24"] = 575,
    ["Ships/Parts/Cockpits/25"] = 576,
    ["Ships/Parts/Cockpits/26"] = 577,
    ["Ships/Parts/Cockpits/27"] = 578,
    ["Ships/Parts/Cockpits/28"] = 579,
    ["Ships/Parts/Cockpits/29"] = 580,
    ["Ships/Parts/Cockpits/3"] = 581,
    ["Ships/Parts/Cockpits/30"] = 582,
    ["Ships/Parts/Cockpits/31"] = 583,
    ["Ships/Parts/Cockpits/32"] = 584,
    ["Ships/Parts/Cockpits/4"] = 585,
    ["Ships/Parts/Cockpits/5"] = 586,
    ["Ships/Parts/Cockpits/6"] = 587,
    ["Ships/Parts/Cockpits/7"] = 588,
    ["Ships/Parts/Cockpits/8"] = 589,
    ["Ships/Parts/Cockpits/9"] = 590,
    ["Ships/Parts/Cockpits/Bases/1"] = 591,
    ["Ships/Parts/Cockpits/Bases/10"] = 592,
    ["Ships/Parts/Cockpits/Bases/11"] = 593,
    ["Ships/Parts/Cockpits/Bases/12"] = 594,
    ["Ships/Parts/Cockpits/Bases/13"] = 595,
    ["Ships/Parts/Cockpits/Bases/14"] = 596,
    ["Ships/Parts/Cockpits/Bases/15"] = 597,
    ["Ships/Parts/Cockpits/Bases/16"] = 598,
    ["Ships/Parts/Cockpits/Bases/17"] = 599,
    ["Ships/Parts/Cockpits/Bases/18"] = 600,
    ["Ships/Parts/Cockpits/Bases/2"] = 601,
    ["Ships/Parts/Cockpits/Bases/3"] = 602,
    ["Ships/Parts/Cockpits/Bases/4"] = 603,
    ["Ships/Parts/Cockpits/Bases/5"] = 604,
    ["Ships/Parts/Cockpits/Bases/6"] = 605,
    ["Ships/Parts/Cockpits/Bases/7"] = 606,
    ["Ships/Parts/Cockpits/Bases/8"] = 607,
    ["Ships/Parts/Cockpits/Bases/9"] = 608,
    ["Ships/Parts/Cockpits/Glass/1"] = 609,
    ["Ships/Parts/Cockpits/Glass/10"] = 610,
    ["Ships/Parts/Cockpits/Glass/11"] = 611,
    ["Ships/Parts/Cockpits/Glass/12"] = 612,
    ["Ships/Parts/Cockpits/Glass/13"] = 613,
    ["Ships/Parts/Cockpits/Glass/14"] = 614,
    ["Ships/Parts/Cockpits/Glass/15"] = 615,
    ["Ships/Parts/Cockpits/Glass/16"] = 616,
    ["Ships/Parts/Cockpits/Glass/17"] = 617,
    ["Ships/Parts/Cockpits/Glass/18"] = 618,
    ["Ships/Parts/Cockpits/Glass/19"] = 619,
    ["Ships/Parts/Cockpits/Glass/2"] = 620,
    ["Ships/Parts/Cockpits/Glass/20"] = 621,
    ["Ships/Parts/Cockpits/Glass/21"] = 622,
    ["Ships/Parts/Cockpits/Glass/22"] = 623,
    ["Ships/Parts/Cockpits/Glass/23"] = 624,
    ["Ships/Parts/Cockpits/Glass/24"] = 625,
    ["Ships/Parts/Cockpits/Glass/25"] = 626,
    ["Ships/Parts/Cockpits/Glass/26"] = 627,
    ["Ships/Parts/Cockpits/Glass/3"] = 628,
    ["Ships/Parts/Cockpits/Glass/4"] = 629,
    ["Ships/Parts/Cockpits/Glass/5"] = 630,
    ["Ships/Parts/Cockpits/Glass/6"] = 631,
    ["Ships/Parts/Cockpits/Glass/7"] = 632,
    ["Ships/Parts/Cockpits/Glass/8"] = 633,
    ["Ships/Parts/Cockpits/Glass/9"] = 634,
    ["Ships/Parts/Engines/1"] = 635,
    ["Ships/Parts/Engines/2"] = 636,
    ["Ships/Parts/Engines/3"] = 637,
    ["Ships/Parts/Engines/4"] = 638,
    ["Ships/Parts/Engines/5"] = 639,
    ["Ships/Parts/Engines/6"] = 640,
    ["Ships/Parts/Engines/7"] = 641,
    ["Ships/Parts/Engines/8"] = 642,
    ["Ships/Parts/Engines/9"] = 643,
    ["Ships/Parts/Guns/1"] = 644,
    ["Ships/Parts/Guns/10"] = 645,
    ["Ships/Parts/Guns/11"] = 646,
    ["Ships/Parts/Guns/12"] = 647,
    ["Ships/Parts/Guns/13"] = 648,
    ["Ships/Parts/Guns/14"] = 649,
    ["Ships/Parts/Guns/15"] = 650,
    ["Ships/Parts/Guns/2"] = 651,
    ["Ships/Parts/Guns/3"] = 652,
    ["Ships/Parts/Guns/4"] = 653,
    ["Ships/Parts/Guns/5"] = 654,
    ["Ships/Parts/Guns/6"] = 655,
    ["Ships/Parts/Guns/7"] = 656,
    ["Ships/Parts/Guns/8"] = 657,
    ["Ships/Parts/Guns/9"] = 658,
    ["Ships/Parts/Others/1"] = 659,
    ["Ships/Parts/Others/2"] = 660,
    ["Ships/Parts/Others/3"] = 661,
    ["Ships/Parts/Others/4"] = 662,
    ["Ships/Parts/Others/5"] = 663,
    ["Ships/Parts/Scratches/1"] = 664,
    ["Ships/Parts/Scratches/2"] = 665,
    ["Ships/Parts/Wings/1"] = 666,
    ["Ships/Parts/Wings/10"] = 667,
    ["Ships/Parts/Wings/11"] = 668,
    ["Ships/Parts/Wings/12"] = 669,
    ["Ships/Parts/Wings/13"] = 670,
    ["Ships/Parts/Wings/14"] = 671,
    ["Ships/Parts/Wings/15"] = 672,
    ["Ships/Parts/Wings/16"] = 673,
    ["Ships/Parts/Wings/17"] = 674,
    ["Ships/Parts/Wings/18"] = 675,
    ["Ships/Parts/Wings/19"] = 676,
    ["Ships/Parts/Wings/2"] = 677,
    ["Ships/Parts/Wings/20"] = 678,
    ["Ships/Parts/Wings/21"] = 679,
    ["Ships/Parts/Wings/22"] = 680,
    ["Ships/Parts/Wings/23"] = 681,
    ["Ships/Parts/Wings/24"] = 682,
    ["Ships/Parts/Wings/25"] = 683,
    ["Ships/Parts/Wings/26"] = 684,
    ["Ships/Parts/Wings/27"] = 685,
    ["Ships/Parts/Wings/28"] = 686,
    ["Ships/Parts/Wings/29"] = 687,
    ["Ships/Parts/Wings/3"] = 688,
    ["Ships/Parts/Wings/30"] = 689,
    ["Ships/Parts/Wings/31"] = 690,
    ["Ships/Parts/Wings/32"] = 691,
    ["Ships/Parts/Wings/33"] = 692,
    ["Ships/Parts/Wings/34"] = 693,
    ["Ships/Parts/Wings/35"] = 694,
    ["Ships/Parts/Wings/36"] = 695,
    ["Ships/Parts/Wings/37"] = 696,
    ["Ships/Parts/Wings/38"] = 697,
    ["Ships/Parts/Wings/39"] = 698,
    ["Ships/Parts/Wings/4"] = 699,
    ["Ships/Parts/Wings/40"] = 700,
    ["Ships/Parts/Wings/41"] = 701,
    ["Ships/Parts/Wings/42"] = 702,
    ["Ships/Parts/Wings/43"] = 703,
    ["Ships/Parts/Wings/44"] = 704,
    ["Ships/Parts/Wings/45"] = 705,
    ["Ships/Parts/Wings/46"] = 706,
    ["Ships/Parts/Wings/47"] = 707,
    ["Ships/Parts/Wings/48"] = 708,
    ["Ships/Parts/Wings/49"] = 709,
    ["Ships/Parts/Wings/5"] = 710,
    ["Ships/Parts/Wings/50"] = 711,
    ["Ships/Parts/Wings/51"] = 712,
    ["Ships/Parts/Wings/52"] = 713,
    ["Ships/Parts/Wings/53"] = 714,
    ["Ships/Parts/Wings/54"] = 715,
    ["Ships/Parts/Wings/55"] = 716,
    ["Ships/Parts/Wings/56"] = 717,
    ["Ships/Parts/Wings/57"] = 718,
    ["Ships/Parts/Wings/58"] = 719,
    ["Ships/Parts/Wings/59"] = 720,
    ["Ships/Parts/Wings/6"] = 721,
    ["Ships/Parts/Wings/60"] = 722,
    ["Ships/Parts/Wings/61"] = 723,
    ["Ships/Parts/Wings/62"] = 724,
    ["Ships/Parts/Wings/63"] = 725,
    ["Ships/Parts/Wings/64"] = 726,
    ["Ships/Parts/Wings/65"] = 727,
    ["Ships/Parts/Wings/66"] = 728,
    ["Ships/Parts/Wings/67"] = 729,
    ["Ships/Parts/Wings/68"] = 730,
    ["Ships/Parts/Wings/7"] = 731,
    ["Ships/Parts/Wings/8"] = 732,
    ["Ships/Parts/Wings/9"] = 733,
    ["Stations/1"] = 734,
    ["Stations/10"] = 735,
    ["Stations/11"] = 736,
    ["Stations/2"] = 737,
    ["Stations/3"] = 738,
    ["Stations/4"] = 739,
    ["Stations/5"] = 740,
    ["Stations/6"] = 741,
    ["Stations/7"] = 742,
    ["Stations/8"] = 743,
    ["Stations/9"] = 744,
    ["Stations/Parts/1"] = 745,
    ["Stations/Parts/10"] = 746,
    ["Stations/Parts/11"] = 747,
    ["Stations/Parts/12"] = 748,
    ["Stations/Parts/13"] = 749,
    ["Stations/Parts/14"] = 750,
    ["Stations/Parts/15"] = 751,
    ["Stations/Parts/16"] = 752,
    ["Stations/Parts/17"] = 753,
    ["Stations/Parts/18"] = 754,
    ["Stations/Parts/19"] = 755,
    ["Stations/Parts/2"] = 756,
    ["Stations/Parts/20"] = 757,
    ["Stations/Parts/21"] = 758,
    ["Stations/Parts/22"] = 759,
    ["Stations/Parts/23"] = 760,
    ["Stations/Parts/24"] = 761,
    ["Stations/Parts/3"] = 762,
    ["Stations/Parts/4"] = 763,
    ["Stations/Parts/5"] = 764,
    ["Stations/Parts/6"] = 765,
    ["Stations/Parts/7"] = 766,
    ["Stations/Parts/8"] = 767,
    ["Stations/Parts/9"] = 768,
    ["Turrets/1"] = 769,
    ["Turrets/2"] = 770,
    ["Turrets/3"] = 771,
    ["Turrets/Parts/Bases/1"] = 772,
    ["Turrets/Parts/Bases/2"] = 773,
    ["Turrets/Parts/Bases/3"] = 774,
    ["Turrets/Parts/Bases/4"] = 775,
    ["Turrets/Parts/Cannos/1"] = 776,
    ["Turrets/Parts/Cannos/2"] = 777,
    ["Turrets/Parts/Cannos/3"] = 778,
    ["UFOs/1"] = 779,
    ["UFOs/2"] = 780,
    ["UFOs/3"] = 781,
    ["UFOs/4"] = 782,
    ["UI/Bar-corners/1/3-slices/1"] = 783,
    ["UI/Bar-corners/1/3-slices/2"] = 784,
    ["UI/Bar-corners/1/3-slices/3"] = 785,
    ["UI/Bar-corners/2/3-slices/1"] = 786,
    ["UI/Bar-corners/2/3-slices/2"] = 787,
    ["UI/Bar-corners/2/3-slices/3"] = 788,
    ["UI/Bar-corners/3/3-slices/1"] = 789,
    ["UI/Bar-corners/3/3-slices/2"] = 790,
    ["UI/Bar-corners/3/3-slices/3"] = 791,
    ["UI/Bar-corners/4/3-slices/1"] = 792,
    ["UI/Bar-corners/4/3-slices/2"] = 793,
    ["UI/Bar-corners/4/3-slices/3"] = 794,
    ["UI/Bars/1/9-slices/1"] = 795,
    ["UI/Bars/1/9-slices/2"] = 796,
    ["UI/Bars/1/9-slices/3"] = 797,
    ["UI/Bars/1/9-slices/4"] = 798,
    ["UI/Bars/1/9-slices/5"] = 799,
    ["UI/Bars/1/9-slices/6"] = 800,
    ["UI/Bars/1/9-slices/7"] = 801,
    ["UI/Bars/1/9-slices/8"] = 802,
    ["UI/Bars/1/9-slices/9"] = 803,
    ["UI/Bars/2/9-slices/1"] = 804,
    ["UI/Bars/2/9-slices/2"] = 805,
    ["UI/Bars/2/9-slices/3"] = 806,
    ["UI/Bars/2/9-slices/4"] = 807,
    ["UI/Bars/2/9-slices/5"] = 808,
    ["UI/Bars/2/9-slices/6"] = 809,
    ["UI/Bars/2/9-slices/7"] = 810,
    ["UI/Bars/2/9-slices/8"] = 811,
    ["UI/Bars/2/9-slices/9"] = 812,
    ["UI/Bars/3/9-slices/1"] = 813,
    ["UI/Bars/3/9-slices/2"] = 814,
    ["UI/Bars/3/9-slices/3"] = 815,
    ["UI/Bars/3/9-slices/4"] = 816,
    ["UI/Bars/3/9-slices/5"] = 817,
    ["UI/Bars/3/9-slices/6"] = 818,
    ["UI/Bars/3/9-slices/7"] = 819,
    ["UI/Bars/3/9-slices/8"] = 820,
    ["UI/Bars/3/9-slices/9"] = 821,
    ["UI/Bars/4/9-slices/1"] = 822,
    ["UI/Bars/4/9-slices/2"] = 823,
    ["UI/Bars/4/9-slices/3"] = 824,
    ["UI/Bars/4/9-slices/4"] = 825,
    ["UI/Bars/4/9-slices/5"] = 826,
    ["UI/Bars/4/9-slices/6"] = 827,
    ["UI/Bars/4/9-slices/7"] = 828,
    ["UI/Bars/4/9-slices/8"] = 829,
    ["UI/Bars/4/9-slices/9"] = 830,
    ["UI/Buttons/1/9-slices/1"] = 831,
    ["UI/Buttons/1/9-slices/2"] = 832,
    ["UI/Buttons/1/9-slices/3"] = 833,
    ["UI/Buttons/1/9-slices/4"] = 834,
    ["UI/Buttons/1/9-slices/5"] = 835,
    ["UI/Buttons/1/9-slices/6"] = 836,
    ["UI/Buttons/1/9-slices/7"] = 837,
    ["UI/Buttons/1/9-slices/8"] = 838,
    ["UI/Buttons/1/9-slices/9"] = 839,
    ["UI/Buttons/2/9-slices/1"] = 840,
    ["UI/Buttons/2/9-slices/2"] = 841,
    ["UI/Buttons/2/9-slices/3"] = 842,
    ["UI/Buttons/2/9-slices/4"] = 843,
    ["UI/Buttons/2/9-slices/5"] = 844,
    ["UI/Buttons/2/9-slices/6"] = 845,
    ["UI/Buttons/2/9-slices/7"] = 846,
    ["UI/Buttons/2/9-slices/8"] = 847,
    ["UI/Buttons/2/9-slices/9"] = 848,
    ["UI/Buttons/3/9-slices/1"] = 849,
    ["UI/Buttons/3/9-slices/2"] = 850,
    ["UI/Buttons/3/9-slices/3"] = 851,
    ["UI/Buttons/3/9-slices/4"] = 852,
    ["UI/Buttons/3/9-slices/5"] = 853,
    ["UI/Buttons/3/9-slices/6"] = 854,
    ["UI/Buttons/3/9-slices/7"] = 855,
    ["UI/Buttons/3/9-slices/8"] = 856,
    ["UI/Buttons/3/9-slices/9"] = 857,
    ["UI/Buttons/4/9-slices/1"] = 858,
    ["UI/Buttons/4/9-slices/2"] = 859,
    ["UI/Buttons/4/9-slices/3"] = 860,
    ["UI/Buttons/4/9-slices/4"] = 861,
    ["UI/Buttons/4/9-slices/5"] = 862,
    ["UI/Buttons/4/9-slices/6"] = 863,
    ["UI/Buttons/4/9-slices/7"] = 864,
    ["UI/Buttons/4/9-slices/8"] = 865,
    ["UI/Buttons/4/9-slices/9"] = 866,
    ["UI/Crossairs/1"] = 867,
    ["UI/Crossairs/2"] = 868,
    ["UI/Crossairs/3"] = 869,
    ["UI/Crossairs/4"] = 870,
    ["UI/Crossairs/5"] = 871,
    ["UI/Crossairs/6"] = 872,
    ["UI/Crossairs/7"] = 873,
    ["UI/Crossairs/8"] = 874,
    ["UI/Cursors/1"] = 875,
    ["UI/Cursors/2"] = 876,
    ["UI/Cursors/3"] = 877,
    ["UI/Cursors/4"] = 878,
    ["UI/Cursors/5"] = 879,
    ["UI/Cursors/6"] = 880,
    ["UI/Dots/1"] = 881,
    ["UI/Dots/2"] = 882,
    ["UI/Dots/3"] = 883,
    ["UI/Dots/4"] = 884,
    ["UI/Dots/5"] = 885,
    ["UI/Dots/6"] = 886,
    ["UI/GlassPanel-cornerBL/9-slices/1"] = 887,
    ["UI/GlassPanel-cornerBL/9-slices/2"] = 888,
    ["UI/GlassPanel-cornerBL/9-slices/3"] = 889,
    ["UI/GlassPanel-cornerBL/9-slices/4"] = 890,
    ["UI/GlassPanel-cornerBL/9-slices/5"] = 891,
    ["UI/GlassPanel-cornerBL/9-slices/6"] = 892,
    ["UI/GlassPanel-cornerBL/9-slices/7"] = 893,
    ["UI/GlassPanel-cornerBL/9-slices/8"] = 894,
    ["UI/GlassPanel-cornerBL/9-slices/9"] = 895,
    ["UI/GlassPanel-cornerBR/9-slices/1"] = 896,
    ["UI/GlassPanel-cornerBR/9-slices/2"] = 897,
    ["UI/GlassPanel-cornerBR/9-slices/3"] = 898,
    ["UI/GlassPanel-cornerBR/9-slices/4"] = 899,
    ["UI/GlassPanel-cornerBR/9-slices/5"] = 900,
    ["UI/GlassPanel-cornerBR/9-slices/6"] = 901,
    ["UI/GlassPanel-cornerBR/9-slices/7"] = 902,
    ["UI/GlassPanel-cornerBR/9-slices/8"] = 903,
    ["UI/GlassPanel-cornerBR/9-slices/9"] = 904,
    ["UI/GlassPanel-cornerTL/9-slices/1"] = 905,
    ["UI/GlassPanel-cornerTL/9-slices/2"] = 906,
    ["UI/GlassPanel-cornerTL/9-slices/3"] = 907,
    ["UI/GlassPanel-cornerTL/9-slices/4"] = 908,
    ["UI/GlassPanel-cornerTL/9-slices/5"] = 909,
    ["UI/GlassPanel-cornerTL/9-slices/6"] = 910,
    ["UI/GlassPanel-cornerTL/9-slices/7"] = 911,
    ["UI/GlassPanel-cornerTL/9-slices/8"] = 912,
    ["UI/GlassPanel-cornerTL/9-slices/9"] = 913,
    ["UI/GlassPanel-cornerTR/9-slices/1"] = 914,
    ["UI/GlassPanel-cornerTR/9-slices/2"] = 915,
    ["UI/GlassPanel-cornerTR/9-slices/3"] = 916,
    ["UI/GlassPanel-cornerTR/9-slices/4"] = 917,
    ["UI/GlassPanel-cornerTR/9-slices/5"] = 918,
    ["UI/GlassPanel-cornerTR/9-slices/6"] = 919,
    ["UI/GlassPanel-cornerTR/9-slices/7"] = 920,
    ["UI/GlassPanel-cornerTR/9-slices/8"] = 921,
    ["UI/GlassPanel-cornerTR/9-slices/9"] = 922,
    ["UI/GlassPanel-corners/9-slices/1"] = 923,
    ["UI/GlassPanel-corners/9-slices/2"] = 924,
    ["UI/GlassPanel-corners/9-slices/3"] = 925,
    ["UI/GlassPanel-corners/9-slices/4"] = 926,
    ["UI/GlassPanel-corners/9-slices/5"] = 927,
    ["UI/GlassPanel-corners/9-slices/6"] = 928,
    ["UI/GlassPanel-corners/9-slices/7"] = 929,
    ["UI/GlassPanel-corners/9-slices/8"] = 930,
    ["UI/GlassPanel-corners/9-slices/9"] = 931,
    ["UI/GlassPanel-empty/9-slices/1"] = 932,
    ["UI/GlassPanel-empty/9-slices/2"] = 933,
    ["UI/GlassPanel-empty/9-slices/3"] = 934,
    ["UI/GlassPanel-empty/9-slices/4"] = 935,
    ["UI/GlassPanel-empty/9-slices/5"] = 936,
    ["UI/GlassPanel-empty/9-slices/6"] = 937,
    ["UI/GlassPanel-empty/9-slices/7"] = 938,
    ["UI/GlassPanel-empty/9-slices/8"] = 939,
    ["UI/GlassPanel-empty/9-slices/9"] = 940,
    ["UI/GlassPanel-projection/9-slices/1"] = 941,
    ["UI/GlassPanel-projection/9-slices/2"] = 942,
    ["UI/GlassPanel-projection/9-slices/3"] = 943,
    ["UI/GlassPanel-projection/9-slices/4"] = 944,
    ["UI/GlassPanel-projection/9-slices/5"] = 945,
    ["UI/GlassPanel-projection/9-slices/6"] = 946,
    ["UI/GlassPanel-projection/9-slices/7"] = 947,
    ["UI/GlassPanel-projection/9-slices/8"] = 948,
    ["UI/GlassPanel-projection/9-slices/9"] = 949,
    ["UI/GlassPanel/9-slices/1"] = 950,
    ["UI/GlassPanel/9-slices/2"] = 951,
    ["UI/GlassPanel/9-slices/3"] = 952,
    ["UI/GlassPanel/9-slices/4"] = 953,
    ["UI/GlassPanel/9-slices/5"] = 954,
    ["UI/GlassPanel/9-slices/6"] = 955,
    ["UI/GlassPanel/9-slices/7"] = 956,
    ["UI/GlassPanel/9-slices/8"] = 957,
    ["UI/GlassPanel/9-slices/9"] = 958,
    ["UI/Icons/1"] = 959,
    ["UI/Icons/ChampionCup"] = 960,
    ["UI/Icons/JoyStickRight"] = 961,
    ["UI/Icons/ThreePlayers"] = 962,
    ["UI/Icons/TriangleRight"] = 963,
    ["UI/Icons/enter"] = 964,
    ["UI/Icons/leaderBoard"] = 965,
    ["UI/Icons/oneUser"] = 966,
    ["UI/Icons/pause"] = 967,
    ["UI/Icons/rotate"] = 968,
    ["UI/KeyPanel/9-slices/1"] = 969,
    ["UI/KeyPanel/9-slices/2"] = 970,
    ["UI/KeyPanel/9-slices/3"] = 971,
    ["UI/KeyPanel/9-slices/4"] = 972,
    ["UI/KeyPanel/9-slices/5"] = 973,
    ["UI/KeyPanel/9-slices/6"] = 974,
    ["UI/KeyPanel/9-slices/7"] = 975,
    ["UI/KeyPanel/9-slices/8"] = 976,
    ["UI/KeyPanel/9-slices/9"] = 977,
    ["UI/MetalBottomPanel/9-slices/1"] = 978,
    ["UI/MetalBottomPanel/9-slices/2"] = 979,
    ["UI/MetalBottomPanel/9-slices/3"] = 980,
    ["UI/MetalBottomPanel/9-slices/4"] = 981,
    ["UI/MetalBottomPanel/9-slices/5"] = 982,
    ["UI/MetalBottomPanel/9-slices/6"] = 983,
    ["UI/MetalBottomPanel/9-slices/7"] = 984,
    ["UI/MetalBottomPanel/9-slices/8"] = 985,
    ["UI/MetalBottomPanel/9-slices/9"] = 986,
    ["UI/MetalPanel-plate/9-slices/1"] = 987,
    ["UI/MetalPanel-plate/9-slices/2"] = 988,
    ["UI/MetalPanel-plate/9-slices/3"] = 989,
    ["UI/MetalPanel-plate/9-slices/4"] = 990,
    ["UI/MetalPanel-plate/9-slices/5"] = 991,
    ["UI/MetalPanel-plate/9-slices/6"] = 992,
    ["UI/MetalPanel-plate/9-slices/7"] = 993,
    ["UI/MetalPanel-plate/9-slices/8"] = 994,
    ["UI/MetalPanel-plate/9-slices/9"] = 995,
    ["UI/MetalPanel/9-slices/1"] = 996,
    ["UI/MetalPanel/9-slices/2"] = 997,
    ["UI/MetalPanel/9-slices/3"] = 998,
    ["UI/MetalPanel/9-slices/4"] = 999,
    ["UI/MetalPanel/9-slices/5"] = 1000,
    ["UI/MetalPanel/9-slices/6"] = 1001,
    ["UI/MetalPanel/9-slices/7"] = 1002,
    ["UI/MetalPanel/9-slices/8"] = 1003,
    ["UI/MetalPanel/9-slices/9"] = 1004,
    ["UI/Numeral/0"] = 1005,
    ["UI/Numeral/1"] = 1006,
    ["UI/Numeral/2"] = 1007,
    ["UI/Numeral/3"] = 1008,
    ["UI/Numeral/4"] = 1009,
    ["UI/Numeral/5"] = 1010,
    ["UI/Numeral/6"] = 1011,
    ["UI/Numeral/7"] = 1012,
    ["UI/Numeral/8"] = 1013,
    ["UI/Numeral/9"] = 1014,
    ["UI/Numeral/x"] = 1015,
    ["UI/Parts/glassPanel_tab_1"] = 1016,
    ["UI/Parts/glassPanel_tab_2"] = 1017,
    ["UI/Parts/glassPanel_tab_3"] = 1018,
    ["UI/Parts/glassPanel_tab_4"] = 1019,
    ["UI/Parts/glassPanel_tab_5"] = 1020,
    ["UI/Parts/glassPanel_tab_6"] = 1021,
    ["UI/Parts/glassPanel_tab_7"] = 1022,
    ["UI/Parts/glassPanel_tab_8"] = 1023,
    ["UI/Parts/glassPanel_tab_9"] = 1024,
    ["UI/Parts/glassPanel_tabbar_1"] = 1025,
    ["UI/Parts/glassPanel_tabbar_2"] = 1026,
    ["UI/Parts/glassPanel_tabbar_3"] = 1027,
    ["UI/Player-lifes/1"] = 1028,
    ["UI/Player-lifes/10"] = 1029,
    ["UI/Player-lifes/11"] = 1030,
    ["UI/Player-lifes/12"] = 1031,
    ["UI/Player-lifes/2"] = 1032,
    ["UI/Player-lifes/3"] = 1033,
    ["UI/Player-lifes/4"] = 1034,
    ["UI/Player-lifes/5"] = 1035,
    ["UI/Player-lifes/6"] = 1036,
    ["UI/Player-lifes/7"] = 1037,
    ["UI/Player-lifes/8"] = 1038,
    ["UI/Player-lifes/9"] = 1039,
    ["UI/Squares/1/9-slices/1"] = 1040,
    ["UI/Squares/1/9-slices/2"] = 1041,
    ["UI/Squares/1/9-slices/3"] = 1042,
    ["UI/Squares/1/9-slices/4"] = 1043,
    ["UI/Squares/1/9-slices/5"] = 1044,
    ["UI/Squares/1/9-slices/6"] = 1045,
    ["UI/Squares/1/9-slices/7"] = 1046,
    ["UI/Squares/1/9-slices/8"] = 1047,
    ["UI/Squares/1/9-slices/9"] = 1048,
    ["UI/Squares/2/9-slices/1"] = 1049,
    ["UI/Squares/2/9-slices/2"] = 1050,
    ["UI/Squares/2/9-slices/3"] = 1051,
    ["UI/Squares/2/9-slices/4"] = 1052,
    ["UI/Squares/2/9-slices/5"] = 1053,
    ["UI/Squares/2/9-slices/6"] = 1054,
    ["UI/Squares/2/9-slices/7"] = 1055,
    ["UI/Squares/2/9-slices/8"] = 1056,
    ["UI/Squares/2/9-slices/9"] = 1057,
    ["UI/Squares/3/9-slices/1"] = 1058,
    ["UI/Squares/3/9-slices/2"] = 1059,
    ["UI/Squares/3/9-slices/3"] = 1060,
    ["UI/Squares/3/9-slices/4"] = 1061,
    ["UI/Squares/3/9-slices/5"] = 1062,
    ["UI/Squares/3/9-slices/6"] = 1063,
    ["UI/Squares/3/9-slices/7"] = 1064,
    ["UI/Squares/3/9-slices/8"] = 1065,
    ["UI/Squares/3/9-slices/9"] = 1066,
    ["UI/Squares/4/9-slices/1"] = 1067,
    ["UI/Squares/4/9-slices/2"] = 1068,
    ["UI/Squares/4/9-slices/3"] = 1069,
    ["UI/Squares/4/9-slices/4"] = 1070,
    ["UI/Squares/4/9-slices/5"] = 1071,
    ["UI/Squares/4/9-slices/6"] = 1072,
    ["UI/Squares/4/9-slices/7"] = 1073,
    ["UI/Squares/4/9-slices/8"] = 1074,
    ["UI/Squares/4/9-slices/9"] = 1075,
    ["UI/Squares/5/9-slices/1"] = 1076,
    ["UI/Squares/5/9-slices/2"] = 1077,
    ["UI/Squares/5/9-slices/3"] = 1078,
    ["UI/Squares/5/9-slices/4"] = 1079,
    ["UI/Squares/5/9-slices/5"] = 1080,
    ["UI/Squares/5/9-slices/6"] = 1081,
    ["UI/Squares/5/9-slices/7"] = 1082,
    ["UI/Squares/5/9-slices/8"] = 1083,
    ["UI/Squares/5/9-slices/9"] = 1084,
    ["UI/Squares/6/9-slices/1"] = 1085,
    ["UI/Squares/6/9-slices/2"] = 1086,
    ["UI/Squares/6/9-slices/3"] = 1087,
    ["UI/Squares/6/9-slices/4"] = 1088,
    ["UI/Squares/6/9-slices/5"] = 1089,
    ["UI/Squares/6/9-slices/6"] = 1090,
    ["UI/Squares/6/9-slices/7"] = 1091,
    ["UI/Squares/6/9-slices/8"] = 1092,
    ["UI/Squares/6/9-slices/9"] = 1093,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
