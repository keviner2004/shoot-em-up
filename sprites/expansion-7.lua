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
            x=125,
            y=275,
            width=51,
            height=42,

        },
        {
            -- Meteors/Big/2
            x=1,
            y=225,
            width=60,
            height=49,

        },
        {
            -- Meteors/Big/3
            x=1,
            y=276,
            width=45,
            height=41,

        },
        {
            -- Meteors/Big/4
            x=125,
            y=225,
            width=49,
            height=48,

        },
        {
            -- Meteors/Big/5
            x=178,
            y=275,
            width=51,
            height=42,

        },
        {
            -- Meteors/Big/6
            x=63,
            y=225,
            width=60,
            height=49,

        },
        {
            -- Meteors/Big/7
            x=48,
            y=276,
            width=45,
            height=41,

        },
        {
            -- Meteors/Big/8
            x=176,
            y=225,
            width=49,
            height=48,

        },
        {
            -- Meteors/Huge/1
            x=1,
            y=1,
            width=110,
            height=111,

        },
        {
            -- Meteors/Huge/2
            x=109,
            y=117,
            width=108,
            height=106,

        },
        {
            -- Meteors/Huge/3
            x=1,
            y=114,
            width=106,
            height=109,

        },
        {
            -- Meteors/Huge/4
            x=113,
            y=1,
            width=107,
            height=114,

        },
        {
            -- Meteors/Med/1
            x=219,
            y=163,
            width=23,
            height=20,

        },
        {
            -- Meteors/Med/2
            x=219,
            y=117,
            width=22,
            height=21,

        },
        {
            -- Meteors/Med/3
            x=219,
            y=140,
            width=22,
            height=21,

        },
        {
            -- Meteors/Med/4
            x=219,
            y=185,
            width=23,
            height=20,

        },
        {
            -- Meteors/Small/1
            x=222,
            y=1,
            width=14,
            height=14,

        },
        {
            -- Meteors/Small/2
            x=222,
            y=33,
            width=15,
            height=13,

        },
        {
            -- Meteors/Small/3
            x=222,
            y=17,
            width=14,
            height=14,

        },
        {
            -- Meteors/Small/4
            x=222,
            y=48,
            width=15,
            height=13,

        },
        {
            -- Meteors/Tiny/1
            x=222,
            y=63,
            width=9,
            height=9,

        },
        {
            -- Meteors/Tiny/2
            x=222,
            y=74,
            width=8,
            height=8,

        },
        {
            -- Meteors/Tiny/3
            x=233,
            y=63,
            width=9,
            height=9,

        },
        {
            -- Meteors/Tiny/4
            x=232,
            y=74,
            width=8,
            height=8,

        },
    },
    
    sheetContentWidth = 243,
    sheetContentHeight = 318
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
