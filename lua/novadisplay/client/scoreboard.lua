local padding = NovaDisplay.config.padding
local configuration = NovaDisplay.config.defaultConfiguration

local scoreboardPanel = {}

function scoreboardPanel:Init()
    local w, h = ScrW() * 0.7, ScrH() * 0.7

    self:SetSize( w, h )
    self:Center()

    self:DockPadding( padding, padding, padding, padding )
    self:SetBackgroundColor( Color( 255, 255, 255, 50 ) )

    self:Configure( configuration )

    self:MakePopup()
    self:SetKeyboardInputEnabled( false )

    self:Hide()
end

function scoreboardPanel:Configure( config, parent )
    parent = parent or self

    for _, item in ipairs( config ) do
        if item.type == "panel" then
            local panel = vgui.Create( "NovaDisplay_" .. item.name, parent )
            panel:SetSize( item.w, item.h )
            panel:Dock( item.dock )
        elseif item.type == "group" then
            local panel = vgui.Create( "DPanel", parent )
            panel:SetSize( item.w, item.h )
            panel:Dock( item.dock )
            panel:SetBackgroundColor( NovaDisplay.config.colors.panelTransparent )

            self:Configure( item.contents, panel )
        end
    end
end

vgui.Register( "NovaDisplay_Scoreboard", scoreboardPanel, "DPanel" )
