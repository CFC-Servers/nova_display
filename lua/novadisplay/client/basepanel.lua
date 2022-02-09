local pad = NovaDisplay.config.padding
local foreground = NovaDisplay.config.colors.foreground

local basePanel = {}

function basePanel:Init()
    self:DockPadding( pad, pad, pad, pad )
    self:DockMargin( pad, pad, pad, pad )

    self:SetBackgroundColor( foreground )
end

vgui.Register( "NovaDisplay_BasePanel", basePanel, "DPanel" )
