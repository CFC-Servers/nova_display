local colors = NovaDisplay.config.colors
local transparent = colors.panelTransparent

local playerInfoRow = {}

function playerInfoRow:Init()

end

function playerInfoRow:SetPlayer( ply )

end

vgui.Register( "NovaDisplay_PlayerInfoRow", playerInfoRow, "DPanel" )

local playerCategory = {}

function playerCategory:Init()
    local name = vgui.Create( "DLabel", self )
    name:Dock( TOP )
    name:SetContentAlignment( 4 )
    name:SetFont( "OmicronZeta18" )
    name:SizeToContents()
    
    self.name = name
end

function playerCategory:SetName( name )
    self.name:SetText( name )
    self.name:SizeToContents()
end

function playerCategory:AddPlayer( ply )
    local plyRow = vgui.Create( "NovaDisplay_PlayerInfoRow", self )
    plyRow:SetPlayer( ply )
end

vgui.Register( "NovaDisplay_PlayerCategory", playerCategory, "DPanel" )

local playerList = {}

function playerList:Init()
    local onlinePlayers = self:AddCategry( "Online Players" )

    for _, ply in ipairs( player.GetAll() ) do
        onlinePlayers:AddPlayer(  )
    end
end

function playerList:AddCategory( name )
    local category = vgui.Create( "NovaDisplay_PlayerCategory", self )
    category:Dock( TOP )
    category:SetName( name )

    return category
end

vgui.Register( "NovaDisplay_PlayerList", playerList, "DScrollPanel" )
