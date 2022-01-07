local padding = NovaDisplay.config.padding
local bgColor = NovaDisplay.config.colors.panelBackground

local basePanel = {}

function basePanel:Init()
    self:DockPadding( padding, padding, padding, padding )
    self:DockMargin( padding, padding, padding, padding )

    self:SetBackgroundColor( bgColor )
end

vgui.Register( "NovaDisplay_BasePanel", basePanel, "DPanel" )
