local sqlite3 = require( "sqlite3" )

local Helper = {}

Helper.new = function()
    local helper = {}
    local path = system.pathForFile( "spaceshooter.db", system.DocumentsDirectory )
    print ("system.DocumentsDirectory: "..path)
    function helper:open()
        self.db = sqlite3.open( path ) 
    end

    function helper:init()
        self:open()
        self.db:exec[[
          CREATE TABLE IF NOT EXISTS rank (id INTEGER PRIMARY KEY, name TEXT, score INTEGER, type TEXT);
        ]]
        print("inited")
        self:close()
    end

    function helper:getData(stype, n)
        if not stype then
            stype = "local"
        end
        self:open()
        local stmt = self.db:prepare[[SELECT * FROM rank WHERE type = ? ORDER BY score DESC LIMIT ?;]]
        stmt:bind(1, stype)
        stmt:bind(2, n)
        result = {}
        for row in stmt:nrows() do
            result[#result + 1] = row
        end
        stmt:step()
        stmt:finalize()
        self:close()
        return result
    end

    function helper:addRecord(name, score, type)
        self:open()
        local stmt = self.db:prepare[[INSERT INTO rank (name, score, type) VALUES (?, ?, ?);]]
        if stmt == nil then
            print("QQ")
        end
        stmt:bind(1, name)
        stmt:bind(2, score)
        stmt:bind(3, type)
        stmt:step()
        stmt:finalize()
        self:close()
    end

    function helper:getHighScore(stype)
        self:open()
        local stmt = self.db:prepare[[SELECT MAX(score) FROM rank WHERE type = ?]]
        if stmt == nil then
            print("QQ")
        end
        stmt:bind(1, stype)
        for row in stmt:urows() do
            return row
        end
        stmt:step()
        stmt:finalize()
        self:close()
        return nil
    end

    function helper:fetchGlobalScores()
        print("fetchGlobalScores")
        --sync score from server
        return nil
    end

    function helper:syncHighScore()
        local localHighScore = self:getHighScore("local")
        local globalHighScore = self:getHighScore("global")
        if not globalHighScore then
            globalHighScore = self:fetchGlobalScores()
        end
        if localHighScore == nil or globalHighScore == nil then
            return
        end
        if localHighScore > globalHighScore then
            --send to server
        end
    end

    function helper:delLastRecords(max, stype)
        self:open()
        local stmt = self.db:prepare[[SELECT COUNT(*) FROM rank WHERE type = ?]]
        stmt:bind(1, stype)
        local count = 0
        for row in stmt:urows() do
            count = row
        end
        print("current count "..count)
        stmt:step()
        stmt:reset()
        if count <= max then
            stmt:finalize()
            self.db:close()
            return
        end
        stmt = self.db:prepare[[SELECT * FROM rank WHERE type = ? ORDER BY score DESC LIMIT -1 OFFSET ?]]
        stmt:bind(1, stype)
        stmt:bind(2, max)
        delIds = {}
        for row in stmt:nrows() do
            delIds[#delIds+1] = row.id
        end
        stmt:step()
        stmt:finalize()
        --delete dummy records
        for i=1, #delIds  do
            stmt = self.db:prepare[[DELETE FROM rank WHERE id = ?]]
            stmt:bind(1, delIds[i])
            stmt:step()
        end
        stmt:finalize()
        self.db:close()
    end

    function helper:close()
        self.db:close()
    end

    return helper
end

return Helper

