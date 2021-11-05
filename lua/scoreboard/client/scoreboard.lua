function Scoreboard:show()
    self.panel = vgui.Create( "cfc_scoreboard" )
end

function Scoreboard:hide()
    if not self.panel then return end

    self.panel:Remove()
    self.panel = nil
end

function GM:ScoreboardShow()
    Scoreboard:show()
end

function GM:ScoreboardHide()
    Scoreboard:hide()
end
