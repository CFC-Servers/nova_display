local colors = NovaDisplay.config.colors
local transparent = colors.panelTransparent

local playerInfoRow = {}

function playerInfoRow:Init()
    self:SetTall( 40 )
    self:SetBackgroundColor( transparent )

    local avatar = vgui.Create( "AvatarImage", self )
    avatar:SetSize( 32, 32 )
    avatar:Dock( LEFT )
    avatar:DockMargin( 4, 4, 4, 4 )

    local name = vgui.Create( "DLabel", self )
    name:SetTall( 32 )
    name:Dock( LEFT )
    name:DockMargin( 0, 4, 4, 4 )
    name:SetContentAlignment( 4 )
    name:SetFont( "OmicronZeta18" )
    name:SetText( "Unknown" )
    name:SizeToContents()

    self.avatar = avatar
    self.name = name
end

function playerInfoRow:SetPlayer( ply )
    self.avatar:SetPlayer( ply, 32 )
    self.name:SetText( ply:Nick() )
    self.name:SetTextColor( team.GetColor( ply:Team() ) )
    self.name:SizeToContents()
end

vgui.Register( "NovaDisplay_PlayerInfoRow", playerInfoRow, "DPanel" )

local playerCategory = {}

function playerCategory:Init()
    self:SetBackgroundColor( transparent )

    local header = vgui.Create( "DPanel", self )
    header:Dock( TOP )
    header:DockMargin( 2, 2, 2, 2 )
    header:SetTall( 20 )
    header:SetBackgroundColor( transparent )

    local name = vgui.Create( "DLabel", header )
    name:Dock( TOP )
    name:DockMargin( 2, 0, 0, 0 )
    name:SetContentAlignment( 4 )
    name:SetFont( "OmicronZeta18" )
    name:SizeToContents()

    local container = vgui.Create( "DPanel", self )
    container:Dock( TOP )
    container:DockMargin( 2, 2, 2, 2 )
    container:SetBackgroundColor( transparent )

    self:InvalidateLayout( true )
    self:SizeToChildren( false, true )

    self.name = name
    self.container = container
end

function playerCategory:SetName( name )
    self.name:SetText( name )
    self.name:SizeToContents()
end

function playerCategory:AddPlayer( ply )
    local plyRow = vgui.Create( "NovaDisplay_PlayerInfoRow", self.container )
    plyRow:Dock( TOP )
    plyRow:SetPlayer( ply )

    self.container:InvalidateLayout( true )
    self.container:SizeToChildren( false, true )

    self:InvalidateLayout( true )
    self:SizeToChildren( false, true )
end

vgui.Register( "NovaDisplay_PlayerCategory", playerCategory, "DPanel" )

local playerList = {}

function playerList:Init()
    local scroll = vgui.Create( "DScrollPanel", self )
    scroll:Dock( FILL )

    self.scroll = scroll

    local onlinePlayers = self:AddCategory( "Online Players" )

    for _, ply in ipairs( player.GetAll() ) do
        onlinePlayers:AddPlayer( ply )
    end

    onlinePlayers:InvalidateLayout( true )
    onlinePlayers:SizeToChildren( true )
end

function playerList:AddCategory( name )
    local category = self.scroll:Add( "NovaDisplay_PlayerCategory" )
    category:Dock( TOP )
    category:SetName( name )

    return category
end

vgui.Register( "NovaDisplay_PlayerList", playerList, "NovaDisplay_BasePanel" )
