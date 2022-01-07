local padding = NovaDisplay.config.padding

local scoreboardPanel = {}

function scoreboardPanel:Init()
    local w, h = ScrW() * 0.7, ScrH() * 0.7

    self:SetSize( w, h )
    self:Center()

    self:DockPadding( padding, padding, padding, padding )
    self:SetBackgroundColor( Color( 255, 255, 255, 50 ) )

    self:MakePopup()
    self:SetKeyboardInputEnabled( false )

    self:Hide()
end

vgui.Register( "NovaDisplay_Scoreboard", scoreboardPanel, "DPanel" )
