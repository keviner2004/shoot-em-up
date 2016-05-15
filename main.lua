local composer = require( "composer" )
--composer.gotoScene( "leaderBoardScene" , {params = {stype = "local"}})
composer.gotoScene( "scene.game")
--composer.gotoScene( "newHighScoreScene")

local lfs = require "lfs"

local doc_path = system.pathForFile( "", system.ResourceDirectory ).."/levels"

for file in lfs.dir(doc_path) do
    -- file is the current file or directory name
    print( "Found file: " .. file )
end