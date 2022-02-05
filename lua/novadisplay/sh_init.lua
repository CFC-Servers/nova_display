AddCSLuaFile( "sh_config.lua" )
AddCSLuaFile( "client/basepanel.lua" )
AddCSLuaFile( "client/novadisplay.lua" )
AddCSLuaFile( "client/scoreboard.lua" )

include( "sh_config.lua" )

if CLIENT then
    include( "client/basepanel.lua" )
end

local function loadFiles( path, server, client, message )
    local files = file.Find( path .. "*.lua", "LUA" )

    for _, fileName in ipairs( files ) do
        if message then print( string.format( "[NovaDisplay] " .. message, string.sub( fileName, 1, -5 ) ) ) end

        local filePath = path .. fileName

        if client then
            if SERVER then
                AddCSLuaFile( filePath )
            else
                include( filePath )
            end
        end

        if server and SERVER then
            include( filePath )
        end
    end
end

loadFiles( "novadisplay/client/panels/", false, true, "Loading custom panel: %s" )

if SERVER then
    -- include( "server_file" )
else
    include( "client/novadisplay.lua" )
    include( "client/scoreboard.lua" )
end
