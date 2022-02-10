local config = NovaDisplay.config
local pad = config.padding

local button = {}

function button:Init()
    self:DockMargin( pad, pad, pad, pad )
    self:SetText( "" )

    local container = vgui.Create( "DPanel", self )
    container:SetBackgroundColor( config.colors.transparent )
    container:SetMouseInputEnabled( false )

    local icon = vgui.Create( "DImage", container )
    icon:SetSize( 0, 26 )
    icon:Dock( LEFT )

    local name = vgui.Create( "DLabel", container )
    name:SetTextColor( Color( 255, 255, 255 ) )
    name:SetFont( "OmicronZeta28" )
    name:SetText( "Button" )
    name:SizeToContents()
    name:Dock( LEFT )

    self.container = container
    self.name = name
    self.icon = icon
end

function button:SetName( name )
    self.name:SetText( name )
    self.name:SizeToContents()

    self:InvalidateLayout( true )
end

function button:SetIcon( path )
    self.icon:SetMaterial( path )
    self.icon:SetMinimumSize( 26, 26 )
    self.icon:SetSize( 26, 26 )
    self.icon:DockMargin( 0, 0, 8, 0 )

    self:InvalidateLayout( true )
end

function button:PerformLayout()
    self.container:InvalidateLayout( true )
    self.container:SizeToChildren( true, true )
    self.container:Center()
end

function button:Paint( w, h )
    draw.RoundedBox( 4, 0, 0, w, h, config.colors.bright )

    if not self:IsHovered() then return end

    draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 20 ) )
end

vgui.Register( "NovaDisplay_Button", button, "DButton" )

local buttonList = {}

function buttonList:Init()
    self:DockPadding( pad, pad, pad, pad )
end

function buttonList:Configure( config )
    for _, name in ipairs( config ) do
        local button = vgui.Create( "NovaDisplay_Button_" .. name, self )
        button:SetTall( 36 )
        button:Dock( TOP )
    end
end

vgui.Register( "NovaDisplay_ButtonList", buttonList, "NovaDisplay_BasePanel" )
