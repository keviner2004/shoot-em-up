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
            x=657,
            y=3,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/2
            x=1065,
            y=3,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/3
            x=3,
            y=411,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 402,
            sourceHeight = 401
        },
        {
            -- Planet/4
            x=3,
            y=3,
            width=648,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 647,
            sourceHeight = 401
        },
        {
            -- Planet/5
            x=3,
            y=819,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 401
        },
        {
            -- Planet/6
            x=411,
            y=411,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 402,
            sourceHeight = 401
        },
        {
            -- Planet/7
            x=411,
            y=819,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 402
        },
        {
            -- Planet/8
            x=819,
            y=411,
            width=402,
            height=402,

        },
        {
            -- Planet/9
            x=819,
            y=819,
            width=402,
            height=402,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 401,
            sourceHeight = 402
        },
    },
    
    sheetContentWidth = 1470,
    sheetContentHeight = 1224
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
