local CustomKeyBoard = {}
local KeyButton = require("ui.KeyPanel")
local Sprite = require("Sprite")
local logger = require("logger")
local gameConfig = require("gameConfig")
local sfx = require("sfx")
local util = require("util")
local TAG = "Keyboard"

local keys = {
    a = {
        name = "A",
        binding = "a",
        value = "a"
    }, 
    b = {
        name = "B",
        binding = "b",
        value = "b"
    }, 
    c = {
        name = "C",
        binding = "c",
        value = "c"
    },
    d = {
        name = "D",
        binding = "d",
        value = "d"
    },
    e = {
        name = "E",
        binding = "e",
        value = "e"
    },
    f = {
        name = "F",
        binding = "f",
        value = "f"
    },
    g = {
        name = "G",
        binding = "g",
        value = "g"
    },
    h = {
        name = "H",
        binding = "h",
        value = "h"
    },
    i = {
        name = "I",
        binding = "i",
        value = "i"
    },
    j = {
        name = "J",
        binding = "j",
        value = "j"
    },
    k = {
        name = "K",
        binding = "k",
        value = "k"
    },
    l = {
        name = "L",
        binding = "l",
        value = "l"
    },
    m = {
        name = "M",
        binding = "m",
        value = "m"
    },
    n = {
        name = "N",
        binding = "n",
        value = "n"
    },
    o = {
        name = "O",
        binding = "o",
        value = "o"
    },
    p = {
        name = "P",
        binding = "p",
        value = "p"
    },
    q = {
        name = "Q",
        binding = "q",
        value = "q"
    },
    r = {
        name = "R",
        binding = "r",
        value = "r"
    },
    s = {
        name = "S",
        binding = "s",
        value = "s"
    },
    t = {
        name = "T",
        binding = "t",
        value = "t"
    },
    u = {
        name = "U",
        binding = "u",
        value = "u"
    },
    v = {
        name = "V",
        binding = "v",
        value = "v"
    },
    w = {
        name = "W",
        binding = "w",
        value = "w"
    },
    x = {
        name = "X",
        binding = "x",
        value = "x"
    },
    y = {
        name = "Y",
        binding = "y",
        value = "y"
    },
    z = {
        name = "Z",
        binding = "z",
        value = "z"
    },
    n0 = {
        name = "0",
        binding = "0",
        value = "0"
    },
    n1 = {
        name = "1",
        binding = "1",
        value = "1"
    },
    n2 = {
        name = "2",
        binding = "2",
        value = "2"
    },
    n3 = {
        name = "3",
        binding = "3",
        value = "3"
    },
    n4 = {
        name = "4",
        binding = "4",
        value = "4"
    },
    n5 = {
        name = "5",
        binding = "5",
        value = "5"
    },
    n6 = {
        name = "6",
        binding = "6",
        value = "6"
    },
    n7 = {
        name = "7",
        binding = "7",
        value = "7"
    },
    n8 = {
        name = "8",
        binding = "8",
        value = "8"
    },
    n9 = {
        name = "9",
        binding = "9",
        value = "9"
    },
    space = {
        name = "space",
        binding = "space",
        value = "space"
    },
    del = {
        name = "del",
        binding = "del",
        value = "del"
    },
    enter = {
        name = "",
        biding = "enter",
        value = "enter"
    },

}

