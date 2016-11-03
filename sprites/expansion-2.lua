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
            x=219,
            y=1,
            width=134,
            height=134,

        },
        {
            -- Planet/2
            x=355,
            y=1,
            width=134,
            height=134,

        },
        {
            -- Planet/3
            x=1,
            y=137,
            width=134,
            height=134,

        },
        {
            -- Planet/4
            x=1,
            y=1,
            width=216,
            height=134,

        },
        {
            -- Planet/5
            x=1,
            y=273,
            width=134,
            height=134,

        },
        {
            -- Planet/6
            x=137,
            y=137,
            width=134,
            height=134,

        },
        {
            -- Planet/7
            x=137,
            y=273,
            width=134,
            height=134,

        },
        {
            -- Planet/8
            x=273,
            y=137,
            width=134,
            height=134,

        },
        {
            -- Planet/9
            x=273,
            y=273,
            width=134,
            height=134,

        },
    },
    
    sheetContentWidth = 490,
    sheetContentHeight = 408
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
