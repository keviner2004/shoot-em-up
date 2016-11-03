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
            x=438,
            y=2,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 267,
            sourceHeight = 267
        },
        {
            -- Planet/2
            x=710,
            y=2,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 267,
            sourceHeight = 267
        },
        {
            -- Planet/3
            x=2,
            y=274,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 268,
            sourceHeight = 267
        },
        {
            -- Planet/4
            x=2,
            y=2,
            width=432,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 431,
            sourceHeight = 267
        },
        {
            -- Planet/5
            x=2,
            y=546,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 267,
            sourceHeight = 267
        },
        {
            -- Planet/6
            x=274,
            y=274,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 268,
            sourceHeight = 267
        },
        {
            -- Planet/7
            x=274,
            y=546,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 267,
            sourceHeight = 268
        },
        {
            -- Planet/8
            x=546,
            y=274,
            width=268,
            height=268,

        },
        {
            -- Planet/9
            x=546,
            y=546,
            width=268,
            height=268,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 267,
            sourceHeight = 268
        },
    },
    
    sheetContentWidth = 980,
    sheetContentHeight = 816
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
