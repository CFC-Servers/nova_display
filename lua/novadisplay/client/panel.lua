local scoreboardPanel = {}

function scoreboardPanel:Init()

end

vgui.Register( "nova_display", scoreboardPanel, "DPanel" )
NovaDisplay.panel = vgui.Create( "cfc_scoreboard" )
