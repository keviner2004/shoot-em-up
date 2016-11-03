--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4418b446385c360327af5d6950b98620:2d0d67c293c0e62fcb4b87419b75ab89:d469c1d9a933b7c0d74ca26bf537ae03$
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
            x=66,
            y=1,
            width=63,
            height=62,

        },
        {
            -- AlienUFOs/Ships/2
            x=1,
            y=76,
            width=63,
            height=64,

        },
        {
            -- AlienUFOs/Ships/3
            x=1,
            y=1,
            width=63,
            height=73,

        },
        {
            -- AlienUFOs/Ships/4
            x=66,
            y=65,
            width=63,
            height=55,

        },
        {
            -- AlienUFOs/Ships/5
            x=1,
            y=142,
            width=63,
            height=62,

        },
        {
            -- AlienUFOs/Ships/Damages/1
            x=131,
            y=86,
            width=63,
            height=34,

        },
        {
            -- AlienUFOs/Ships/Damages/2
            x=131,
            y=48,
            width=63,
            height=36,

        },
        {
            -- AlienUFOs/Ships/Damages/3
            x=1,
            y=206,
            width=63,
            height=45,

        },
        {
            -- AlienUFOs/Ships/Damages/4
            x=196,
            y=111,
            width=63,
            height=31,

        },
        {
            -- AlienUFOs/Ships/Damages/5
            x=66,
            y=207,
            width=63,
            height=34,

        },
        {
            -- AlienUFOs/Ships/Damages/6
            x=131,
            y=122,
            width=63,
            height=34,

        },
        {
            -- AlienUFOs/Ships/Damages/7
            x=196,
            y=1,
            width=63,
            height=36,

        },
        {
            -- AlienUFOs/Ships/Damages/8
            x=131,
            y=1,
            width=63,
            height=45,

        },
        {
            -- AlienUFOs/Ships/Damages/9
            x=131,
            y=194,
            width=63,
            height=31,

        },
        {
            -- AlienUFOs/Ships/Damages/10
            x=196,
            y=39,
            width=63,
            height=34,

        },
        {
            -- AlienUFOs/Ships/Parts/dome
            x=196,
            y=177,
            width=42,
            height=49,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/1
            x=240,
            y=202,
            width=38,
            height=17,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/2
            x=240,
            y=177,
            width=36,
            height=23,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/3
            x=131,
            y=227,
            width=56,
            height=23,

        },
        {
            -- AlienUFOs/Ships/Parts/Legs/4
            x=189,
            y=228,
            width=50,
            height=23,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/1
            x=196,
            y=75,
            width=63,
            height=34,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/2
            x=66,
            y=169,
            width=63,
            height=36,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/3
            x=66,
            y=122,
            width=63,
            height=45,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/4
            x=196,
            y=144,
            width=63,
            height=31,

        },
        {
            -- AlienUFOs/Ships/Parts/Main/5
            x=131,
            y=158,
            width=63,
            height=34,

        },
    },
    
    sheetContentWidth = 279,
    sheetContentHeight = 252
}

SheetInfo.frameIndex =
{

    ["AlienUFOs/Ships/1"] = 1,
    ["AlienUFOs/Ships/2"] = 2,
    ["AlienUFOs/Ships/3"] = 3,
    ["AlienUFOs/Ships/4"] = 4,
    ["AlienUFOs/Ships/5"] = 5,
    ["AlienUFOs/Ships/Damages/1"] = 6,
    ["AlienUFOs/Ships/Damages/2"] = 7,
    ["AlienUFOs/Ships/Damages/3"] = 8,
    ["AlienUFOs/Ships/Damages/4"] = 9,
    ["AlienUFOs/Ships/Damages/5"] = 10,
    ["AlienUFOs/Ships/Damages/6"] = 11,
    ["AlienUFOs/Ships/Damages/7"] = 12,
    ["AlienUFOs/Ships/Damages/8"] = 13,
    ["AlienUFOs/Ships/Damages/9"] = 14,
    ["AlienUFOs/Ships/Damages/10"] = 15,
    ["AlienUFOs/Ships/Parts/dome"] = 16,
    ["AlienUFOs/Ships/Parts/Legs/1"] = 17,
    ["AlienUFOs/Ships/Parts/Legs/2"] = 18,
    ["AlienUFOs/Ships/Parts/Legs/3"] = 19,
    ["AlienUFOs/Ships/Parts/Legs/4"] = 20,
    ["AlienUFOs/Ships/Parts/Main/1"] = 21,
    ["AlienUFOs/Ships/Parts/Main/2"] = 22,
    ["AlienUFOs/Ships/Parts/Main/3"] = 23,
    ["AlienUFOs/Ships/Parts/Main/4"] = 24,
    ["AlienUFOs/Ships/Parts/Main/5"] = 25,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
