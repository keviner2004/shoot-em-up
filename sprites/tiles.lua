--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:53496ed08f6b65acc16dda6fa974ed8c:c8b1774d0c0e7018596b0041ca2be5c5:f4492607ea55a754477543692c89a688$
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
            -- black
            x=1,
            y=1,
            width=256,
            height=256,

        },
        {
            -- blue
            x=259,
            y=1,
            width=256,
            height=256,

        },
        {
            -- darkPurple
            x=517,
            y=1,
            width=256,
            height=256,

        },
        {
            -- purple
            x=775,
            y=1,
            width=256,
            height=256,

        },
    },
    
    sheetContentWidth = 1032,
    sheetContentHeight = 258
}

SheetInfo.frameIndex =
{

    ["black"] = 1,
    ["blue"] = 2,
    ["darkPurple"] = 3,
    ["purple"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
