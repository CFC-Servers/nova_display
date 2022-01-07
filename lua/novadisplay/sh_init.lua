AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/novadisplay.lua" )
AddCSLuaFile( "client/panel.lua" )

include( "sh_config.lua" )

local files = file.Find( "novadisplay/client/panels/*.lua", "LUA" )

for _, fileName in ipairs( files ) do
    local filePath = "novadisplay/client/panels/" .. fileName

    AddCSLuaFile( filePath )
    include( filePath )
end

if SERVER then
    -- include( "server_file" )
else
    include( "client/novadisplay.lua" )
    include( "client/panel.lua" )
end