local arrangedKeys = {
    {"n1", "n2", "n3", "n4", "n5", "n6", "n7", "n8", "n9", "n0", },
    {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p"},
    {"a", "s", "d", "f", "g", "h", "j", "k", "l"},
    {"z", "x", "c", "v", "b", "n", "m", }
}

local special = {"del", "enter"}

CustomKeyBoard.new = function(w, h)
    local row1 = arrangedKeys[1]
    local gap = 0
    local keyboard = display.newGroup()
    local kw = math.floor((w - gap * (#row1-1)) / #row1)
    local left = - w/2
    local height = (kw + gap)*4
    local top = -height/2
    local rowGroup = {}
    local rowArray = {}
    keyboard.posX = 1
    keyboard.posY = 1

    for i = 1, #arrangedKeys do
        rowGroup[i] = display.newGroup()
        rowArray[i] = {}
        keyboard:insert(rowGroup[i])
    end

    function keyboard:clickEffect(keyButton)
        transition.to(keyButton, {time = 100, xScale = 0.9, yScale = 0.9, onComplete = 
            function ()
                transition.to(keyButton, {time = 100, xScale = 1, yScale = 1})
            end})
        sfx:play("click")
    end

    function keyboard:arrangeSingle(key, row, col, xScale, yScale)
        local y = top + ( row -1 ) * (kw + gap) + kw/2
        local keyButton = KeyButton.new(kw * xScale, kw * yScale, {disableClickSound = true})
        keyButton.x = left + (col-1) * gap + kw * (col-1) + kw/2
        keyButton.y = y
        local name = keys[key].name
        keyButton:setText(name)
        keyButton.value = keys[key].value
        rowGroup[row]:insert(keyButton)
        rowArray[row][#rowArray[row]+1] = keyButton
        function keyButton:onTouch(event)
            if event.phase == "began" then
                keyboard:clickEffect(keyButton)
            elseif event.phase == "ended" then
                keyboard:onKeyPressd(keyButton.value)
            end
        end
        return keyButton
    end

    function keyboard:arrangeForce(key, row, col, xScale, yScale)
        local y = top + ( row -1 ) * (kw + gap) + kw/2
        local keyButton = KeyButton.new(kw * xScale, kw * yScale, {disableClickSound = true})
        keyButton.x = left + (col-1) * gap + kw * (col-1) + kw/2
        keyButton.y = y
        local name = keys[key].name
        keyButton:setText(name)
        keyButton.value = keys[key].value
        function keyButton:onTouch(event)
            if event.phase == "began" then
                keyboard:clickEffect(keyButton)
            elseif event.phase == "ended" then
                keyboard:onKeyPressd(keyButton.value)
            end
        end
        return keyButton
    end

    function keyboard:arrangeRow(row)
        local keysInRow = arrangedKeys[row]
        for i = 1, #keysInRow do
            keyboard:arrangeSingle(keysInRow[i], row, i, 1, 1)
        end
    end

    function keyboard:centerIt(line, lineGroup)
        local width = 0
        logger:debug(TAG, "Num of keys in row is %d",#line)
        for i = 1, #line do
            width = width + line[i].buttonView.width
            --width = width + line[i].width
        end
        lineGroup.x = lineGroup.x + (w - width)/2
    end

    function keyboard:moveOn(row, col)

    end

    function keyboard:key(event)
        if event.phase == "up" then
            logger:debug(TAG, "event.keyName "..event.keyName )
            if event.keyName == gameConfig.keyUp then
              self:onKeyUp(event)
            elseif event.keyName == gameConfig.keyDown then
              self:onKeyDown(event)
            elseif event.keyName == gameConfig.keyLeft then
              self:onKeyLeft(event)
            elseif event.keyName == gameConfig.keyRight then
              self:onKeyRight(event)
            elseif util.equalOrContain(event.keyName, gameConfig.keyConfirm) then
              --logger:debug(TAG, "event.keyName Confirm"..event.keyName )
              self:onKeyConfirm(event)
            elseif util.equalOrContain(event.keyName, gameConfig.keyCancel) then
              --logger:debug(TAG, "~~~~~~~~~~~~~onKeyCancel")
              --self:onKeyCancel(event)
            end
        end
    end

    function keyboard:outFromBottom()
        return false
    end

    function keyboard:outFromTop()
        return true
    end

    function keyboard:setKeyIndex(xOffset, yOffset)
        if self.posY == 1 and yOffset < 0 and self:outFromTop() then
            return
        end

        if self.posY == #arrangedKeys and yOffset > 0 and self:outFromBottom() then
            return 
        end        

        --print(self.posX, self.posY, xOffset, yOffset)
        if self.posY == 3 and self.posX == 9 and yOffset == 1 then
            self.posX = 8
            self.posY = 4
            return
        end

        self.posX = self.posX + xOffset
        self.posY = self.posY + yOffset
        if not rowArray[self.posY] then
            if self.posY > 0 then
                self.posY = self.posY % #rowArray
                if self.posY == 0 then
                    self.posY = #rowArray
                end
            else
                self.posY = - self.posY 
                self.posY = self.posY % #rowArray 
                self.posY = #rowArray - self.posY
            end
        end 

        if not rowArray[self.posY][self.posX] then
            local targetRow = rowArray[self.posY]
            if self.posX > 0 then
                self.posX = self.posX % #targetRow
                if self.posX == 0 then
                    self.posX = #targetRow
                end
            else
                self.posX = - self.posX 
                self.posX = self.posX % #targetRow 
                self.posX = #targetRow - self.posX
            end
        end

        logger:debug(TAG, "New index: %d, %d", self.posX, self.posY)
    end

    function keyboard:onKeyUp()
        self:setKeyIndex(0, -1)
        self:setPointer()
    end

    function keyboard:onKeyDown()
        self:setKeyIndex(0, 1)
        self:setPointer()
    end

    function keyboard:onKeyRight()
        self:setKeyIndex(1, 0)
        self:setPointer()
    end

    function keyboard:onKeyLeft()
        self:setKeyIndex(-1, 0)
        self:setPointer()
    end

    function keyboard:setPointer()
        if not self.pointer then
            self.pointer = Sprite.new(gameConfig.defaultCursor)
            self:insert(self.pointer)
        end
        local target = rowArray[self.posY][self.posX]
        local x, y = target:localToContent( 0, 0 )
        x, y = self:contentToLocal(x, y)
        self.pointer.x = x + target.width/4
        self.pointer.y = y + target.height/4
    end

    keyboard:arrangeRow(1)
    keyboard:arrangeRow(2)
    keyboard:arrangeRow(3)
    keyboard:arrangeRow(4)
    local keyButton_del = keyboard:arrangeSingle(special[1], 4, 8.5, 2, 1)
    local keyButton = keyboard:arrangeForce(special[2], 3.5, 10, 1, 2)
    keyButton:insert(Sprite.new("UI/Icons/enter"))
    --special[2]    
    rowGroup[3]:insert(keyButton)
    rowArray[3][#rowArray[3]+1] = keyButton
    --rowArray[4][#rowArray[4]+1] = keyButton_del
    rowArray[4][#rowArray[4]+1] = keyButton

    --keyboard:arrangeSingle(special[2], 3, 10, 1, 2)

    --align key to center
    for i = 1, #arrangedKeys do
        keyboard:centerIt(rowArray[i], rowGroup[i])
    end

    function keyboard:onKeyConfirm()
        self:clickEffect(rowArray[self.posY][self.posX])
        self:onKeyPressd(rowArray[self.posY][self.posX].value)
    end

    function keyboard:onKeyPressd(value)
        logger:debug(TAG, "Key %s pressed.", value)
    end

    function keyboard:disable()
        if self.pointer then self.pointer.isVisible = false end
        Runtime:removeEventListener( "key", keyboard)
    end

    function keyboard:enable()
        if self.pointer then self.pointer.isVisible = true end
        Runtime:addEventListener( "key", keyboard)
    end
    
    keyboard:enable()

    return keyboard
end

return CustomKeyBoard