Scoreboard.hidden = true

function Scoreboard:show()
    self.hidden = false
    self.panel:Show()
end

function Scoreboard:hide()
    if self.hidden then return end

    self.hidden = true
    self.panel:Hide()
end

local function scoreboardShow()
    Scoreboard:show()

    return true
end

hook.Add( "ScoreboardShow", "CFC_Scoreboard_ScoreboardShow", scoreboardShow )

local function scoreboardHide()
    Scoreboard:hide()
end

hook.Add( "ScoreboardHide", "CFC_Scoreboard_ScoreboardHide", scoreboardHide )
