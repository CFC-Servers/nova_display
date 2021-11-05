function Scoreboard:show()
    self.panel = vgui.Create( "cfc_scoreboard" )
end

function Scoreboard:hide()
    if not self.panel then return end

    self.panel:Remove()
    self.panel = nil
end

local function scoreboardShow()
    Scoreboard:show()
end

hook.Add( "ScoreboardShow", "CFC_Scoreboard_ScoreboardShow", scoreboardShow )

local function scoreboardHide()
    Scoreboard:hide()
end

hook.Add( "ScoreboardHide", "CFC_Scoreboard_ScoreboardHide", scoreboardHide )
