local scoreboardPanel = {}

function scoreboardPanel:Init()

end

vgui.Register( "cfc_scoreboard", scoreboardPanel, "DPanel" )
Scoreboard.panel = vgui.Create( "cfc_scoreboard" )
