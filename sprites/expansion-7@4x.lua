--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7aa284699692f55a4946fc77ce62c199:868d0c08f460aeb112285a0533ae1c2b:21a3d7e861a88723ed5f07b9b4b21523$
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
            -- Meteors/Big/1
            x=500,
            y=1100,
            width=204,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 202,
            sourceHeight = 166
        },
        {
            -- Meteors/Big/2
            x=4,
            y=900,
            width=240,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 240,
            sourceHeight = 194
        },
        {
            -- Meteors/Big/3
            x=4,
            y=1104,
            width=180,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 164
        },
        {
            -- Meteors/Big/4
            x=500,
            y=900,
            width=196,
            height=192,

        },
        {
            -- Meteors/Big/5
            x=712,
            y=1100,
            width=204,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 202,
            sourceHeight = 166
        },
        {
            -- Meteors/Big/6
            x=252,
            y=900,
            width=240,
            height=196,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 240,
            sourceHeight = 194
        },
        {
            -- Meteors/Big/7
            x=192,
            y=1104,
            width=180,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 178,
            sourceHeight = 164
        },
        {
            -- Meteors/Big/8
            x=704,
            y=900,
            width=196,
            height=192,

        },
        {
            -- Meteors/Huge/1
            x=4,
            y=4,
            width=440,
            height=444,

        },
        {
            -- Meteors/Huge/2
            x=436,
            y=468,
            width=432,
            height=424,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 432,
            sourceHeight = 422
        },
        {
            -- Meteors/Huge/3
            x=4,
            y=456,
            width=424,
            height=436,

        },
        {
            -- Meteors/Huge/4
            x=452,
            y=4,
            width=428,
            height=456,

        },
        {
            -- Meteors/Med/1
            x=876,
            y=652,
            width=92,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 80
        },
        {
            -- Meteors/Med/2
            x=876,
            y=468,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Meteors/Med/3
            x=876,
            y=560,
            width=88,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 86,
            sourceHeight = 84
        },
        {
            -- Meteors/Med/4
            x=876,
            y=740,
            width=92,
            height=80,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 90,
            sourceHeight = 80
        },
        {
            -- Meteors/Small/1
            x=888,
            y=4,
            width=56,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 54
        },
        {
            -- Meteors/Small/2
            x=888,
            y=132,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 52
        },
        {
            -- Meteors/Small/3
            x=888,
            y=68,
            width=56,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 54
        },
        {
            -- Meteors/Small/4
            x=888,
            y=192,
            width=60,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 58,
            sourceHeight = 52
        },
        {
            -- Meteors/Tiny/1
            x=888,
            y=252,
            width=36,
            height=36,

        },
        {
            -- Meteors/Tiny/2
            x=888,
            y=296,
            width=32,
            height=32,

        },
        {
            -- Meteors/Tiny/3
            x=932,
            y=252,
            width=36,
            height=36,

        },
        {
            -- Meteors/Tiny/4
            x=928,
            y=296,
            width=32,
            height=32,

        },
    },
    
    sheetContentWidth = 972,
    sheetContentHeight = 1272
}

SheetInfo.frameIndex =
{

    ["Meteors/Big/1"] = 1,
    ["Meteors/Big/2"] = 2,
    ["Meteors/Big/3"] = 3,
    ["Meteors/Big/4"] = 4,
    ["Meteors/Big/5"] = 5,
    ["Meteors/Big/6"] = 6,
    ["Meteors/Big/7"] = 7,
    ["Meteors/Big/8"] = 8,
    ["Meteors/Huge/1"] = 9,
    ["Meteors/Huge/2"] = 10,
    ["Meteors/Huge/3"] = 11,
    ["Meteors/Huge/4"] = 12,
    ["Meteors/Med/1"] = 13,
    ["Meteors/Med/2"] = 14,
    ["Meteors/Med/3"] = 15,
    ["Meteors/Med/4"] = 16,
    ["Meteors/Small/1"] = 17,
    ["Meteors/Small/2"] = 18,
    ["Meteors/Small/3"] = 19,
    ["Meteors/Small/4"] = 20,
    ["Meteors/Tiny/1"] = 21,
    ["Meteors/Tiny/2"] = 22,
    ["Meteors/Tiny/3"] = 23,
    ["Meteors/Tiny/4"] = 24,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
