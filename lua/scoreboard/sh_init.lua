AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/scoreboard.lua" )

include( "sh_config.lua" )

if SERVER then
    -- include( "server_file" )
else
    include( "client/scoreboard.lua" )
end
