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
            x=250,
            y=550,
            width=102,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 101,
            sourceHeight = 83
        },
        {
            -- Meteors/Big/2
            x=2,
            y=450,
            width=120,
            height=98,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 120,
            sourceHeight = 97
        },
        {
            -- Meteors/Big/3
            x=2,
            y=552,
            width=90,
            height=82,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 82
        },
        {
            -- Meteors/Big/4
            x=250,
            y=450,
            width=98,
            height=96,

        },
        {
            -- Meteors/Big/5
            x=356,
            y=550,
            width=102,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 101,
            sourceHeight = 83
        },
        {
            -- Meteors/Big/6
            x=126,
            y=450,
            width=120,
            height=98,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 120,
            sourceHeight = 97
        },
        {
            -- Meteors/Big/7
            x=96,
            y=552,
            width=90,
            height=82,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 89,
            sourceHeight = 82
        },
        {
            -- Meteors/Big/8
            x=352,
            y=450,
            width=98,
            height=96,

        },
        {
            -- Meteors/Huge/1
            x=2,
            y=2,
            width=220,
            height=222,

        },
        {
            -- Meteors/Huge/2
            x=218,
            y=234,
            width=216,
            height=212,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 216,
            sourceHeight = 211
        },
        {
            -- Meteors/Huge/3
            x=2,
            y=228,
            width=212,
            height=218,

        },
        {
            -- Meteors/Huge/4
            x=226,
            y=2,
            width=214,
            height=228,

        },
        {
            -- Meteors/Med/1
            x=438,
            y=326,
            width=46,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 40
        },
        {
            -- Meteors/Med/2
            x=438,
            y=234,
            width=44,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 43,
            sourceHeight = 42
        },
        {
            -- Meteors/Med/3
            x=438,
            y=280,
            width=44,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 43,
            sourceHeight = 42
        },
        {
            -- Meteors/Med/4
            x=438,
            y=370,
            width=46,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 45,
            sourceHeight = 40
        },
        {
            -- Meteors/Small/1
            x=444,
            y=2,
            width=28,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 27
        },
        {
            -- Meteors/Small/2
            x=444,
            y=66,
            width=30,
            height=26,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 26
        },
        {
            -- Meteors/Small/3
            x=444,
            y=34,
            width=28,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 27
        },
        {
            -- Meteors/Small/4
            x=444,
            y=96,
            width=30,
            height=26,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 29,
            sourceHeight = 26
        },
        {
            -- Meteors/Tiny/1
            x=444,
            y=126,
            width=18,
            height=18,

        },
        {
            -- Meteors/Tiny/2
            x=444,
            y=148,
            width=16,
            height=16,

        },
        {
            -- Meteors/Tiny/3
            x=466,
            y=126,
            width=18,
            height=18,

        },
        {
            -- Meteors/Tiny/4
            x=464,
            y=148,
            width=16,
            height=16,

        },
    },
    
    sheetContentWidth = 486,
    sheetContentHeight = 636
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
