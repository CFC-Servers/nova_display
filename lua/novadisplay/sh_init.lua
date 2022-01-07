AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/basepanel.lua" )
AddCSLuaFile( "client/novadisplay.lua" )
AddCSLuaFile( "client/scoreboard.lua" )

include( "sh_config.lua" )

if SERVER then
    -- include( "server_file" )
else
    include( "client/basepanel.lua" )

    local files = file.Find( "novadisplay/client/panels/*.lua", "LUA" )

    for _, fileName in ipairs( files ) do
        local filePath = "novadisplay/client/panels/" .. fileName

        AddCSLuaFile( filePath )
        include( filePath )
    end

    include( "client/novadisplay.lua" )
    include( "client/scoreboard.lua" )
end
