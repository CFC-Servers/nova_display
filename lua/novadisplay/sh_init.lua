AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/novadisplay.lua" )
AddCSLuaFile( "client/panel.lua" )

include( "sh_config.lua" )

if SERVER then
    -- include( "server_file" )
else
    include( "client/novadisplay.lua" )
    include( "client/panel.lua" )
end
