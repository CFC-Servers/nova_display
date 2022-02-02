local colors = NovaDisplay.config.colors

local playerInfo = {}

surface.CreateFont( "NovaDisplay_userNameFont", {
    font = "Omicron Zeta",
    extended = false,
    size = 28,
    weight = 400,
    shadow = false,
} )

function playerInfo:Init()
    local avatarContainer = vgui.Create( "DPanel", self )
    avatarContainer:SetTall( 128 )
    avatarContainer:DockMargin( 0, 4, 0, 4 )
    avatarContainer:Dock( TOP )
    avatarContainer:SetBackgroundColor( colors.panelTransparent )

    local avatar = vgui.Create( "AvatarImage", avatarContainer )
    avatar:SetSize( 128, 128 )
    avatar:SetPlayer( LocalPlayer(), 128 )

    local nameContainer = vgui.Create( "DPanel", self )
    nameContainer:DockMargin( 0, 4, 0, 0 )
    nameContainer:Dock( TOP )
    nameContainer:SetBackgroundColor( colors.panelTransparent )

    local name = vgui.Create( "DLabel", nameContainer )
    name:Dock( FILL )
    name:SetContentAlignment( 5 )
    name:SetFont( "NovaDisplay_userNameFont" )
    name:SetText( LocalPlayer():Nick() )
    name:SetColor( team.GetColor( LocalPlayer():Team() ) )
    name:SizeToContents()

    local teamContainer = vgui.Create( "DPanel", self )
    teamContainer:DockMargin( 0, 4, 0, 0 )
    teamContainer:Dock( TOP )
    teamContainer:SetBackgroundColor( colors.panelTransparent )

    local teamName = vgui.Create( "DLabel", teamContainer )
    teamName:Dock( FILL )
    teamName:SetContentAlignment( 5 )
    teamName:SetFont( "NovaDisplay_userNameFont" )
    teamName:SetText( team.GetName( LocalPlayer():Team() ) )
    teamName:SizeToContents()

    self.avatarContainer = avatarContainer
    self.avatar = avatar
    self.nameContainer = nameContainer
    self.teamContainer = teamContainer
end

function playerInfo:PerformLayout()
    self.avatarContainer:InvalidateLayout( true )
    self.avatar:Center()
    self.nameContainer:InvalidateLayout( true )
    self.nameContainer:SizeToChildren( false, true )
    self.teamContainer:InvalidateLayout( true )
    self.teamContainer:SizeToChildren( false, true )
end

vgui.Register( "NovaDisplay_PlayerInfo", playerInfo, "NovaDisplay_BasePanel" )
