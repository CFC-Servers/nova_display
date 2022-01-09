AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/basepanel.lua" )
AddCSLuaFile( "client/novadisplay.lua" )
AddCSLuaFile( "client/scoreboard.lua" )

include( "sh_config.lua" )

if CLIENT then
    include( "client/basepanel.lua" )
end

local files = file.Find( "novadisplay/client/panels/*.lua", "LUA" )

for _, fileName in ipairs( files ) do
    print( "[NovaDisplay] Loading custom panel: " .. string.sub( fileName, 1, -5 ) )

    local filePath = "novadisplay/client/panels/" .. fileName

    if SERVER then
        AddCSLuaFile( filePath )
    else
        include( filePath )
    end
end

if SERVER then
    -- include( "server_file" )
else
    include( "client/novadisplay.lua" )
    include( "client/scoreboard.lua" )
end
