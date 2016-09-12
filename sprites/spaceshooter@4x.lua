--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7f04e9b9bd1549a9cc363ed5eab5bb64:91024e42d7f98c1ccdafb48b2810fc7c:3f36a7288e3c206cad1e6347cb5668ac$
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
            x=3096,
            y=736,
            width=252,
            height=248,

        },
        {
            -- AlienUFOs/Ships/2
            x=2828,
            y=736,
            width=252,
            height=256,

        },
        {
            -- AlienUFOs/Ships/3
            x=2560,
            y=704,
            width=252,
            height=292,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 292
        },
        {
            -- AlienUFOs/Ships/4
            x=3632,
            y=736,
            width=252,
            height=220,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 218
        },
        {
            -- AlienUFOs/Ships/5
            x=3364,
            y=736,
            width=252,
            height=248,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 246
        },
        {
            -- AlienUFOs/Ships/Damages/1
            x=1768,
            y=1636,
            width=252,
            height=136,

        },
        {
            -- AlienUFOs/Ships/Damages/10
            x=5144,
            y=580,
            width=252,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 134
        },
        {
            -- AlienUFOs/Ships/Damages/2
            x=5144,
            y=732,
            width=252,
            height=144,

        },
        {
            -- AlienUFOs/Ships/Damages/3
            x=3640,
            y=1212,
            width=252,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 180
        },
        {
            -- AlienUFOs/Ships/Damages/4
            x=3640,
            y=1408,
            width=252,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 124
        },
        {
            -- AlienUFOs/Ships/Damages/5
            x=4300,
            y=912,
            width=252,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 134
        },
        {
            -- AlienUFOs/Ships/Damages/6
            x=4568,
            y=912,
            width=252,
            height=136,

        },
        {
            -- AlienUFOs/Ships/Damages/7
            x=4836,
            y=920,
            width=252,
            height=144,

        },
        {
            -- AlienUFOs/Ships/Damages/8
            x=4300,
            y=716,
            width=252,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 180
        },
        {
            -- AlienUFOs/Ships/Damages/9
            x=2252,
            y=1508,
            width=252,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 124
        },
        {
            -- AlienUFOs/Ships/Parts/Legs/1
            x=4320,
            y=1712,
            width=152,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 66
        },
        {
            -- AlienUFOs/Ships/Parts/Legs/2
            x=2244,
            y=2216,
            width=144,
            height=92,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/3
            x=4300,
            y=1064,
            width=224,
            height=92,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/4
            x=4320,
            y=1796,
            width=200,
            height=92,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/1
            x=2248,
            y=1648,
            width=252,
            height=136,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/2
            x=2520,
            y=1504,
            width=252,
            height=144,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/3
            x=4568,
            y=716,
            width=252,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 180
        },
        {
            -- AlienUFOs/Ships/Parts/Main/4
            x=2516,
            y=1664,
            width=252,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 124
        },
        {
            -- AlienUFOs/Ships/Parts/Main/5
            x=2784,
            y=1664,
            width=252,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 134
        },
        {
            -- AlienUFOs/Ships/Parts/dome
            x=3456,
            y=1240,
            width=168,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 166,
            sourceHeight = 196
        },
        {
            -- Aliens/Green/hurt
            x=4836,
            y=716,
            width=140,
            height=188,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 138,
            sourceHeight = 186
        },
        {
            -- Aliens/Green/stand
            x=8044,
            y=12,
            width=132,
            height=184,

        },
        {
            -- Astronauts/1
            x=7300,
            y=1732,
            width=68,
            height=88,

        },
        {
            -- Astronauts/10
            x=8112,
            y=1424,
            width=64,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 88
        },
        {
            -- Astronauts/11
            x=7812,
            y=504,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/12
            x=5520,
            y=764,
            width=100,
            height=88,

        },
        {
            -- Astronauts/13
            x=6828,
            y=1804,
            width=68,
            height=88,

        },
        {
            -- Astronauts/14
            x=8020,
            y=1116,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/15 Copy
            x=7148,
            y=2264,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 51
        },
        {
            -- Astronauts/15
            x=6468,
            y=1252,
            width=100,
            height=88,

        },
        {
            -- Astronauts/16
            x=8112,
            y=1528,
            width=64,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 88
        },
        {
            -- Astronauts/17
            x=8020,
            y=1220,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/18
            x=6908,
            y=1268,
            width=100,
            height=88,

        },
        {
            -- Astronauts/2
            x=7928,
            y=1236,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/3
            x=7068,
            y=1732,
            width=100,
            height=88,

        },
        {
            -- Astronauts/4
            x=7492,
            y=1844,
            width=64,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 88
        },
        {
            -- Astronauts/5
            x=8020,
            y=1324,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/6
            x=7184,
            y=1732,
            width=100,
            height=88,

        },
        {
            -- Astronauts/7
            x=7572,
            y=1956,
            width=68,
            height=88,

        },
        {
            -- Astronauts/8
            x=7836,
            y=1240,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Astronauts/9
            x=7380,
            y=1296,
            width=100,
            height=88,

        },
        {
            -- Buildings/1
            x=4288,
            y=2460,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Buildings/10
            x=4832,
            y=2488,
            width=60,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 56
        },
        {
            -- Buildings/11
            x=3908,
            y=1736,
            width=208,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 206,
            sourceHeight = 28
        },
        {
            -- Buildings/12
            x=3052,
            y=1664,
            width=180,
            height=176,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 176
        },
        {
            -- Buildings/13 Copy
            x=5508,
            y=484,
            width=92,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 79
        },
        {
            -- Buildings/13
            x=4992,
            y=712,
            width=136,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 170
        },
        {
            -- Buildings/2
            x=5500,
            y=2460,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Buildings/3
            x=2680,
            y=1804,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 168
        },
        {
            -- Buildings/4
            x=5020,
            y=1080,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 168
        },
        {
            -- Buildings/5
            x=4132,
            y=1556,
            width=172,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 168
        },
        {
            -- Buildings/6
            x=4968,
            y=1264,
            width=172,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 168
        },
        {
            -- Buildings/7
            x=5980,
            y=936,
            width=96,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 92
        },
        {
            -- Buildings/8
            x=6656,
            y=1992,
            width=60,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 56
        },
        {
            -- Buildings/9
            x=8064,
            y=764,
            width=96,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 92
        },
        {
            -- Effects/Fire/1
            x=7224,
            y=2264,
            width=28,
            height=64,

        },
        {
            -- Effects/Fire/10
            x=6412,
            y=2064,
            width=36,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 80
        },
        {
            -- Effects/Fire/11
            x=5888,
            y=1896,
            width=52,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 82
        },
        {
            -- Effects/Fire/12
            x=2936,
            y=1996,
            width=48,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 46,
            sourceHeight = 106
        },
        {
            -- Effects/Fire/13
            x=6660,
            y=1892,
            width=52,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 84
        },
        {
            -- Effects/Fire/14
            x=7492,
            y=1720,
            width=48,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 106
        },
        {
            -- Effects/Fire/15
            x=7744,
            y=1508,
            width=52,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 88
        },
        {
            -- Effects/Fire/16
            x=3840,
            y=1884,
            width=48,
            height=112,

        },
        {
            -- Effects/Fire/2
            x=6316,
            y=2232,
            width=28,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 66
        },
        {
            -- Effects/Fire/3
            x=7364,
            y=2200,
            width=28,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 70
        },
        {
            -- Effects/Fire/4
            x=7804,
            y=2296,
            width=28,
            height=64,

        },
        {
            -- Effects/Fire/5
            x=7848,
            y=2304,
            width=28,
            height=64,

        },
        {
            -- Effects/Fire/6
            x=7992,
            y=2292,
            width=28,
            height=64,

        },
        {
            -- Effects/Fire/7
            x=7488,
            y=2384,
            width=28,
            height=64,

        },
        {
            -- Effects/Fire/8
            x=6508,
            y=2404,
            width=36,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 80
        },
        {
            -- Effects/Fire/9
            x=6996,
            y=2336,
            width=36,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 80
        },
        {
            -- Effects/Shield/1
            x=872,
            y=1756,
            width=288,
            height=276,

        },
        {
            -- Effects/Shield/2
            x=872,
            y=2048,
            width=288,
            height=240,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 288,
            sourceHeight = 238
        },
        {
            -- Effects/Shield/3
            x=872,
            y=2304,
            width=268,
            height=216,

        },
        {
            -- Effects/Speed/1
            x=3880,
            y=972,
            width=16,
            height=224,

        },
        {
            -- Effects/Speed/2
            x=5488,
            y=580,
            width=16,
            height=256,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 256
        },
        {
            -- Effects/Speed/3
            x=3908,
            y=1212,
            width=28,
            height=256,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 256
        },
        {
            -- Effects/Speed/4
            x=1716,
            y=1888,
            width=36,
            height=256,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 256
        },
        {
            -- Effects/Star/1
            x=5888,
            y=1996,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- Effects/Star/2
            x=7344,
            y=2288,
            width=48,
            height=48,

        },
        {
            -- Effects/Star/3
            x=6860,
            y=2496,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- Effects/smoke/1
            x=1952,
            y=1324,
            width=44,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 42
        },
        {
            -- Effects/smoke/2
            x=7124,
            y=2464,
            width=52,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 52,
            sourceHeight = 50
        },
        {
            -- Effects/smoke/3
            x=6980,
            y=1888,
            width=72,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 72
        },
        {
            -- Effects/smoke/4
            x=7268,
            y=2284,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 50
        },
        {
            -- Effects/smoke/5
            x=7492,
            y=1948,
            width=64,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 66
        },
        {
            -- Effects/smoke/6
            x=6092,
            y=924,
            width=88,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 88,
            sourceHeight = 102
        },
        {
            -- Effects/smoke/7
            x=8116,
            y=1800,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 58
        },
        {
            -- Effects/smoke/8
            x=7928,
            y=1340,
            width=76,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 74
        },
        {
            -- Effects/smoke/9
            x=6196,
            y=924,
            width=100,
            height=104,

        },
        {
            -- Items/1
            x=1264,
            y=1968,
            width=108,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 108,
            sourceHeight = 106
        },
        {
            -- Items/10
            x=8032,
            y=992,
            width=64,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 106
        },
        {
            -- Items/100
            x=6912,
            y=1792,
            width=52,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 52,
            sourceHeight = 106
        },
        {
            -- Items/101
            x=7264,
            y=1288,
            width=100,
            height=64,

        },
        {
            -- Items/102
            x=276,
            y=2484,
            width=96,
            height=60,

        },
        {
            -- Items/103
            x=8112,
            y=1100,
            width=64,
            height=92,

        },
        {
            -- Items/104
            x=8112,
            y=984,
            width=64,
            height=100,

        },
        {
            -- Items/105
            x=2456,
            y=2116,
            width=136,
            height=124,

        },
        {
            -- Items/106
            x=2108,
            y=2328,
            width=128,
            height=88,

        },
        {
            -- Items/107
            x=1600,
            y=2468,
            width=112,
            height=76,

        },
        {
            -- Items/108
            x=2052,
            y=1940,
            width=136,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 136,
            sourceHeight = 130
        },
        {
            -- Items/109
            x=5332,
            y=2172,
            width=144,
            height=136,

        },
        {
            -- Items/11
            x=7200,
            y=592,
            width=120,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 118,
            sourceHeight = 114
        },
        {
            -- Items/110
            x=8112,
            y=1208,
            width=64,
            height=92,

        },
        {
            -- Items/111
            x=4496,
            y=1172,
            width=28,
            height=44,

        },
        {
            -- Items/112
            x=7612,
            y=1292,
            width=72,
            height=92,

        },
        {
            -- Items/113
            x=7660,
            y=2136,
            width=52,
            height=52,

        },
        {
            -- Items/114
            x=7652,
            y=2448,
            width=32,
            height=44,

        },
        {
            -- Items/115
            x=7776,
            y=2376,
            width=40,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 42
        },
        {
            -- Items/116
            x=3856,
            y=2376,
            width=52,
            height=40,

        },
        {
            -- Items/117
            x=6704,
            y=2504,
            width=48,
            height=40,

        },
        {
            -- Items/118
            x=3708,
            y=2376,
            width=132,
            height=40,

        },
        {
            -- Items/119
            x=2616,
            y=2376,
            width=152,
            height=40,

        },
        {
            -- Items/12
            x=7812,
            y=608,
            width=92,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 138
        },
        {
            -- Items/120
            x=3512,
            y=2120,
            width=96,
            height=136,

        },
        {
            -- Items/121
            x=5656,
            y=1752,
            width=100,
            height=132,

        },
        {
            -- Items/122
            x=2936,
            y=2144,
            width=116,
            height=136,

        },
        {
            -- Items/123
            x=1660,
            y=2160,
            width=100,
            height=124,

        },
        {
            -- Items/124
            x=6168,
            y=596,
            width=88,
            height=124,

        },
        {
            -- Items/125
            x=3160,
            y=2152,
            width=92,
            height=128,

        },
        {
            -- Items/126
            x=6460,
            y=504,
            width=128,
            height=116,

        },
        {
            -- Items/127
            x=3544,
            y=2432,
            width=116,
            height=112,

        },
        {
            -- Items/128
            x=6800,
            y=992,
            width=96,
            height=100,

        },
        {
            -- Items/129
            x=6584,
            y=1256,
            width=84,
            height=100,

        },
        {
            -- Items/13
            x=2108,
            y=2432,
            width=136,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 110
        },
        {
            -- Items/130
            x=4392,
            y=2460,
            width=68,
            height=84,

        },
        {
            -- Items/131
            x=7664,
            y=1732,
            width=60,
            height=88,

        },
        {
            -- Items/132
            x=6168,
            y=2444,
            width=44,
            height=96,

        },
        {
            -- Items/133
            x=5992,
            y=2316,
            width=60,
            height=112,

        },
        {
            -- Items/134
            x=1228,
            y=1584,
            width=176,
            height=100,

        },
        {
            -- Items/135
            x=8056,
            y=1932,
            width=44,
            height=76,

        },
        {
            -- Items/136
            x=6912,
            y=1916,
            width=52,
            height=76,

        },
        {
            -- Items/137
            x=8052,
            y=2128,
            width=44,
            height=76,

        },
        {
            -- Items/138
            x=7068,
            y=1836,
            width=92,
            height=80,

        },
        {
            -- Items/139
            x=4476,
            y=2472,
            width=96,
            height=72,

        },
        {
            -- Items/14
            x=5636,
            y=748,
            width=92,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 140
        },
        {
            -- Items/140
            x=3924,
            y=2464,
            width=112,
            height=80,

        },
        {
            -- Items/141
            x=4532,
            y=2068,
            width=156,
            height=88,

        },
        {
            -- Items/142
            x=3272,
            y=2432,
            width=120,
            height=112,

        },
        {
            -- Items/143
            x=1660,
            y=2300,
            width=100,
            height=152,

        },
        {
            -- Items/144
            x=4500,
            y=2172,
            width=164,
            height=96,

        },
        {
            -- Items/145
            x=5432,
            y=2324,
            width=72,
            height=120,

        },
        {
            -- Items/146
            x=7596,
            y=736,
            width=108,
            height=104,

        },
        {
            -- Items/147
            x=7720,
            y=744,
            width=76,
            height=104,

        },
        {
            -- Items/148
            x=5544,
            y=1752,
            width=96,
            height=128,

        },
        {
            -- Items/149
            x=2616,
            y=2216,
            width=96,
            height=144,

        },
        {
            -- Items/15
            x=7140,
            y=1136,
            width=76,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 130
        },
        {
            -- Items/150
            x=5832,
            y=2184,
            width=76,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 114
        },
        {
            -- Items/151
            x=6396,
            y=2240,
            width=52,
            height=68,

        },
        {
            -- Items/152
            x=6400,
            y=2160,
            width=48,
            height=64,

        },
        {
            -- Items/153
            x=4152,
            y=1156,
            width=104,
            height=188,

        },
        {
            -- Items/154
            x=7232,
            y=1136,
            width=76,
            height=132,

        },
        {
            -- Items/155
            x=7292,
            y=1612,
            width=72,
            height=104,

        },
        {
            -- Items/156
            x=7116,
            y=688,
            width=68,
            height=104,

        },
        {
            -- Items/157
            x=7668,
            y=1508,
            width=60,
            height=96,

        },
        {
            -- Items/158
            x=5388,
            y=2460,
            width=96,
            height=84,

        },
        {
            -- Items/159
            x=7572,
            y=1832,
            width=68,
            height=108,

        },
        {
            -- Items/16
            x=7496,
            y=1296,
            width=100,
            height=88,

        },
        {
            -- Items/160
            x=6980,
            y=1784,
            width=72,
            height=88,

        },
        {
            -- Items/161
            x=7856,
            y=2028,
            width=84,
            height=76,

        },
        {
            -- Items/162
            x=5264,
            y=2324,
            width=152,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 118
        },
        {
            -- Items/163
            x=1388,
            y=2064,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 404,
            sourceHeight = 402
        },
        {
            -- Items/17
            x=7584,
            y=1400,
            width=92,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 90
        },
        {
            -- Items/18
            x=5492,
            y=2172,
            width=72,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 136
        },
        {
            -- Items/19
            x=7696,
            y=864,
            width=100,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 102
        },
        {
            -- Items/2
            x=5228,
            y=1064,
            width=124,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 124,
            sourceHeight = 154
        },
        {
            -- Items/20
            x=5504,
            y=2120,
            width=36,
            height=36,

        },
        {
            -- Items/21
            x=6244,
            y=2160,
            width=36,
            height=36,

        },
        {
            -- Items/22
            x=2732,
            y=1464,
            width=24,
            height=24,

        },
        {
            -- Items/23
            x=1728,
            y=2468,
            width=96,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 74
        },
        {
            -- Items/24
            x=8112,
            y=1632,
            width=64,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 66
        },
        {
            -- Items/25
            x=3068,
            y=2144,
            width=76,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 134
        },
        {
            -- Items/26
            x=7928,
            y=992,
            width=88,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 102
        },
        {
            -- Items/27
            x=4052,
            y=2464,
            width=108,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 80
        },
        {
            -- Items/28
            x=7020,
            y=1136,
            width=104,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 108
        },
        {
            -- Items/29
            x=5560,
            y=2056,
            width=80,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 100
        },
        {
            -- Items/3
            x=4172,
            y=1360,
            width=104,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 178
        },
        {
            -- Items/30
            x=5744,
            y=752,
            width=104,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 136
        },
        {
            -- Items/31
            x=8044,
            y=212,
            width=132,
            height=132,

        },
        {
            -- Items/32
            x=7940,
            y=764,
            width=108,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 92
        },
        {
            -- Items/33
            x=3064,
            y=2296,
            width=108,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 120
        },
        {
            -- Items/34
            x=6980,
            y=1372,
            width=60,
            height=116,

        },
        {
            -- Items/35
            x=5656,
            y=2060,
            width=84,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 98
        },
        {
            -- Items/36
            x=5520,
            y=2324,
            width=84,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 120
        },
        {
            -- Items/37
            x=7928,
            y=1112,
            width=76,
            height=108,

        },
        {
            -- Items/38
            x=6568,
            y=796,
            width=100,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 130
        },
        {
            -- Items/39
            x=1176,
            y=2092,
            width=128,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 126,
            sourceHeight = 196
        },
        {
            -- Items/4
            x=5104,
            y=900,
            width=88,
            height=164,

        },
        {
            -- Items/40
            x=5856,
            y=2060,
            width=68,
            height=108,

        },
        {
            -- Items/41
            x=8020,
            y=1428,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Items/42
            x=8116,
            y=1716,
            width=60,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 66
        },
        {
            -- Items/43
            x=7284,
            y=1836,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 88
        },
        {
            -- Items/44
            x=5148,
            y=1636,
            width=148,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 146,
            sourceHeight = 150
        },
        {
            -- Items/45
            x=7168,
            y=1368,
            width=92,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 92,
            sourceHeight = 94
        },
        {
            -- Items/46
            x=5900,
            y=464,
            width=112,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 126
        },
        {
            -- Items/47
            x=5616,
            y=464,
            width=116,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 116,
            sourceHeight = 98
        },
        {
            -- Items/48
            x=7512,
            y=984,
            width=60,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 130
        },
        {
            -- Items/49
            x=7488,
            y=1612,
            width=52,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 92
        },
        {
            -- Items/5
            x=3824,
            y=2212,
            width=64,
            height=148,

        },
        {
            -- Items/50
            x=8116,
            y=1876,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 58
        },
        {
            -- Items/51
            x=7692,
            y=1400,
            width=52,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 92
        },
        {
            -- Items/52
            x=7468,
            y=732,
            width=112,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 98
        },
        {
            -- Items/53
            x=4532,
            y=1932,
            width=156,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 156,
            sourceHeight = 118
        },
        {
            -- Items/54
            x=6172,
            y=1724,
            width=92,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 138
        },
        {
            -- Items/55
            x=2232,
            y=2080,
            width=136,
            height=120,

        },
        {
            -- Items/56
            x=3408,
            y=2432,
            width=120,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 120,
            sourceHeight = 110
        },
        {
            -- Items/57
            x=4168,
            y=736,
            width=116,
            height=204,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 204
        },
        {
            -- Items/58
            x=4104,
            y=2432,
            width=56,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 14
        },
        {
            -- Items/59
            x=1948,
            y=2472,
            width=144,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 142,
            sourceHeight = 70
        },
        {
            -- Items/6
            x=5996,
            y=2444,
            width=48,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 98
        },
        {
            -- Items/60
            x=8112,
            y=1316,
            width=64,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 90
        },
        {
            -- Items/61
            x=4912,
            y=2316,
            width=164,
            height=132,

        },
        {
            -- Items/62
            x=3188,
            y=2296,
            width=96,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 118
        },
        {
            -- Items/63
            x=5916,
            y=2448,
            width=64,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 96
        },
        {
            -- Items/64
            x=7844,
            y=1628,
            width=60,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 80
        },
        {
            -- Items/65
            x=7920,
            y=1432,
            width=84,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 82
        },
        {
            -- Items/66
            x=7856,
            y=1828,
            width=84,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 82
        },
        {
            -- Items/67
            x=2204,
            y=1968,
            width=164,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 94
        },
        {
            -- Items/68
            x=1840,
            y=2468,
            width=92,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 76
        },
        {
            -- Items/69
            x=3624,
            y=2216,
            width=56,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 38
        },
        {
            -- Items/7
            x=6060,
            y=2444,
            width=48,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 46,
            sourceHeight = 98
        },
        {
            -- Items/70
            x=6980,
            y=1976,
            width=72,
            height=68,

        },
        {
            -- Items/71
            x=6652,
            y=2064,
            width=72,
            height=68,

        },
        {
            -- Items/72
            x=6552,
            y=1828,
            width=116,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 48
        },
        {
            -- Items/73
            x=6716,
            y=1804,
            width=96,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 66
        },
        {
            -- Items/74
            x=5360,
            y=892,
            width=96,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 154
        },
        {
            -- Items/75
            x=5272,
            y=1408,
            width=100,
            height=160,

        },
        {
            -- Items/76
            x=5940,
            y=2060,
            width=24,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 22,
            sourceHeight = 108
        },
        {
            -- Items/77
            x=5980,
            y=2060,
            width=32,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 106
        },
        {
            -- Items/78
            x=6124,
            y=2444,
            width=28,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 98
        },
        {
            -- Items/79
            x=2728,
            y=2216,
            width=52,
            height=144,

        },
        {
            -- Items/8
            x=7812,
            y=764,
            width=112,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 110,
            sourceHeight = 90
        },
        {
            -- Items/80
            x=5244,
            y=2460,
            width=128,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 126,
            sourceHeight = 82
        },
        {
            -- Items/81
            x=2932,
            y=2296,
            width=116,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 118
        },
        {
            -- Items/82
            x=8024,
            y=1532,
            width=72,
            height=72,

        },
        {
            -- Items/83
            x=6244,
            y=2212,
            width=56,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 86
        },
        {
            -- Items/84
            x=2196,
            y=1268,
            width=40,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 38
        },
        {
            -- Items/85
            x=6768,
            y=2504,
            width=40,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 40,
            sourceHeight = 38
        },
        {
            -- Items/86
            x=7832,
            y=2384,
            width=40,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 40,
            sourceHeight = 42
        },
        {
            -- Items/87
            x=7340,
            y=2496,
            width=40,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 40,
            sourceHeight = 42
        },
        {
            -- Items/88
            x=6912,
            y=976,
            width=92,
            height=132,

        },
        {
            -- Items/89
            x=7012,
            y=824,
            width=88,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 136
        },
        {
            -- Items/9
            x=6640,
            y=1688,
            width=60,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 122
        },
        {
            -- Items/90
            x=3000,
            y=2024,
            width=148,
            height=104,

        },
        {
            -- Items/91
            x=7200,
            y=724,
            width=120,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 118,
            sourceHeight = 92
        },
        {
            -- Items/92
            x=6068,
            y=2316,
            width=60,
            height=112,

        },
        {
            -- Items/93
            x=7760,
            y=1396,
            width=36,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 92
        },
        {
            -- Items/94
            x=7276,
            y=1368,
            width=72,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 94
        },
        {
            -- Items/95
            x=6144,
            y=2316,
            width=56,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 112
        },
        {
            -- Items/96
            x=1640,
            y=1732,
            width=112,
            height=140,

        },
        {
            -- Items/97
            x=3164,
            y=2024,
            width=36,
            height=112,

        },
        {
            -- Items/98
            x=2796,
            y=2296,
            width=120,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 118,
            sourceHeight = 118
        },
        {
            -- Items/99
            x=7764,
            y=1836,
            width=76,
            height=88,

        },
        {
            -- Lasers/1
            x=6980,
            y=1652,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/10
            x=6028,
            y=2060,
            width=20,
            height=108,

        },
        {
            -- Lasers/11
            x=6444,
            y=2324,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/12
            x=6824,
            y=2408,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/13
            x=8052,
            y=872,
            width=96,
            height=96,

        },
        {
            -- Lasers/14
            x=6684,
            y=1260,
            width=96,
            height=96,

        },
        {
            -- Lasers/15
            x=6460,
            y=1872,
            width=76,
            height=76,

        },
        {
            -- Lasers/16
            x=7764,
            y=2044,
            width=76,
            height=76,

        },
        {
            -- Lasers/17
            x=7024,
            y=1644,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/18
            x=5908,
            y=2316,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/19
            x=7408,
            y=2116,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/2
            x=7800,
            y=1120,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/20
            x=7452,
            y=2112,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/21
            x=5924,
            y=2184,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/22
            x=5968,
            y=2184,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/23
            x=7408,
            y=2208,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/24
            x=7452,
            y=2204,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/25
            x=1932,
            y=2340,
            width=28,
            height=108,

        },
        {
            -- Lasers/26
            x=6064,
            y=2060,
            width=20,
            height=108,

        },
        {
            -- Lasers/27
            x=7408,
            y=2300,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/28
            x=7452,
            y=2296,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/29
            x=6796,
            y=1260,
            width=96,
            height=96,

        },
        {
            -- Lasers/3
            x=7488,
            y=2292,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/30
            x=7056,
            y=1368,
            width=96,
            height=96,

        },
        {
            -- Lasers/31
            x=7960,
            y=2120,
            width=76,
            height=76,

        },
        {
            -- Lasers/32
            x=6460,
            y=1964,
            width=76,
            height=76,

        },
        {
            -- Lasers/33
            x=6004,
            y=2184,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/34
            x=6048,
            y=2184,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/35
            x=7664,
            y=2204,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/36
            x=7848,
            y=2212,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/37
            x=6084,
            y=2184,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/38
            x=6128,
            y=2184,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/39
            x=7708,
            y=2204,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/4
            x=7892,
            y=2276,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/40
            x=8080,
            y=2280,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/41
            x=6100,
            y=2060,
            width=28,
            height=108,

        },
        {
            -- Lasers/42
            x=6144,
            y=2060,
            width=20,
            height=108,

        },
        {
            -- Lasers/43
            x=7752,
            y=2204,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/44
            x=8116,
            y=2268,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/45
            x=7068,
            y=1620,
            width=96,
            height=96,

        },
        {
            -- Lasers/46
            x=7180,
            y=1620,
            width=96,
            height=96,

        },
        {
            -- Lasers/47
            x=6320,
            y=2064,
            width=76,
            height=76,

        },
        {
            -- Lasers/48
            x=6740,
            y=2056,
            width=76,
            height=76,

        },
        {
            -- Lasers/5
            x=6164,
            y=2184,
            width=28,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 114
        },
        {
            -- Lasers/6
            x=6208,
            y=2184,
            width=20,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 114
        },
        {
            -- Lasers/7
            x=7884,
            y=2184,
            width=28,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 74
        },
        {
            -- Lasers/8
            x=7452,
            y=2388,
            width=20,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 74
        },
        {
            -- Lasers/9
            x=6180,
            y=2060,
            width=28,
            height=108,

        },
        {
            -- Lasers/Beam/1
            x=1368,
            y=2304,
            width=76,
            height=200,

        },
        {
            -- Lasers/Beam/2
            x=5128,
            y=1804,
            width=76,
            height=200,

        },
        {
            -- Lasers/Beam/3
            x=5128,
            y=2020,
            width=76,
            height=200,

        },
        {
            -- Lasers/Beam/4
            x=5220,
            y=1804,
            width=76,
            height=200,

        },
        {
            -- Lasers/Beam/5
            x=5220,
            y=2020,
            width=76,
            height=200,

        },
        {
            -- Lasers/Burst/1
            x=6476,
            y=12,
            width=376,
            height=380,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 376,
            sourceHeight = 378
        },
        {
            -- Lasers/Burst/2
            x=6868,
            y=12,
            width=376,
            height=380,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 376,
            sourceHeight = 378
        },
        {
            -- Lasers/Burst/3
            x=7260,
            y=12,
            width=376,
            height=380,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 376,
            sourceHeight = 378
        },
        {
            -- Lasers/Burst/4 Copy
            x=2732,
            y=1252,
            width=196,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 195,
            sourceHeight = 195
        },
        {
            -- Lasers/Burst/4
            x=7652,
            y=12,
            width=376,
            height=380,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 376,
            sourceHeight = 378
        },
        {
            -- Lasers/Burst/5
            x=1808,
            y=564,
            width=376,
            height=380,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 376,
            sourceHeight = 378
        },
        {
            -- Lasers/GroundBurst/1
            x=868,
            y=1584,
            width=344,
            height=156,

        },
        {
            -- Lasers/GroundBurst/2
            x=2844,
            y=564,
            width=344,
            height=156,

        },
        {
            -- Lasers/GroundBurst/3
            x=3204,
            y=564,
            width=344,
            height=156,

        },
        {
            -- Lasers/GroundBurst/4
            x=3564,
            y=564,
            width=344,
            height=156,

        },
        {
            -- Lasers/GroundBurst/5
            x=3924,
            y=564,
            width=344,
            height=156,

        },
        {
            -- Lasers/Rings/1
            x=5128,
            y=2236,
            width=188,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 72
        },
        {
            -- Lasers/Rings/2
            x=7200,
            y=504,
            width=188,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 72
        },
        {
            -- Lasers/Rings/3
            x=7404,
            y=504,
            width=188,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 72
        },
        {
            -- Lasers/Rings/4
            x=7608,
            y=504,
            width=188,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 72
        },
        {
            -- Lasers/Rings/5
            x=3248,
            y=1832,
            width=188,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 186,
            sourceHeight = 72
        },
        {
            -- Logo
            x=12,
            y=12,
            width=1348,
            height=452,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1348,
            sourceHeight = 450
        },
        {
            -- Meteors/Big/1
            x=3952,
            y=1368,
            width=204,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 202,
            sourceHeight = 166
        },
        {
            -- Meteors/Big/2
            x=2944,
            y=1248,
            width=240,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 240,
            sourceHeight = 194
        },
        {
            -- Meteors/Big/3
            x=4124,
            y=1884,
            width=180,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 164
        },
        {
            -- Meteors/Big/4
            x=2036,
            y=1564,
            width=196,
            height=192,

        },
        {
            -- Meteors/Big/5
            x=4712,
            y=1592,
            width=204,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 202,
            sourceHeight = 166
        },
        {
            -- Meteors/Big/6
            x=3200,
            y=1240,
            width=240,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 240,
            sourceHeight = 194
        },
        {
            -- Meteors/Big/7
            x=4304,
            y=2092,
            width=180,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 164
        },
        {
            -- Meteors/Big/8
            x=1156,
            y=2304,
            width=196,
            height=192,

        },
        {
            -- Meteors/Huge/1
            x=1376,
            y=12,
            width=440,
            height=444,

        },
        {
            -- Meteors/Huge/2
            x=6028,
            y=12,
            width=432,
            height=424,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 432,
            sourceHeight = 422
        },
        {
            -- Meteors/Huge/3
            x=5588,
            y=12,
            width=424,
            height=436,

        },
        {
            -- Meteors/Huge/4
            x=5144,
            y=12,
            width=428,
            height=456,

        },
        {
            -- Meteors/Med/1
            x=7176,
            y=1836,
            width=92,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 80
        },
        {
            -- Meteors/Med/2
            x=5604,
            y=2460,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Meteors/Med/3
            x=5708,
            y=2460,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Meteors/Med/4
            x=7068,
            y=1932,
            width=92,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 80
        },
        {
            -- Meteors/Small/1
            x=7048,
            y=2320,
            width=56,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 54
        },
        {
            -- Meteors/Small/2
            x=7048,
            y=2464,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 52
        },
        {
            -- Meteors/Small/3
            x=7048,
            y=2392,
            width=56,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 54
        },
        {
            -- Meteors/Small/4
            x=7120,
            y=2332,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 52
        },
        {
            -- Meteors/Tiny/1
            x=7396,
            y=2508,
            width=36,
            height=36,

        },
        {
            -- Meteors/Tiny/2
            x=3216,
            y=2104,
            width=32,
            height=32,

        },
        {
            -- Meteors/Tiny/3
            x=7448,
            y=2508,
            width=36,
            height=36,

        },
        {
            -- Meteors/Tiny/4
            x=1156,
            y=2512,
            width=32,
            height=32,

        },
        {
            -- Missiles/1
            x=7060,
            y=668,
            width=40,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 124
        },
        {
            -- Missiles/10
            x=1992,
            y=1956,
            width=44,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 166
        },
        {
            -- Missiles/11
            x=7004,
            y=1504,
            width=40,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 122
        },
        {
            -- Missiles/12
            x=6552,
            y=1688,
            width=72,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 122
        },
        {
            -- Missiles/13
            x=3824,
            y=2016,
            width=64,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 180
        },
        {
            -- Missiles/14
            x=7116,
            y=528,
            width=68,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 142
        },
        {
            -- Missiles/15
            x=1976,
            y=2140,
            width=44,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 170
        },
        {
            -- Missiles/16
            x=6608,
            y=2400,
            width=56,
            height=80,

        },
        {
            -- Missiles/17
            x=8056,
            y=1828,
            width=44,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 86
        },
        {
            -- Missiles/18
            x=6716,
            y=1664,
            width=72,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 122
        },
        {
            -- Missiles/19
            x=5984,
            y=756,
            width=76,
            height=164,

        },
        {
            -- Missiles/2
            x=6804,
            y=1664,
            width=72,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 122
        },
        {
            -- Missiles/20
            x=6400,
            y=592,
            width=44,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 166
        },
        {
            -- Missiles/21
            x=7236,
            y=1480,
            width=40,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 122
        },
        {
            -- Missiles/22
            x=6892,
            y=1652,
            width=72,
            height=124,

        },
        {
            -- Missiles/23
            x=5312,
            y=1584,
            width=64,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 180
        },
        {
            -- Missiles/24
            x=5540,
            y=1412,
            width=68,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 142
        },
        {
            -- Missiles/25
            x=6168,
            y=736,
            width=44,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 170
        },
        {
            -- Missiles/26
            x=6680,
            y=2400,
            width=56,
            height=80,

        },
        {
            -- Missiles/27
            x=8052,
            y=2024,
            width=44,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 86
        },
        {
            -- Missiles/28
            x=7060,
            y=1480,
            width=72,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 122
        },
        {
            -- Missiles/29
            x=6076,
            y=744,
            width=76,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 162
        },
        {
            -- Missiles/3
            x=5312,
            y=1780,
            width=64,
            height=180,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 178
        },
        {
            -- Missiles/30
            x=6228,
            y=736,
            width=44,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 166
        },
        {
            -- Missiles/31
            x=5944,
            y=2316,
            width=32,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 114
        },
        {
            -- Missiles/32
            x=7292,
            y=1480,
            width=64,
            height=116,

        },
        {
            -- Missiles/33
            x=4840,
            y=2300,
            width=56,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 172
        },
        {
            -- Missiles/34
            x=7732,
            y=592,
            width=64,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 134
        },
        {
            -- Missiles/35
            x=6260,
            y=1044,
            width=36,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 162
        },
        {
            -- Missiles/36
            x=7008,
            y=2232,
            width=52,
            height=72,

        },
        {
            -- Missiles/37
            x=6996,
            y=2432,
            width=36,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 78
        },
        {
            -- Missiles/38
            x=7372,
            y=1480,
            width=64,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 64,
            sourceHeight = 114
        },
        {
            -- Missiles/39
            x=5772,
            y=1732,
            width=68,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 154
        },
        {
            -- Missiles/4
            x=6252,
            y=1408,
            width=68,
            height=140,

        },
        {
            -- Missiles/40
            x=6400,
            y=776,
            width=36,
            height=160,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 158
        },
        {
            -- Missiles/5
            x=6252,
            y=1224,
            width=44,
            height=168,

        },
        {
            -- Missiles/6
            x=6752,
            y=2408,
            width=56,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 78
        },
        {
            -- Missiles/7
            x=6272,
            y=2316,
            width=44,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 86
        },
        {
            -- Missiles/8
            x=7148,
            y=1480,
            width=72,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 122
        },
        {
            -- Missiles/9
            x=5544,
            y=1572,
            width=76,
            height=164,

        },
        {
            -- Particles/1
            x=2440,
            y=1024,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/10
            x=2788,
            y=1464,
            width=192,
            height=184,

        },
        {
            -- Particles/11
            x=3952,
            y=1168,
            width=184,
            height=184,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 182,
            sourceHeight = 184
        },
        {
            -- Particles/12
            x=1264,
            y=1700,
            width=60,
            height=252,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 250
        },
        {
            -- Particles/13
            x=1952,
            y=1080,
            width=228,
            height=228,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 226,
            sourceHeight = 228
        },
        {
            -- Particles/14
            x=2680,
            y=1012,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/15
            x=2920,
            y=1008,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/16
            x=3160,
            y=1000,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 222
        },
        {
            -- Particles/17
            x=3248,
            y=1632,
            width=192,
            height=184,

        },
        {
            -- Particles/18
            x=1460,
            y=2268,
            width=184,
            height=184,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 182,
            sourceHeight = 184
        },
        {
            -- Particles/19
            x=1340,
            y=1700,
            width=60,
            height=252,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 250
        },
        {
            -- Particles/2
            x=3400,
            y=1000,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 222
        },
        {
            -- Particles/20
            x=2196,
            y=1024,
            width=228,
            height=228,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 226,
            sourceHeight = 228
        },
        {
            -- Particles/21
            x=3640,
            y=972,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/3
            x=3912,
            y=968,
            width=192,
            height=184,

        },
        {
            -- Particles/4
            x=1776,
            y=2140,
            width=184,
            height=184,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 182,
            sourceHeight = 184
        },
        {
            -- Particles/5
            x=1640,
            y=1888,
            width=60,
            height=252,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 60,
            sourceHeight = 250
        },
        {
            -- Particles/6
            x=1768,
            y=1392,
            width=228,
            height=228,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 226,
            sourceHeight = 228
        },
        {
            -- Particles/7
            x=2012,
            y=1324,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/8
            x=2252,
            y=1268,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 224
        },
        {
            -- Particles/9
            x=2492,
            y=1264,
            width=224,
            height=224,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 222,
            sourceHeight = 222
        },
        {
            -- Planet/1
            x=892,
            y=480,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/2
            x=868,
            y=1032,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/3
            x=1832,
            y=12,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 534
        },
        {
            -- Planet/4
            x=12,
            y=480,
            width=864,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 862,
            sourceHeight = 534
        },
        {
            -- Planet/5
            x=2384,
            y=12,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/6
            x=2936,
            y=12,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 534
        },
        {
            -- Planet/7
            x=3488,
            y=12,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 536
        },
        {
            -- Planet/8
            x=4040,
            y=12,
            width=536,
            height=536,

        },
        {
            -- Planet/9
            x=4592,
            y=12,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 536
        },
        {
            -- Power-ups/Bolt/1
            x=6828,
            y=1908,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Bolt/2
            x=6900,
            y=2084,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Bolt/3
            x=7572,
            y=2060,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Bolt/4
            x=6644,
            y=2148,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Bolt/5
            x=6940,
            y=2420,
            width=40,
            height=60,

        },
        {
            -- Power-ups/Bolt/6
            x=7604,
            y=2144,
            width=40,
            height=60,

        },
        {
            -- Power-ups/Bolt/7
            x=7608,
            y=2220,
            width=40,
            height=60,

        },
        {
            -- Power-ups/None/1
            x=6728,
            y=2148,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/None/2
            x=6812,
            y=2156,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/None/3
            x=6896,
            y=2168,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/None/4
            x=6536,
            y=2212,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Pills/1
            x=6508,
            y=2500,
            width=44,
            height=44,

        },
        {
            -- Power-ups/Pills/2
            x=8032,
            y=2220,
            width=44,
            height=44,

        },
        {
            -- Power-ups/Pills/3
            x=7532,
            y=2364,
            width=44,
            height=44,

        },
        {
            -- Power-ups/Pills/4
            x=7592,
            y=2364,
            width=44,
            height=44,

        },
        {
            -- Power-ups/Shield/2
            x=6620,
            y=2232,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Shield/3
            x=6704,
            y=2232,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Shield/4
            x=6608,
            y=2316,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Shield/5
            x=388,
            y=2484,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Shield/6
            x=468,
            y=2484,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Shield/7
            x=6900,
            y=2008,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Shiled/1
            x=6692,
            y=2316,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Star/1
            x=6788,
            y=2240,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Star/2
            x=6776,
            y=2324,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Star/3
            x=6872,
            y=2252,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Star/4
            x=6860,
            y=2336,
            width=68,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 66
        },
        {
            -- Power-ups/Star/5
            x=7492,
            y=2032,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Star/6
            x=6320,
            y=2156,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Star/7
            x=6860,
            y=2420,
            width=64,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 60
        },
        {
            -- Power-ups/Things/1
            x=8112,
            y=2028,
            width=64,
            height=64,

        },
        {
            -- Power-ups/Things/2
            x=8112,
            y=2108,
            width=64,
            height=64,

        },
        {
            -- Power-ups/Things/3
            x=8112,
            y=2188,
            width=64,
            height=64,

        },
        {
            -- Rockets/Parts/1
            x=5208,
            y=892,
            width=136,
            height=156,

        },
        {
            -- Rockets/Parts/10
            x=2252,
            y=2324,
            width=148,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 146,
            sourceHeight = 90
        },
        {
            -- Rockets/Parts/11
            x=5236,
            y=1236,
            width=136,
            height=156,

        },
        {
            -- Rockets/Parts/12
            x=5392,
            y=1896,
            width=140,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 138,
            sourceHeight = 52
        },
        {
            -- Rockets/Parts/13
            x=5392,
            y=1736,
            width=136,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 136,
            sourceHeight = 142
        },
        {
            -- Rockets/Parts/14
            x=4912,
            y=2464,
            width=136,
            height=80,

        },
        {
            -- Rockets/Parts/15
            x=5388,
            y=1408,
            width=136,
            height=148,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 136,
            sourceHeight = 146
        },
        {
            -- Rockets/Parts/16
            x=3924,
            y=2348,
            width=164,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 98
        },
        {
            -- Rockets/Parts/17
            x=5392,
            y=1572,
            width=136,
            height=148,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 136,
            sourceHeight = 146
        },
        {
            -- Rockets/Parts/18
            x=5092,
            y=2460,
            width=136,
            height=84,

        },
        {
            -- Rockets/Parts/19
            x=5844,
            y=924,
            width=120,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 118,
            sourceHeight = 104
        },
        {
            -- Rockets/Parts/2
            x=2456,
            y=1972,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/20
            x=7388,
            y=1828,
            width=88,
            height=88,

        },
        {
            -- Rockets/Parts/21
            x=6464,
            y=2056,
            width=72,
            height=72,

        },
        {
            -- Rockets/Parts/22
            x=7196,
            y=2344,
            width=56,
            height=56,

        },
        {
            -- Rockets/Parts/23
            x=1672,
            y=1068,
            width=60,
            height=340,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 340
        },
        {
            -- Rockets/Parts/24
            x=5412,
            y=580,
            width=60,
            height=264,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 264
        },
        {
            -- Rockets/Parts/25
            x=1176,
            y=1756,
            width=72,
            height=320,

        },
        {
            -- Rockets/Parts/26
            x=1672,
            y=1424,
            width=80,
            height=292,

        },
        {
            -- Rockets/Parts/27
            x=5624,
            y=1216,
            width=84,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 162
        },
        {
            -- Rockets/Parts/28
            x=1320,
            y=2092,
            width=80,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 194
        },
        {
            -- Rockets/Parts/29
            x=5312,
            y=1976,
            width=76,
            height=180,

        },
        {
            -- Rockets/Parts/3
            x=2784,
            y=1996,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/30
            x=5160,
            y=1448,
            width=96,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 170
        },
        {
            -- Rockets/Parts/31
            x=5156,
            y=1264,
            width=64,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 62,
            sourceHeight = 166
        },
        {
            -- Rockets/Parts/4
            x=3268,
            y=2104,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/5
            x=5368,
            y=1064,
            width=136,
            height=156,

        },
        {
            -- Rockets/Parts/6
            x=5748,
            y=464,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/7
            x=5744,
            y=608,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/8
            x=6028,
            y=452,
            width=136,
            height=128,

        },
        {
            -- Rockets/Parts/9
            x=5388,
            y=1236,
            width=136,
            height=156,

        },
        {
            -- Rockets/SpaceRockets/1
            x=276,
            y=1848,
            width=316,
            height=620,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 314,
            sourceHeight = 618
        },
        {
            -- Rockets/SpaceRockets/2
            x=1420,
            y=1068,
            width=236,
            height=632,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 236,
            sourceHeight = 630
        },
        {
            -- Rockets/SpaceRockets/3 Copy
            x=2200,
            y=564,
            width=628,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 626,
            sourceHeight = 122
        },
        {
            -- Rockets/SpaceRockets/3
            x=580,
            y=1032,
            width=272,
            height=740,

        },
        {
            -- Rockets/SpaceRockets/4
            x=608,
            y=1788,
            width=248,
            height=748,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 246,
            sourceHeight = 748
        },
        {
            -- Ruby/1
            x=7812,
            y=1452,
            width=92,
            height=72,

        },
        {
            -- Ruby/2
            x=7812,
            y=1540,
            width=92,
            height=72,

        },
        {
            -- Ruby/3
            x=7920,
            y=1636,
            width=92,
            height=72,

        },
        {
            -- Ruby/4
            x=6552,
            y=1892,
            width=92,
            height=72,

        },
        {
            -- Ships/1
            x=2248,
            y=1800,
            width=200,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 198,
            sourceHeight = 150
        },
        {
            -- Ships/10
            x=2464,
            y=1804,
            width=200,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 198,
            sourceHeight = 150
        },
        {
            -- Ships/11
            x=4540,
            y=1064,
            width=224,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 224,
            sourceHeight = 150
        },
        {
            -- Ships/12
            x=2036,
            y=1772,
            width=196,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 150
        },
        {
            -- Ships/13
            x=4292,
            y=1356,
            width=188,
            height=168,

        },
        {
            -- Ships/14
            x=1416,
            y=1716,
            width=208,
            height=168,

        },
        {
            -- Ships/15
            x=1416,
            y=1900,
            width=208,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 206,
            sourceHeight = 168
        },
        {
            -- Ships/16
            x=4120,
            y=968,
            width=164,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 170
        },
        {
            -- Ships/17
            x=4948,
            y=1448,
            width=196,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 170
        },
        {
            -- Ships/18
            x=7576,
            y=856,
            width=104,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 105
        },
        {
            -- Ships/19
            x=1416,
            y=2084,
            width=208,
            height=168,

        },
        {
            -- Ships/2
            x=4780,
            y=1080,
            width=224,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 224,
            sourceHeight = 150
        },
        {
            -- Ships/20
            x=1768,
            y=1956,
            width=208,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 206,
            sourceHeight = 168
        },
        {
            -- Ships/21
            x=4300,
            y=2272,
            width=164,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 170
        },
        {
            -- Ships/22
            x=4704,
            y=1776,
            width=196,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 170
        },
        {
            -- Ships/23
            x=3216,
            y=1920,
            width=188,
            height=168,

        },
        {
            -- Ships/24
            x=3908,
            y=1552,
            width=208,
            height=168,

        },
        {
            -- Ships/25
            x=4272,
            y=1172,
            width=208,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 206,
            sourceHeight = 168
        },
        {
            -- Ships/26
            x=4480,
            y=2284,
            width=164,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 170
        },
        {
            -- Ships/27
            x=4916,
            y=1804,
            width=196,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 170
        },
        {
            -- Ships/28
            x=4320,
            y=1904,
            width=196,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 170
        },
        {
            -- Ships/29
            x=3420,
            y=1936,
            width=188,
            height=168,

        },
        {
            -- Ships/3
            x=4704,
            y=1964,
            width=196,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 150
        },
        {
            -- Ships/30
            x=4724,
            y=1408,
            width=208,
            height=168,

        },
        {
            -- Ships/31
            x=4488,
            y=1576,
            width=208,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 206,
            sourceHeight = 168
        },
        {
            -- Ships/32
            x=4660,
            y=2300,
            width=164,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 164,
            sourceHeight = 170
        },
        {
            -- Ships/33
            x=2784,
            y=1816,
            width=200,
            height=164,

        },
        {
            -- Ships/34
            x=3212,
            y=1452,
            width=228,
            height=164,

        },
        {
            -- Ships/35
            x=4496,
            y=1400,
            width=212,
            height=160,

        },
        {
            -- Ships/36
            x=3900,
            y=736,
            width=252,
            height=216,

        },
        {
            -- Ships/37
            x=7904,
            y=408,
            width=272,
            height=172,

        },
        {
            -- Ships/38
            x=1748,
            y=1080,
            width=188,
            height=296,

        },
        {
            -- Ships/39
            x=3904,
            y=1780,
            width=204,
            height=152,

        },
        {
            -- Ships/4
            x=3000,
            y=1856,
            width=200,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 198,
            sourceHeight = 150
        },
        {
            -- Ships/40
            x=2996,
            y=1460,
            width=200,
            height=188,

        },
        {
            -- Ships/41
            x=2200,
            y=704,
            width=344,
            height=304,

        },
        {
            -- Ships/5
            x=1768,
            y=1788,
            width=224,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 224,
            sourceHeight = 150
        },
        {
            -- Ships/6
            x=4916,
            y=1992,
            width=196,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 150
        },
        {
            -- Ships/7
            x=4932,
            y=1636,
            width=200,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 198,
            sourceHeight = 150
        },
        {
            -- Ships/8
            x=4496,
            y=1232,
            width=224,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 224,
            sourceHeight = 150
        },
        {
            -- Ships/9
            x=4704,
            y=2132,
            width=196,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 150
        },
        {
            -- Ships/Damages/1
            x=4980,
            y=564,
            width=148,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 148,
            sourceHeight = 130
        },
        {
            -- Ships/Damages/2
            x=3640,
            y=1884,
            width=184,
            height=116,

        },
        {
            -- Ships/Damages/3
            x=2260,
            y=2432,
            width=136,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 136,
            sourceHeight = 110
        },
        {
            -- Ships/Damages/4
            x=3456,
            y=1452,
            width=168,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 168,
            sourceHeight = 142
        },
        {
            -- Ships/Damages/5
            x=4916,
            y=2160,
            width=196,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 196,
            sourceHeight = 138
        },
        {
            -- Ships/Damages/6
            x=5092,
            y=2324,
            width=156,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 154,
            sourceHeight = 118
        },
        {
            -- Ships/Damages/7
            x=4104,
            y=2264,
            width=180,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 150
        },
        {
            -- Ships/Damages/8
            x=4736,
            y=1248,
            width=216,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 214,
            sourceHeight = 144
        },
        {
            -- Ships/Damages/9
            x=4132,
            y=1740,
            width=172,
            height=128,

        },
        {
            -- Ships/Parts/Beams/1
            x=7076,
            y=2184,
            width=80,
            height=40,

        },
        {
            -- Ships/Parts/Beams/10
            x=6464,
            y=2144,
            width=72,
            height=44,

        },
        {
            -- Ships/Parts/Beams/11
            x=4588,
            y=2488,
            width=116,
            height=56,

        },
        {
            -- Ships/Parts/Beams/12
            x=2672,
            y=2168,
            width=108,
            height=24,

        },
        {
            -- Ships/Parts/Beams/13
            x=4720,
            y=2488,
            width=96,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 54
        },
        {
            -- Ships/Parts/Beams/14
            x=8044,
            y=360,
            width=104,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 28
        },
        {
            -- Ships/Parts/Beams/2
            x=6984,
            y=2152,
            width=76,
            height=64,

        },
        {
            -- Ships/Parts/Beams/3
            x=8116,
            y=1952,
            width=60,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 58
        },
        {
            -- Ships/Parts/Beams/4
            x=5404,
            y=2120,
            width=84,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 34
        },
        {
            -- Ships/Parts/Beams/5
            x=7172,
            y=2196,
            width=80,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 80,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Beams/6
            x=7856,
            y=2120,
            width=88,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 88,
            sourceHeight = 46
        },
        {
            -- Ships/Parts/Beams/7
            x=7364,
            y=1400,
            width=88,
            height=64,

        },
        {
            -- Ships/Parts/Beams/8
            x=5580,
            y=2172,
            width=32,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 136
        },
        {
            -- Ships/Parts/Beams/9
            x=7396,
            y=836,
            width=52,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 52,
            sourceHeight = 130
        },
        {
            -- Ships/Parts/Cockpits/1
            x=7956,
            y=2024,
            width=80,
            height=80,

        },
        {
            -- Ships/Parts/Cockpits/10
            x=5756,
            y=2052,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/11
            x=6180,
            y=452,
            width=124,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 122,
            sourceHeight = 124
        },
        {
            -- Ships/Parts/Cockpits/12
            x=6288,
            y=732,
            width=96,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/13
            x=5832,
            y=1380,
            width=96,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Cockpits/14
            x=6584,
            y=1104,
            width=84,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/15
            x=3508,
            y=2272,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/16
            x=5624,
            y=580,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 152
        },
        {
            -- Ships/Parts/Cockpits/17
            x=6364,
            y=1884,
            width=80,
            height=80,

        },
        {
            -- Ships/Parts/Cockpits/18
            x=5732,
            y=2184,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/19
            x=6320,
            y=452,
            width=124,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 122,
            sourceHeight = 124
        },
        {
            -- Ships/Parts/Cockpits/2
            x=6580,
            y=1372,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/20
            x=6684,
            y=1108,
            width=96,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/21
            x=5948,
            y=1044,
            width=96,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Cockpits/22
            x=7312,
            y=984,
            width=84,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/23
            x=3608,
            y=2272,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/24
            x=7920,
            y=596,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 152
        },
        {
            -- Ships/Parts/Cockpits/25
            x=5956,
            y=1892,
            width=80,
            height=80,

        },
        {
            -- Ships/Parts/Cockpits/26
            x=6680,
            y=1372,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/27
            x=6604,
            y=504,
            width=124,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 122,
            sourceHeight = 124
        },
        {
            -- Ships/Parts/Cockpits/28
            x=6900,
            y=824,
            width=96,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/29
            x=5952,
            y=1212,
            width=96,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Cockpits/3
            x=6840,
            y=528,
            width=124,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 122,
            sourceHeight = 124
        },
        {
            -- Ships/Parts/Cockpits/30
            x=7324,
            y=1136,
            width=84,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/31
            x=6164,
            y=1564,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/32
            x=8040,
            y=596,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 152
        },
        {
            -- Ships/Parts/Cockpits/4
            x=6796,
            y=1108,
            width=96,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/5
            x=5944,
            y=1380,
            width=96,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 94,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Cockpits/6
            x=7412,
            y=984,
            width=84,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/7
            x=6264,
            y=1564,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/8
            x=5864,
            y=756,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 152
        },
        {
            -- Ships/Parts/Cockpits/9
            x=6056,
            y=1964,
            width=80,
            height=80,

        },
        {
            -- Ships/Parts/Cockpits/Bases/1
            x=3420,
            y=2120,
            width=76,
            height=112,

        },
        {
            -- Ships/Parts/Cockpits/Bases/10
            x=7836,
            y=1112,
            width=76,
            height=112,

        },
        {
            -- Ships/Parts/Cockpits/Bases/11
            x=7228,
            y=992,
            width=68,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/12
            x=6908,
            y=1124,
            width=96,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/13
            x=6280,
            y=1724,
            width=72,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/Bases/14
            x=6780,
            y=1372,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/Bases/15
            x=6744,
            y=504,
            width=80,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/16
            x=7288,
            y=836,
            width=92,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 132
        },
        {
            -- Ships/Parts/Cockpits/Bases/17
            x=5896,
            y=608,
            width=120,
            height=132,

        },
        {
            -- Ships/Parts/Cockpits/Bases/18
            x=6460,
            y=636,
            width=104,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/Bases/2
            x=5824,
            y=2316,
            width=68,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/3
            x=7116,
            y=992,
            width=96,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/4
            x=6364,
            y=1564,
            width=72,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Cockpits/Bases/5
            x=6880,
            y=1372,
            width=84,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 114
        },
        {
            -- Ships/Parts/Cockpits/Bases/6
            x=5728,
            y=2316,
            width=80,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 126
        },
        {
            -- Ships/Parts/Cockpits/Bases/7
            x=7588,
            y=980,
            width=92,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 132
        },
        {
            -- Ships/Parts/Cockpits/Bases/8
            x=6032,
            y=596,
            width=120,
            height=132,

        },
        {
            -- Ships/Parts/Cockpits/Bases/9
            x=6580,
            y=644,
            width=104,
            height=136,

        },
        {
            -- Ships/Parts/Cockpits/Glass/1
            x=7408,
            y=2392,
            width=28,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/Glass/10
            x=6360,
            y=2232,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/11
            x=7372,
            y=2116,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/12
            x=7728,
            y=2136,
            width=52,
            height=52,

        },
        {
            -- Ships/Parts/Cockpits/Glass/13
            x=1204,
            y=2512,
            width=32,
            height=32,

        },
        {
            -- Ships/Parts/Cockpits/Glass/14
            x=7688,
            y=2360,
            width=28,
            height=60,

        },
        {
            -- Ships/Parts/Cockpits/Glass/15
            x=7732,
            y=2360,
            width=28,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 60
        },
        {
            -- Ships/Parts/Cockpits/Glass/16
            x=7192,
            y=2416,
            width=36,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 52
        },
        {
            -- Ships/Parts/Cockpits/Glass/17
            x=7376,
            y=2044,
            width=28,
            height=56,

        },
        {
            -- Ships/Parts/Cockpits/Glass/18
            x=7420,
            y=2036,
            width=48,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 58
        },
        {
            -- Ships/Parts/Cockpits/Glass/19
            x=548,
            y=2484,
            width=44,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 60
        },
        {
            -- Ships/Parts/Cockpits/Glass/2
            x=7192,
            y=2484,
            width=28,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 26,
            sourceHeight = 60
        },
        {
            -- Ships/Parts/Cockpits/Glass/20
            x=6944,
            y=2336,
            width=36,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/21
            x=7652,
            y=2364,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/22
            x=7700,
            y=2436,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/23
            x=7736,
            y=2436,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/24
            x=7772,
            y=2436,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/25
            x=7600,
            y=2296,
            width=52,
            height=52,

        },
        {
            -- Ships/Parts/Cockpits/Glass/26
            x=1252,
            y=2512,
            width=32,
            height=32,

        },
        {
            -- Ships/Parts/Cockpits/Glass/3
            x=7236,
            y=2484,
            width=36,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 52
        },
        {
            -- Ships/Parts/Cockpits/Glass/4
            x=7364,
            y=2424,
            width=28,
            height=56,

        },
        {
            -- Ships/Parts/Cockpits/Glass/5
            x=7540,
            y=2144,
            width=48,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 58
        },
        {
            -- Ships/Parts/Cockpits/Glass/6
            x=7796,
            y=2136,
            width=44,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 60
        },
        {
            -- Ships/Parts/Cockpits/Glass/7
            x=6956,
            y=2252,
            width=36,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/8
            x=7808,
            y=2444,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Cockpits/Glass/9
            x=7844,
            y=2444,
            width=20,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Engines/1
            x=6552,
            y=2148,
            width=76,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 46
        },
        {
            -- Ships/Parts/Engines/2
            x=5956,
            y=1988,
            width=84,
            height=56,

        },
        {
            -- Ships/Parts/Engines/3
            x=6828,
            y=1992,
            width=56,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 48
        },
        {
            -- Ships/Parts/Engines/4
            x=7024,
            y=1260,
            width=100,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 90
        },
        {
            -- Ships/Parts/Engines/5
            x=6052,
            y=1880,
            width=88,
            height=48,

        },
        {
            -- Ships/Parts/Engines/6
            x=6864,
            y=1504,
            width=72,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 132
        },
        {
            -- Ships/Parts/Engines/7
            x=5628,
            y=2176,
            width=88,
            height=124,

        },
        {
            -- Ships/Parts/Engines/8
            x=5752,
            y=1904,
            width=84,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 132
        },
        {
            -- Ships/Parts/Engines/9
            x=7664,
            y=1620,
            width=60,
            height=96,

        },
        {
            -- Ships/Parts/Guns/1
            x=6560,
            y=2396,
            width=32,
            height=72,

        },
        {
            -- Ships/Parts/Guns/10
            x=6332,
            y=2316,
            width=44,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 82
        },
        {
            -- Ships/Parts/Guns/11
            x=6352,
            y=2416,
            width=44,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 82
        },
        {
            -- Ships/Parts/Guns/12
            x=8152,
            y=2268,
            width=24,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 22,
            sourceHeight = 64
        },
        {
            -- Ships/Parts/Guns/13
            x=6392,
            y=2324,
            width=36,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 76
        },
        {
            -- Ships/Parts/Guns/14
            x=7984,
            y=2212,
            width=32,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 30,
            sourceHeight = 64
        },
        {
            -- Ships/Parts/Guns/15
            x=6412,
            y=2416,
            width=36,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 84
        },
        {
            -- Ships/Parts/Guns/2
            x=7796,
            y=2212,
            width=36,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 66
        },
        {
            -- Ships/Parts/Guns/3
            x=8036,
            y=2280,
            width=28,
            height=72,

        },
        {
            -- Ships/Parts/Guns/4
            x=6488,
            y=2304,
            width=32,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 82
        },
        {
            -- Ships/Parts/Guns/5
            x=7488,
            y=2108,
            width=36,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 76
        },
        {
            -- Ships/Parts/Guns/6
            x=6464,
            y=2416,
            width=28,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 82
        },
        {
            -- Ships/Parts/Guns/7
            x=5852,
            y=1904,
            width=20,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 20,
            sourceHeight = 94
        },
        {
            -- Ships/Parts/Guns/8
            x=6216,
            y=2316,
            width=40,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Guns/9
            x=6228,
            y=2436,
            width=40,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 104
        },
        {
            -- Ships/Parts/Others/1
            x=7288,
            y=2484,
            width=36,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 50
        },
        {
            -- Ships/Parts/Others/2
            x=2608,
            y=2156,
            width=48,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 46,
            sourceHeight = 42
        },
        {
            -- Ships/Parts/Others/3
            x=2052,
            y=2088,
            width=44,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 36
        },
        {
            -- Ships/Parts/Others/4
            x=7928,
            y=2212,
            width=40,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Others/5
            x=7076,
            y=2240,
            width=56,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 62
        },
        {
            -- Ships/Parts/Scratches/1
            x=7928,
            y=2292,
            width=48,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 46
        },
        {
            -- Ships/Parts/Scratches/2
            x=6356,
            y=2516,
            width=32,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 26
        },
        {
            -- Ships/Parts/Wings/1
            x=6368,
            y=1724,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 144
        },
        {
            -- Ships/Parts/Wings/10
            x=6400,
            y=952,
            width=52,
            height=168,

        },
        {
            -- Ships/Parts/Wings/11
            x=5472,
            y=868,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/12
            x=2416,
            y=2256,
            width=84,
            height=160,

        },
        {
            -- Ships/Parts/Wings/13
            x=6052,
            y=1724,
            width=104,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 138
        },
        {
            -- Ships/Parts/Wings/14
            x=6060,
            y=1044,
            width=84,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/15
            x=5124,
            y=1080,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 166
        },
        {
            -- Ships/Parts/Wings/16
            x=5724,
            y=1212,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 156
        },
        {
            -- Ships/Parts/Wings/17
            x=7424,
            y=1136,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/18
            x=3708,
            y=2216,
            width=100,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 140
        },
        {
            -- Ships/Parts/Wings/19
            x=6684,
            y=804,
            width=100,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 134
        },
        {
            -- Ships/Parts/Wings/2
            x=6400,
            y=1136,
            width=52,
            height=168,

        },
        {
            -- Ships/Parts/Wings/20
            x=7020,
            y=976,
            width=80,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/21
            x=6584,
            y=944,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/22
            x=6336,
            y=1400,
            width=76,
            height=148,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 146
        },
        {
            -- Ships/Parts/Wings/23
            x=2384,
            y=1968,
            width=56,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 168
        },
        {
            -- Ships/Parts/Wings/24
            x=5856,
            y=1720,
            width=72,
            height=160,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 158
        },
        {
            -- Ships/Parts/Wings/25
            x=2680,
            y=1988,
            width=88,
            height=164,

        },
        {
            -- Ships/Parts/Wings/26
            x=2036,
            y=2140,
            width=68,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 172
        },
        {
            -- Ships/Parts/Wings/27
            x=5724,
            y=1384,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/28
            x=6312,
            y=884,
            width=72,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/29
            x=6428,
            y=1392,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 144
        },
        {
            -- Ships/Parts/Wings/3
            x=5708,
            y=1044,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/30
            x=6544,
            y=1504,
            width=52,
            height=168,

        },
        {
            -- Ships/Parts/Wings/31
            x=5828,
            y=1044,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/32
            x=2516,
            y=2256,
            width=84,
            height=160,

        },
        {
            -- Ships/Parts/Wings/33
            x=6700,
            y=648,
            width=104,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 138
        },
        {
            -- Ships/Parts/Wings/34
            x=6064,
            y=1212,
            width=84,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/35
            x=3300,
            y=2248,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 166
        },
        {
            -- Ships/Parts/Wings/36
            x=5840,
            y=1548,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 156
        },
        {
            -- Ships/Parts/Wings/37
            x=6452,
            y=1552,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/38
            x=6452,
            y=788,
            width=100,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 140
        },
        {
            -- Ships/Parts/Wings/39
            x=6684,
            y=956,
            width=100,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 134
        },
        {
            -- Ships/Parts/Wings/4
            x=5624,
            y=1396,
            width=84,
            height=160,

        },
        {
            -- Ships/Parts/Wings/40
            x=5560,
            y=1896,
            width=80,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/41
            x=7188,
            y=832,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/42
            x=7516,
            y=1132,
            width=76,
            height=148,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 146
        },
        {
            -- Ships/Parts/Wings/43
            x=2608,
            y=1972,
            width=56,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 168
        },
        {
            -- Ships/Parts/Wings/44
            x=6164,
            y=1212,
            width=72,
            height=160,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 158
        },
        {
            -- Ships/Parts/Wings/45
            x=5604,
            y=1036,
            width=88,
            height=164,

        },
        {
            -- Ships/Parts/Wings/46
            x=5520,
            y=1036,
            width=68,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 172
        },
        {
            -- Ships/Parts/Wings/47
            x=5948,
            y=1548,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/48
            x=6312,
            y=1056,
            width=72,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/49
            x=6460,
            y=1712,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 144
        },
        {
            -- Ships/Parts/Wings/5
            x=6820,
            y=668,
            width=104,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 138
        },
        {
            -- Ships/Parts/Wings/50
            x=6612,
            y=1504,
            width=52,
            height=168,

        },
        {
            -- Ships/Parts/Wings/51
            x=5832,
            y=1212,
            width=104,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 102,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/52
            x=5740,
            y=1556,
            width=84,
            height=160,

        },
        {
            -- Ships/Parts/Wings/53
            x=6940,
            y=668,
            width=104,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 138
        },
        {
            -- Ships/Parts/Wings/54
            x=6160,
            y=1044,
            width=84,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/55
            x=3404,
            y=2248,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 166
        },
        {
            -- Ships/Parts/Wings/56
            x=5944,
            y=1720,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 156
        },
        {
            -- Ships/Parts/Wings/57
            x=6680,
            y=1504,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/58
            x=6468,
            y=944,
            width=100,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 140
        },
        {
            -- Ships/Parts/Wings/59
            x=6468,
            y=1100,
            width=100,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 134
        },
        {
            -- Ships/Parts/Wings/6
            x=6800,
            y=824,
            width=84,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 84,
            sourceHeight = 150
        },
        {
            -- Ships/Parts/Wings/60
            x=5656,
            y=1900,
            width=80,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/61
            x=7700,
            y=1120,
            width=84,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 142
        },
        {
            -- Ships/Parts/Wings/62
            x=7608,
            y=1128,
            width=76,
            height=148,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 146
        },
        {
            -- Ships/Parts/Wings/63
            x=7116,
            y=808,
            width=56,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 168
        },
        {
            -- Ships/Parts/Wings/64
            x=6164,
            y=1388,
            width=72,
            height=160,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 158
        },
        {
            -- Ships/Parts/Wings/65
            x=5636,
            y=1572,
            width=88,
            height=164,

        },
        {
            -- Ships/Parts/Wings/66
            x=5540,
            y=1224,
            width=68,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 172
        },
        {
            -- Ships/Parts/Wings/67
            x=6056,
            y=1380,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/68
            x=6312,
            y=1228,
            width=72,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 154
        },
        {
            -- Ships/Parts/Wings/7
            x=5520,
            y=580,
            width=88,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 166
        },
        {
            -- Ships/Parts/Wings/8
            x=6056,
            y=1552,
            width=92,
            height=156,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 156
        },
        {
            -- Ships/Parts/Wings/9
            x=6772,
            y=1504,
            width=76,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 144
        },
        {
            -- Stations/1
            x=12,
            y=1848,
            width=248,
            height=696,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 248,
            sourceHeight = 694
        },
        {
            -- Stations/10
            x=5144,
            y=484,
            width=348,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 346,
            sourceHeight = 80
        },
        {
            -- Stations/11
            x=6476,
            y=408,
            width=348,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 346,
            sourceHeight = 80
        },
        {
            -- Stations/2
            x=1444,
            y=472,
            width=348,
            height=580,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 346,
            sourceHeight = 578
        },
        {
            -- Stations/3
            x=12,
            y=1032,
            width=552,
            height=800,

        },
        {
            -- Stations/4
            x=7200,
            y=408,
            width=336,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 336,
            sourceHeight = 78
        },
        {
            -- Stations/5
            x=7552,
            y=408,
            width=336,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 336,
            sourceHeight = 78
        },
        {
            -- Stations/6
            x=4284,
            y=564,
            width=332,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 332,
            sourceHeight = 134
        },
        {
            -- Stations/7
            x=4632,
            y=564,
            width=332,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 332,
            sourceHeight = 134
        },
        {
            -- Stations/8
            x=6840,
            y=408,
            width=344,
            height=104,

        },
        {
            -- Stations/9
            x=1808,
            y=960,
            width=348,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 346,
            sourceHeight = 104
        },
        {
            -- Stations/Parts/1
            x=6952,
            y=1504,
            width=36,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 132
        },
        {
            -- Stations/Parts/10
            x=7176,
            y=2040,
            width=84,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 56
        },
        {
            -- Stations/Parts/11
            x=7276,
            y=2044,
            width=84,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 56
        },
        {
            -- Stations/Parts/12
            x=7284,
            y=1940,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/13
            x=7764,
            y=1940,
            width=76,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 74,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/14
            x=7948,
            y=1724,
            width=68,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/15
            x=8028,
            y=1620,
            width=68,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/16
            x=2404,
            y=2152,
            width=36,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 34,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/17
            x=6284,
            y=2420,
            width=52,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/18
            x=7468,
            y=1400,
            width=100,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 98,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/19
            x=8032,
            y=1724,
            width=68,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/2
            x=6832,
            y=2056,
            width=52,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 84
        },
        {
            -- Stations/Parts/20
            x=7336,
            y=732,
            width=116,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/21
            x=7388,
            y=1932,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 88
        },
        {
            -- Stations/Parts/22
            x=3640,
            y=1776,
            width=248,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 246,
            sourceHeight = 90
        },
        {
            -- Stations/Parts/23
            x=3456,
            y=1740,
            width=168,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 166,
            sourceHeight = 90
        },
        {
            -- Stations/Parts/24
            x=7956,
            y=1928,
            width=84,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 80
        },
        {
            -- Stations/Parts/3
            x=6520,
            y=1356,
            width=44,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 132
        },
        {
            -- Stations/Parts/4
            x=3640,
            y=1548,
            width=252,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 116
        },
        {
            -- Stations/Parts/5
            x=7140,
            y=1284,
            width=108,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 68
        },
        {
            -- Stations/Parts/6
            x=1460,
            y=2468,
            width=124,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 122,
            sourceHeight = 76
        },
        {
            -- Stations/Parts/7
            x=3452,
            y=1848,
            width=172,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 72
        },
        {
            -- Stations/Parts/8
            x=3640,
            y=1680,
            width=252,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 80
        },
        {
            -- Stations/Parts/9
            x=7076,
            y=2112,
            width=84,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 56
        },
        {
            -- Turrets/1
            x=7700,
            y=1280,
            width=88,
            height=100,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 100
        },
        {
            -- Turrets/2
            x=5592,
            y=904,
            width=108,
            height=116,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 108,
            sourceHeight = 114
        },
        {
            -- Turrets/3
            x=3676,
            y=2432,
            width=108,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 112
        },
        {
            -- Turrets/Parts/Bases/1
            x=5812,
            y=2460,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Turrets/Parts/Bases/2
            x=3800,
            y=2432,
            width=108,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 108,
            sourceHeight = 110
        },
        {
            -- Turrets/Parts/Bases/3
            x=7856,
            y=1928,
            width=84,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 82
        },
        {
            -- Turrets/Parts/Bases/4
            x=7268,
            y=2352,
            width=56,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 54
        },
        {
            -- Turrets/Parts/Cannos/1
            x=7488,
            y=2200,
            width=36,
            height=76,

        },
        {
            -- Turrets/Parts/Cannos/2
            x=6464,
            y=2204,
            width=56,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 82
        },
        {
            -- Turrets/Parts/Cannos/3
            x=6536,
            y=2296,
            width=56,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 54,
            sourceHeight = 82
        },
        {
            -- UFOs/1
            x=3624,
            y=2016,
            width=184,
            height=184,

        },
        {
            -- UFOs/2
            x=3904,
            y=1948,
            width=184,
            height=184,

        },
        {
            -- UFOs/3
            x=4104,
            y=2064,
            width=184,
            height=184,

        },
        {
            -- UFOs/4
            x=3904,
            y=2148,
            width=184,
            height=184,

        },
        {
            -- UI/Bar-corners/1/3-slices/1
            x=2172,
            y=960,
            width=12,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 35
        },
        {
            -- UI/Bar-corners/1/3-slices/2
            x=4104,
            y=1948,
            width=4,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 3,
            sourceHeight = 35
        },
        {
            -- UI/Bar-corners/1/3-slices/3
            x=3216,
            y=1856,
            width=16,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 35
        },
        {
            -- UI/Bar-corners/2/3-slices/1
            x=1388,
            y=1968,
            width=12,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 36
        },
        {
            -- UI/Bar-corners/2/3-slices/2
            x=5312,
            y=2172,
            width=4,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 36
        },
        {
            -- UI/Bar-corners/2/3-slices/3
            x=4500,
            y=2092,
            width=16,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 36
        },
        {
            -- UI/Bar-corners/3/3-slices/1
            x=5064,
            y=2464,
            width=12,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 34
        },
        {
            -- UI/Bar-corners/3/3-slices/2
            x=2384,
            y=2152,
            width=4,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 34
        },
        {
            -- UI/Bar-corners/3/3-slices/3
            x=8160,
            y=596,
            width=16,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 34
        },
        {
            -- UI/Bar-corners/4/3-slices/1
            x=2008,
            y=1788,
            width=12,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 35
        },
        {
            -- UI/Bar-corners/4/3-slices/2
            x=4104,
            y=2000,
            width=4,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 35
        },
        {
            -- UI/Bar-corners/4/3-slices/3
            x=6684,
            y=1828,
            width=16,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 14,
            sourceHeight = 35
        },
        {
            -- UI/Bars/1/9-slices/1
            x=2008,
            y=1928,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/1/9-slices/2
            x=3904,
            y=2348,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 11
        },
        {
            -- UI/Bars/1/9-slices/3
            x=7856,
            y=2184,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/1/9-slices/4
            x=5588,
            y=464,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/Bars/1/9-slices/5
            x=5844,
            y=904,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 3,
            sourceHeight = 3
        },
        {
            -- UI/Bars/1/9-slices/6
            x=6980,
            y=2232,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/Bars/1/9-slices/7
            x=2204,
            y=1940,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/1/9-slices/8
            x=5500,
            y=1036,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 11
        },
        {
            -- UI/Bars/1/9-slices/9
            x=5472,
            y=1036,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/2/9-slices/1
            x=4500,
            y=2144,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/2/9-slices/2
            x=7900,
            y=2476,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 11
        },
        {
            -- UI/Bars/2/9-slices/3
            x=7928,
            y=2184,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 11
        },
        {
            -- UI/Bars/2/9-slices/4
            x=8160,
            y=744,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/5
            x=6820,
            y=648,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/6
            x=1364,
            y=2520,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 2
        },
        {
            -- UI/Bars/2/9-slices/7
            x=5444,
            y=860,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/2/9-slices/8
            x=8100,
            y=2408,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/Bars/2/9-slices/9
            x=7444,
            y=2480,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/1
            x=7472,
            y=2480,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/2
            x=7600,
            y=2508,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/3
            x=8160,
            y=680,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/4
            x=1372,
            y=2540,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/Bars/3/9-slices/5
            x=6800,
            y=804,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 3,
            sourceHeight = 2
        },
        {
            -- UI/Bars/3/9-slices/6
            x=1392,
            y=2520,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 3
        },
        {
            -- UI/Bars/3/9-slices/7
            x=1336,
            y=2512,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/8
            x=7620,
            y=2504,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/Bars/3/9-slices/9
            x=6476,
            y=2516,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/4/9-slices/1
            x=7016,
            y=2528,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/Bars/4/9-slices/2
            x=7880,
            y=2516,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/Bars/4/9-slices/3
            x=7044,
            y=2532,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/Bars/4/9-slices/4
            x=1400,
            y=2540,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/5
            x=6620,
            y=2212,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/6
            x=1420,
            y=2520,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 2
        },
        {
            -- UI/Bars/4/9-slices/7
            x=7072,
            y=2532,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/Bars/4/9-slices/8
            x=7944,
            y=2448,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 11
        },
        {
            -- UI/Bars/4/9-slices/9
            x=7100,
            y=2532,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 11
        },
        {
            -- UI/Buttons/1/9-slices/1
            x=8164,
            y=960,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/2
            x=6224,
            y=2160,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/3
            x=6680,
            y=1664,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/4
            x=5064,
            y=2516,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/1/9-slices/5
            x=1640,
            y=2156,
            width=4,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/1/9-slices/6
            x=8164,
            y=360,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/1/9-slices/7
            x=1068,
            y=2536,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/8
            x=1640,
            y=2244,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/1/9-slices/9
            x=6824,
            y=2536,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/1
            x=1096,
            y=2536,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/2
            x=8092,
            y=2256,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/3
            x=1124,
            y=2536,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/4
            x=1388,
            y=2020,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/2/9-slices/5
            x=1640,
            y=2200,
            width=4,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/2/9-slices/6
            x=2008,
            y=1840,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/2/9-slices/7
            x=8120,
            y=2396,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/8
            x=7580,
            y=2508,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/2/9-slices/9
            x=8120,
            y=2420,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/1
            x=8148,
            y=2420,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/2
            x=7976,
            y=2504,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/3
            x=7500,
            y=2464,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/4
            x=2008,
            y=1884,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/3/9-slices/5
            x=1640,
            y=2156,
            width=4,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/3/9-slices/6
            x=3912,
            y=1168,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/3/9-slices/7
            x=7500,
            y=2488,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/8
            x=8008,
            y=2472,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/3/9-slices/9
            x=7500,
            y=2512,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/1
            x=7500,
            y=2536,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/2
            x=7996,
            y=2504,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/3
            x=7528,
            y=2484,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/4
            x=8164,
            y=872,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/4/9-slices/5
            x=1640,
            y=2156,
            width=4,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/4/9-slices/6
            x=8164,
            y=916,
            width=12,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 26
        },
        {
            -- UI/Buttons/4/9-slices/7
            x=7528,
            y=2508,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/8
            x=7996,
            y=2528,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Buttons/4/9-slices/9
            x=7556,
            y=2484,
            width=12,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 8
        },
        {
            -- UI/Crossairs/1
            x=6152,
            y=1964,
            width=80,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 78
        },
        {
            -- UI/Crossairs/2
            x=6248,
            y=1968,
            width=80,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 78
        },
        {
            -- UI/Crossairs/3
            x=7920,
            y=1532,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 86
        },
        {
            -- UI/Crossairs/4
            x=7740,
            y=1628,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 86
        },
        {
            -- UI/Crossairs/5
            x=6224,
            y=2064,
            width=80,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 78,
            sourceHeight = 78
        },
        {
            -- UI/Crossairs/6
            x=6984,
            y=2060,
            width=76,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 76,
            sourceHeight = 74
        },
        {
            -- UI/Crossairs/7
            x=7740,
            y=1732,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 86
        },
        {
            -- UI/Crossairs/8
            x=7844,
            y=1724,
            width=88,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 86
        },
        {
            -- UI/Cursors/1
            x=5404,
            y=1964,
            width=140,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 138,
            sourceHeight = 138
        },
        {
            -- UI/Cursors/2
            x=4176,
            y=2432,
            width=96,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 110
        },
        {
            -- UI/Cursors/3
            x=7464,
            y=848,
            width=96,
            height=120,

        },
        {
            -- UI/Cursors/4
            x=2120,
            y=2088,
            width=96,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 110
        },
        {
            -- UI/Cursors/5
            x=7696,
            y=984,
            width=96,
            height=120,

        },
        {
            -- UI/Cursors/6
            x=6980,
            y=528,
            width=120,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 118,
            sourceHeight = 122
        },
        {
            -- UI/Dots/1
            x=6928,
            y=2496,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/Dots/2
            x=6568,
            y=2496,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/Dots/3
            x=6636,
            y=2496,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/Dots/4
            x=7120,
            y=2400,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/Dots/5
            x=7668,
            y=2296,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/Dots/6
            x=7736,
            y=2296,
            width=52,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 48
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/1
            x=5852,
            y=2016,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/2
            x=8092,
            y=2220,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/3
            x=1228,
            y=1700,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/4
            x=1228,
            y=1736,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/6
            x=4992,
            y=900,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/7
            x=1416,
            y=2268,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/8
            x=7540,
            y=2108,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBL/9-slices/9
            x=4488,
            y=1760,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/1
            x=5592,
            y=868,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/2
            x=8160,
            y=708,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/3
            x=6468,
            y=1356,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/4
            x=5028,
            y=900,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/6
            x=5064,
            y=900,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/7
            x=6284,
            y=2524,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/8
            x=7804,
            y=1272,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerBR/9-slices/9
            x=6320,
            y=2524,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/1
            x=6824,
            y=2500,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/2
            x=7804,
            y=1308,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/3
            x=3000,
            y=1816,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/4
            x=6052,
            y=1944,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/6
            x=6088,
            y=1944,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/7
            x=5272,
            y=1584,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/8
            x=7880,
            y=2444,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTL/9-slices/9
            x=1300,
            y=2512,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/1
            x=6400,
            y=1320,
            width=52,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/2
            x=2012,
            y=1564,
            width=8,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/3
            x=7340,
            y=2352,
            width=52,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/4
            x=872,
            y=2536,
            width=52,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 6
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/5
            x=7148,
            y=2240,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 6
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/6
            x=940,
            y=2536,
            width=52,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 6
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/7
            x=7540,
            y=2220,
            width=52,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/8
            x=1808,
            y=472,
            width=8,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-cornerTR/9-slices/9
            x=7532,
            y=2292,
            width=52,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 51,
            sourceHeight = 54
        },
        {
            -- UI/GlassPanel-corners/9-slices/1
            x=6404,
            y=2516,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-corners/9-slices/2
            x=7804,
            y=1308,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-corners/9-slices/3
            x=6440,
            y=2516,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-corners/9-slices/4
            x=7800,
            y=1252,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/6
            x=1336,
            y=2540,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-corners/9-slices/7
            x=7408,
            y=2468,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-corners/9-slices/8
            x=7880,
            y=2444,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-corners/9-slices/9
            x=7892,
            y=2368,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-empty/9-slices/1
            x=7928,
            y=2356,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-empty/9-slices/2
            x=7944,
            y=2476,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-empty/9-slices/3
            x=7888,
            y=2404,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-empty/9-slices/4
            x=1428,
            y=2540,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/5
            x=1388,
            y=2064,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/6
            x=7608,
            y=2484,
            width=12,
            height=4,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-empty/9-slices/7
            x=8116,
            y=2360,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-empty/9-slices/8
            x=7988,
            y=2448,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 2,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-empty/9-slices/9
            x=8152,
            y=2348,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 18
        },
        {
            -- UI/GlassPanel-projection/9-slices/1
            x=7928,
            y=2392,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-projection/9-slices/2
            x=7880,
            y=2480,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-projection/9-slices/3
            x=7964,
            y=2384,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-projection/9-slices/4
            x=7800,
            y=1252,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/6
            x=1336,
            y=2540,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel-projection/9-slices/7
            x=8000,
            y=2372,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-projection/9-slices/8
            x=7900,
            y=2440,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel-projection/9-slices/9
            x=8036,
            y=2368,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/1
            x=8072,
            y=2372,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/2
            x=8160,
            y=708,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/3
            x=8152,
            y=2384,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/4
            x=5028,
            y=900,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/6
            x=5064,
            y=900,
            width=20,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 2
        },
        {
            -- UI/GlassPanel/9-slices/7
            x=8000,
            y=2408,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/8
            x=7804,
            y=1272,
            width=4,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 17
        },
        {
            -- UI/GlassPanel/9-slices/9
            x=8036,
            y=2404,
            width=20,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 17
        },
        {
            -- UI/Icons/ChampionCup
            x=2412,
            y=2432,
            width=132,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 129,
            sourceHeight = 112
        },
        {
            -- UI/Icons/FB/1
            x=3908,
            y=1484,
            width=28,
            height=52,

        },
        {
            -- UI/Icons/Hearts/1
            x=2120,
            y=2216,
            width=108,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 108,
            sourceHeight = 94
        },
        {
            -- UI/Icons/Hearts/2
            x=2852,
            y=2432,
            width=124,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 124,
            sourceHeight = 110
        },
        {
            -- UI/Icons/Hearts/3
            x=2992,
            y=2432,
            width=124,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 124,
            sourceHeight = 110
        },
        {
            -- UI/Icons/Hearts/4
            x=3132,
            y=2432,
            width=124,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 124,
            sourceHeight = 110
        },
        {
            -- UI/Icons/JoyStickRight
            x=2796,
            y=2140,
            width=124,
            height=140,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 121,
            sourceHeight = 140
        },
        {
            -- UI/Icons/Stars/1
            x=7336,
            y=592,
            width=116,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 124
        },
        {
            -- UI/Icons/Stars/2
            x=4320,
            y=1540,
            width=152,
            height=156,

        },
        {
            -- UI/Icons/Stars/3
            x=5716,
            y=904,
            width=112,
            height=124,

        },
        {
            -- UI/Icons/Stars/4
            x=6272,
            y=592,
            width=112,
            height=124,

        },
        {
            -- UI/Icons/Stars/5
            x=4536,
            y=1760,
            width=152,
            height=156,

        },
        {
            -- UI/Icons/Stars/6
            x=7468,
            y=592,
            width=116,
            height=124,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 114,
            sourceHeight = 124
        },
        {
            -- UI/Icons/Stars/7
            x=7812,
            y=872,
            width=104,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 102
        },
        {
            -- UI/Icons/Stars/8
            x=7932,
            y=872,
            width=104,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 102
        },
        {
            -- UI/Icons/Stars/9
            x=7808,
            y=992,
            width=104,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 104,
            sourceHeight = 102
        },
        {
            -- UI/Icons/ThreePlayers
            x=3456,
            y=1612,
            width=168,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 165,
            sourceHeight = 112
        },
        {
            -- UI/Icons/TriangleRight
            x=5628,
            y=2316,
            width=84,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 81,
            sourceHeight = 128
        },
        {
            -- UI/Icons/enter
            x=2708,
            y=2432,
            width=128,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 125,
            sourceHeight = 112
        },
        {
            -- UI/Icons/leaderBoard
            x=1776,
            y=2340,
            width=140,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 137,
            sourceHeight = 112
        },
        {
            -- UI/Icons/oneUser
            x=1976,
            y=2328,
            width=116,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 113,
            sourceHeight = 128
        },
        {
            -- UI/Icons/pause
            x=7600,
            y=592,
            width=116,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 113,
            sourceHeight = 128
        },
        {
            -- UI/Icons/rotate
            x=2560,
            y=2432,
            width=132,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 129,
            sourceHeight = 112
        },
        {
            -- UI/KeyPanel/9-slices/1
            x=7952,
            y=2428,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/2
            x=8088,
            y=2532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/3
            x=7952,
            y=2428,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/4
            x=8112,
            y=2516,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/5
            x=6520,
            y=1532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/6
            x=8112,
            y=2516,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 2
        },
        {
            -- UI/KeyPanel/9-slices/7
            x=7952,
            y=2428,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/8
            x=8088,
            y=2532,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 1
        },
        {
            -- UI/KeyPanel/9-slices/9
            x=7952,
            y=2428,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1,
            sourceHeight = 1
        },
        {
            -- UI/MetalBottomPanel/9-slices/1
            x=7532,
            y=2424,
            width=44,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 42
        },
        {
            -- UI/MetalBottomPanel/9-slices/2
            x=4680,
            y=2172,
            width=8,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 42
        },
        {
            -- UI/MetalBottomPanel/9-slices/3
            x=7592,
            y=2424,
            width=44,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 42
        },
        {
            -- UI/MetalBottomPanel/9-slices/4
            x=2936,
            y=2120,
            width=44,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 6
        },
        {
            -- UI/MetalBottomPanel/9-slices/5
            x=6296,
            y=2188,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 6
        },
        {
            -- UI/MetalBottomPanel/9-slices/6
            x=1008,
            y=2536,
            width=44,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 6
        },
        {
            -- UI/MetalBottomPanel/9-slices/7
            x=7244,
            y=2424,
            width=44,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 42
        },
        {
            -- UI/MetalBottomPanel/9-slices/8
            x=580,
            y=1788,
            width=12,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 9,
            sourceHeight = 42
        },
        {
            -- UI/MetalBottomPanel/9-slices/9
            x=7304,
            y=2424,
            width=44,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 42
        },
        {
            -- UI/MetalPanel-plate/9-slices/1
            x=7128,
            y=2532,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 11
        },
        {
            -- UI/MetalPanel-plate/9-slices/2
            x=7988,
            y=2476,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 11
        },
        {
            -- UI/MetalPanel-plate/9-slices/3
            x=7156,
            y=2532,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 11
        },
        {
            -- UI/MetalPanel-plate/9-slices/4
            x=7924,
            y=2428,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/5
            x=8132,
            y=2516,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/6
            x=7900,
            y=2504,
            width=12,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel-plate/9-slices/7
            x=7964,
            y=2356,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 10,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel-plate/9-slices/8
            x=8008,
            y=2444,
            width=4,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel-plate/9-slices/9
            x=8072,
            y=2408,
            width=12,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 11,
            sourceHeight = 10
        },
        {
            -- UI/MetalPanel/9-slices/1
            x=3212,
            y=1632,
            width=16,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/MetalPanel/9-slices/2
            x=1748,
            y=1392,
            width=4,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/MetalPanel/9-slices/3
            x=3268,
            y=2248,
            width=16,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/MetalPanel/9-slices/4
            x=5740,
            y=1732,
            width=16,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/5
            x=8152,
            y=2516,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/6
            x=6124,
            y=1944,
            width=16,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 2
        },
        {
            -- UI/MetalPanel/9-slices/7
            x=5412,
            y=860,
            width=16,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/MetalPanel/9-slices/8
            x=6996,
            y=2528,
            width=4,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 13
        },
        {
            -- UI/MetalPanel/9-slices/9
            x=8160,
            y=648,
            width=16,
            height=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 13,
            sourceHeight = 13
        },
        {
            -- UI/Numeral/0
            x=7452,
            y=1504,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/1
            x=7380,
            y=1612,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/2
            x=7384,
            y=1720,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/3
            x=7560,
            y=1508,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/4
            x=7556,
            y=1616,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/5
            x=7556,
            y=1724,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/6
            x=7176,
            y=1932,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/7
            x=7656,
            y=1836,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/8
            x=7656,
            y=1944,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/9
            x=7812,
            y=1344,
            width=92,
            height=92,

        },
        {
            -- UI/Numeral/x
            x=7956,
            y=1828,
            width=84,
            height=84,

        },
        {
            -- UI/Parts/glassPanel_tab_1
            x=7556,
            y=2508,
            width=8,
            height=8,

        },
        {
            -- UI/Parts/glassPanel_tab_2
            x=8028,
            y=2444,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Parts/glassPanel_tab_3
            x=7584,
            y=2484,
            width=8,
            height=8,

        },
        {
            -- UI/Parts/glassPanel_tab_4
            x=1808,
            y=544,
            width=8,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 2
        },
        {
            -- UI/Parts/glassPanel_tab_5
            x=8172,
            y=2516,
            width=4,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 3,
            sourceHeight = 2
        },
        {
            -- UI/Parts/glassPanel_tab_6
            x=6464,
            y=2304,
            width=8,
            height=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 3
        },
        {
            -- UI/Parts/glassPanel_tab_7
            x=7600,
            y=2536,
            width=8,
            height=8,

        },
        {
            -- UI/Parts/glassPanel_tab_8
            x=8028,
            y=2468,
            width=4,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 8
        },
        {
            -- UI/Parts/glassPanel_tab_9
            x=7640,
            y=2508,
            width=8,
            height=8,

        },
        {
            -- UI/Parts/glassPanel_tabbar_1
            x=6288,
            y=884,
            width=8,
            height=24,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 22
        },
        {
            -- UI/Parts/glassPanel_tabbar_2
            x=4948,
            y=1408,
            width=4,
            height=24,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2,
            sourceHeight = 22
        },
        {
            -- UI/Parts/glassPanel_tabbar_3
            x=5236,
            y=1408,
            width=20,
            height=24,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 22
        },
        {
            -- UI/Player-lifes/1
            x=6552,
            y=2064,
            width=84,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 68
        },
        {
            -- UI/Player-lifes/10
            x=6728,
            y=1888,
            width=84,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 68
        },
        {
            -- UI/Player-lifes/11
            x=6156,
            y=1880,
            width=88,
            height=68,

        },
        {
            -- UI/Player-lifes/12
            x=6732,
            y=1972,
            width=80,
            height=68,

        },
        {
            -- UI/Player-lifes/2
            x=6260,
            y=1884,
            width=88,
            height=68,

        },
        {
            -- UI/Player-lifes/3
            x=7276,
            y=2116,
            width=80,
            height=68,

        },
        {
            -- UI/Player-lifes/4
            x=7076,
            y=2028,
            width=84,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 68
        },
        {
            -- UI/Player-lifes/5
            x=6552,
            y=1980,
            width=88,
            height=68,

        },
        {
            -- UI/Player-lifes/6
            x=7268,
            y=2200,
            width=80,
            height=68,

        },
        {
            -- UI/Player-lifes/7
            x=7176,
            y=2112,
            width=84,
            height=68,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 82,
            sourceHeight = 68
        },
        {
            -- UI/Player-lifes/8
            x=6344,
            y=1980,
            width=88,
            height=68,

        },
        {
            -- UI/Player-lifes/9
            x=7656,
            y=2052,
            width=80,
            height=68,

        },
        {
            -- UI/Squares/1/9-slices/1
            x=7664,
            y=2508,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/1/9-slices/2
            x=7900,
            y=2524,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/1/9-slices/3
            x=7928,
            y=2504,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/1/9-slices/4
            x=1420,
            y=1032,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/1/9-slices/5
            x=6520,
            y=1504,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/1/9-slices/6
            x=4680,
            y=2232,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/1/9-slices/7
            x=7952,
            y=2504,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/1/9-slices/8
            x=7924,
            y=2528,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/1/9-slices/9
            x=7948,
            y=2528,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/1
            x=7972,
            y=2528,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/2
            x=8048,
            y=2440,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/3
            x=8072,
            y=2436,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/4
            x=6296,
            y=2160,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/2/9-slices/5
            x=4680,
            y=2260,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/2/9-slices/6
            x=2172,
            y=1012,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/2/9-slices/7
            x=8096,
            y=2436,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/8
            x=8048,
            y=2464,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/2/9-slices/9
            x=8072,
            y=2460,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/1
            x=8096,
            y=2460,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/2
            x=8120,
            y=2444,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/3
            x=8144,
            y=2444,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/4
            x=2172,
            y=1040,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/3/9-slices/5
            x=7528,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/3/9-slices/6
            x=7552,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/3/9-slices/7
            x=8168,
            y=2444,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/8
            x=8120,
            y=2468,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/3/9-slices/9
            x=8144,
            y=2468,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/1
            x=8168,
            y=2468,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/2
            x=7696,
            y=2520,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/3
            x=7720,
            y=2520,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/4
            x=7576,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/4/9-slices/5
            x=7624,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/4/9-slices/6
            x=7648,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/4/9-slices/7
            x=7744,
            y=2520,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/8
            x=7768,
            y=2520,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/4/9-slices/9
            x=8016,
            y=2496,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/1
            x=8016,
            y=2520,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/2
            x=8048,
            y=2488,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/3
            x=8072,
            y=2484,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/4
            x=7672,
            y=2532,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/5/9-slices/5
            x=7920,
            y=2448,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/5/9-slices/6
            x=7920,
            y=2476,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/5/9-slices/7
            x=8096,
            y=2484,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/8
            x=8040,
            y=2512,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/5/9-slices/9
            x=8040,
            y=2536,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/1
            x=8120,
            y=2492,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/2
            x=8144,
            y=2492,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/3
            x=8168,
            y=2492,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/4
            x=7972,
            y=2420,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/6/9-slices/5
            x=7964,
            y=2448,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 12
        },
        {
            -- UI/Squares/6/9-slices/6
            x=7964,
            y=2476,
            width=8,
            height=12,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 12
        },
        {
            -- UI/Squares/6/9-slices/7
            x=8064,
            y=2512,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/8
            x=8064,
            y=2536,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 6,
            sourceHeight = 7
        },
        {
            -- UI/Squares/6/9-slices/9
            x=8088,
            y=2508,
            width=8,
            height=8,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 7,
            sourceHeight = 7
        },
    },
    
    sheetContentWidth = 8188,
    sheetContentHeight = 2556
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
    ["UI/Icons/ChampionCup"] = 959,
    ["UI/Icons/FB/1"] = 960,
    ["UI/Icons/Hearts/1"] = 961,
    ["UI/Icons/Hearts/2"] = 962,
    ["UI/Icons/Hearts/3"] = 963,
    ["UI/Icons/Hearts/4"] = 964,
    ["UI/Icons/JoyStickRight"] = 965,
    ["UI/Icons/Stars/1"] = 966,
    ["UI/Icons/Stars/2"] = 967,
    ["UI/Icons/Stars/3"] = 968,
    ["UI/Icons/Stars/4"] = 969,
    ["UI/Icons/Stars/5"] = 970,
    ["UI/Icons/Stars/6"] = 971,
    ["UI/Icons/Stars/7"] = 972,
    ["UI/Icons/Stars/8"] = 973,
    ["UI/Icons/Stars/9"] = 974,
    ["UI/Icons/ThreePlayers"] = 975,
    ["UI/Icons/TriangleRight"] = 976,
    ["UI/Icons/enter"] = 977,
    ["UI/Icons/leaderBoard"] = 978,
    ["UI/Icons/oneUser"] = 979,
    ["UI/Icons/pause"] = 980,
    ["UI/Icons/rotate"] = 981,
    ["UI/KeyPanel/9-slices/1"] = 982,
    ["UI/KeyPanel/9-slices/2"] = 983,
    ["UI/KeyPanel/9-slices/3"] = 984,
    ["UI/KeyPanel/9-slices/4"] = 985,
    ["UI/KeyPanel/9-slices/5"] = 986,
    ["UI/KeyPanel/9-slices/6"] = 987,
    ["UI/KeyPanel/9-slices/7"] = 988,
    ["UI/KeyPanel/9-slices/8"] = 989,
    ["UI/KeyPanel/9-slices/9"] = 990,
    ["UI/MetalBottomPanel/9-slices/1"] = 991,
    ["UI/MetalBottomPanel/9-slices/2"] = 992,
    ["UI/MetalBottomPanel/9-slices/3"] = 993,
    ["UI/MetalBottomPanel/9-slices/4"] = 994,
    ["UI/MetalBottomPanel/9-slices/5"] = 995,
    ["UI/MetalBottomPanel/9-slices/6"] = 996,
    ["UI/MetalBottomPanel/9-slices/7"] = 997,
    ["UI/MetalBottomPanel/9-slices/8"] = 998,
    ["UI/MetalBottomPanel/9-slices/9"] = 999,
    ["UI/MetalPanel-plate/9-slices/1"] = 1000,
    ["UI/MetalPanel-plate/9-slices/2"] = 1001,
    ["UI/MetalPanel-plate/9-slices/3"] = 1002,
    ["UI/MetalPanel-plate/9-slices/4"] = 1003,
    ["UI/MetalPanel-plate/9-slices/5"] = 1004,
    ["UI/MetalPanel-plate/9-slices/6"] = 1005,
    ["UI/MetalPanel-plate/9-slices/7"] = 1006,
    ["UI/MetalPanel-plate/9-slices/8"] = 1007,
    ["UI/MetalPanel-plate/9-slices/9"] = 1008,
    ["UI/MetalPanel/9-slices/1"] = 1009,
    ["UI/MetalPanel/9-slices/2"] = 1010,
    ["UI/MetalPanel/9-slices/3"] = 1011,
    ["UI/MetalPanel/9-slices/4"] = 1012,
    ["UI/MetalPanel/9-slices/5"] = 1013,
    ["UI/MetalPanel/9-slices/6"] = 1014,
    ["UI/MetalPanel/9-slices/7"] = 1015,
    ["UI/MetalPanel/9-slices/8"] = 1016,
    ["UI/MetalPanel/9-slices/9"] = 1017,
    ["UI/Numeral/0"] = 1018,
    ["UI/Numeral/1"] = 1019,
    ["UI/Numeral/2"] = 1020,
    ["UI/Numeral/3"] = 1021,
    ["UI/Numeral/4"] = 1022,
    ["UI/Numeral/5"] = 1023,
    ["UI/Numeral/6"] = 1024,
    ["UI/Numeral/7"] = 1025,
    ["UI/Numeral/8"] = 1026,
    ["UI/Numeral/9"] = 1027,
    ["UI/Numeral/x"] = 1028,
    ["UI/Parts/glassPanel_tab_1"] = 1029,
    ["UI/Parts/glassPanel_tab_2"] = 1030,
    ["UI/Parts/glassPanel_tab_3"] = 1031,
    ["UI/Parts/glassPanel_tab_4"] = 1032,
    ["UI/Parts/glassPanel_tab_5"] = 1033,
    ["UI/Parts/glassPanel_tab_6"] = 1034,
    ["UI/Parts/glassPanel_tab_7"] = 1035,
    ["UI/Parts/glassPanel_tab_8"] = 1036,
    ["UI/Parts/glassPanel_tab_9"] = 1037,
    ["UI/Parts/glassPanel_tabbar_1"] = 1038,
    ["UI/Parts/glassPanel_tabbar_2"] = 1039,
    ["UI/Parts/glassPanel_tabbar_3"] = 1040,
    ["UI/Player-lifes/1"] = 1041,
    ["UI/Player-lifes/10"] = 1042,
    ["UI/Player-lifes/11"] = 1043,
    ["UI/Player-lifes/12"] = 1044,
    ["UI/Player-lifes/2"] = 1045,
    ["UI/Player-lifes/3"] = 1046,
    ["UI/Player-lifes/4"] = 1047,
    ["UI/Player-lifes/5"] = 1048,
    ["UI/Player-lifes/6"] = 1049,
    ["UI/Player-lifes/7"] = 1050,
    ["UI/Player-lifes/8"] = 1051,
    ["UI/Player-lifes/9"] = 1052,
    ["UI/Squares/1/9-slices/1"] = 1053,
    ["UI/Squares/1/9-slices/2"] = 1054,
    ["UI/Squares/1/9-slices/3"] = 1055,
    ["UI/Squares/1/9-slices/4"] = 1056,
    ["UI/Squares/1/9-slices/5"] = 1057,
    ["UI/Squares/1/9-slices/6"] = 1058,
    ["UI/Squares/1/9-slices/7"] = 1059,
    ["UI/Squares/1/9-slices/8"] = 1060,
    ["UI/Squares/1/9-slices/9"] = 1061,
    ["UI/Squares/2/9-slices/1"] = 1062,
    ["UI/Squares/2/9-slices/2"] = 1063,
    ["UI/Squares/2/9-slices/3"] = 1064,
    ["UI/Squares/2/9-slices/4"] = 1065,
    ["UI/Squares/2/9-slices/5"] = 1066,
    ["UI/Squares/2/9-slices/6"] = 1067,
    ["UI/Squares/2/9-slices/7"] = 1068,
    ["UI/Squares/2/9-slices/8"] = 1069,
    ["UI/Squares/2/9-slices/9"] = 1070,
    ["UI/Squares/3/9-slices/1"] = 1071,
    ["UI/Squares/3/9-slices/2"] = 1072,
    ["UI/Squares/3/9-slices/3"] = 1073,
    ["UI/Squares/3/9-slices/4"] = 1074,
    ["UI/Squares/3/9-slices/5"] = 1075,
    ["UI/Squares/3/9-slices/6"] = 1076,
    ["UI/Squares/3/9-slices/7"] = 1077,
    ["UI/Squares/3/9-slices/8"] = 1078,
    ["UI/Squares/3/9-slices/9"] = 1079,
    ["UI/Squares/4/9-slices/1"] = 1080,
    ["UI/Squares/4/9-slices/2"] = 1081,
    ["UI/Squares/4/9-slices/3"] = 1082,
    ["UI/Squares/4/9-slices/4"] = 1083,
    ["UI/Squares/4/9-slices/5"] = 1084,
    ["UI/Squares/4/9-slices/6"] = 1085,
    ["UI/Squares/4/9-slices/7"] = 1086,
    ["UI/Squares/4/9-slices/8"] = 1087,
    ["UI/Squares/4/9-slices/9"] = 1088,
    ["UI/Squares/5/9-slices/1"] = 1089,
    ["UI/Squares/5/9-slices/2"] = 1090,
    ["UI/Squares/5/9-slices/3"] = 1091,
    ["UI/Squares/5/9-slices/4"] = 1092,
    ["UI/Squares/5/9-slices/5"] = 1093,
    ["UI/Squares/5/9-slices/6"] = 1094,
    ["UI/Squares/5/9-slices/7"] = 1095,
    ["UI/Squares/5/9-slices/8"] = 1096,
    ["UI/Squares/5/9-slices/9"] = 1097,
    ["UI/Squares/6/9-slices/1"] = 1098,
    ["UI/Squares/6/9-slices/2"] = 1099,
    ["UI/Squares/6/9-slices/3"] = 1100,
    ["UI/Squares/6/9-slices/4"] = 1101,
    ["UI/Squares/6/9-slices/5"] = 1102,
    ["UI/Squares/6/9-slices/6"] = 1103,
    ["UI/Squares/6/9-slices/7"] = 1104,
    ["UI/Squares/6/9-slices/8"] = 1105,
    ["UI/Squares/6/9-slices/9"] = 1106,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
