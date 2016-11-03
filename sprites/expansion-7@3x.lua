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
            x=375,
            y=825,
            width=153,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 125
        },
        {
            -- Meteors/Big/2
            x=3,
            y=675,
            width=180,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 180,
            sourceHeight = 146
        },
        {
            -- Meteors/Big/3
            x=3,
            y=828,
            width=135,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 123
        },
        {
            -- Meteors/Big/4
            x=375,
            y=675,
            width=147,
            height=144,

        },
        {
            -- Meteors/Big/5
            x=534,
            y=825,
            width=153,
            height=126,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 152,
            sourceHeight = 125
        },
        {
            -- Meteors/Big/6
            x=189,
            y=675,
            width=180,
            height=147,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 180,
            sourceHeight = 146
        },
        {
            -- Meteors/Big/7
            x=144,
            y=828,
            width=135,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 123
        },
        {
            -- Meteors/Big/8
            x=528,
            y=675,
            width=147,
            height=144,

        },
        {
            -- Meteors/Huge/1
            x=3,
            y=3,
            width=330,
            height=333,

        },
        {
            -- Meteors/Huge/2
            x=327,
            y=351,
            width=324,
            height=318,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 324,
            sourceHeight = 317
        },
        {
            -- Meteors/Huge/3
            x=3,
            y=342,
            width=318,
            height=327,

        },
        {
            -- Meteors/Huge/4
            x=339,
            y=3,
            width=321,
            height=342,

        },
        {
            -- Meteors/Med/1
            x=657,
            y=489,
            width=69,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 60
        },
        {
            -- Meteors/Med/2
            x=657,
            y=351,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Meteors/Med/3
            x=657,
            y=420,
            width=66,
            height=63,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 63
        },
        {
            -- Meteors/Med/4
            x=657,
            y=555,
            width=69,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 60
        },
        {
            -- Meteors/Small/1
            x=666,
            y=3,
            width=42,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 41
        },
        {
            -- Meteors/Small/2
            x=666,
            y=99,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 39
        },
        {
            -- Meteors/Small/3
            x=666,
            y=51,
            width=42,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 41
        },
        {
            -- Meteors/Small/4
            x=666,
            y=144,
            width=45,
            height=39,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 44,
            sourceHeight = 39
        },
        {
            -- Meteors/Tiny/1
            x=666,
            y=189,
            width=27,
            height=27,

        },
        {
            -- Meteors/Tiny/2
            x=666,
            y=222,
            width=24,
            height=24,

        },
        {
            -- Meteors/Tiny/3
            x=699,
            y=189,
            width=27,
            height=27,

        },
        {
            -- Meteors/Tiny/4
            x=696,
            y=222,
            width=24,
            height=24,

        },
    },
    
    sheetContentWidth = 729,
    sheetContentHeight = 954
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
