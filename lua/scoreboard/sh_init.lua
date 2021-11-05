AddCSLuaFile( "client/scoreboard.lua" )

-- include( "shared_file" )

if SERVER then
    -- include( "server_file" )
else
    include( "client/scoreboard.lua" )
end
