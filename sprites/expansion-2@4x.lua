--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f6dd79c5d9e21fd1e2a7f0017e70a349:68696f58f3043faa34a91af8c5b61602:4ff0eee65b5b207af942f85a5555b184$
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
            -- Planet/1
            x=876,
            y=4,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/2
            x=1420,
            y=4,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/3
            x=4,
            y=548,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 534
        },
        {
            -- Planet/4
            x=4,
            y=4,
            width=864,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 862,
            sourceHeight = 534
        },
        {
            -- Planet/5
            x=4,
            y=1092,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 534
        },
        {
            -- Planet/6
            x=548,
            y=548,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 534
        },
        {
            -- Planet/7
            x=548,
            y=1092,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 536
        },
        {
            -- Planet/8
            x=1092,
            y=548,
            width=536,
            height=536,

        },
        {
            -- Planet/9
            x=1092,
            y=1092,
            width=536,
            height=536,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 534,
            sourceHeight = 536
        },
    },
    
    sheetContentWidth = 1960,
    sheetContentHeight = 1632
}

SheetInfo.frameIndex =
{

    ["Planet/1"] = 1,
    ["Planet/2"] = 2,
    ["Planet/3"] = 3,
    ["Planet/4"] = 4,
    ["Planet/5"] = 5,
    ["Planet/6"] = 6,
    ["Planet/7"] = 7,
    ["Planet/8"] = 8,
    ["Planet/9"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
