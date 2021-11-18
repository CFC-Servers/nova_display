NovaDisplay.hidden = true

function NovaDisplay:show()
    self.hidden = false
    self.panel:Show()
end

function NovaDisplay:hide()
    if self.hidden then return end

    self.hidden = true
    self.panel:Hide()
end

local function scoreboardShow()
    NovaDisplay:show()

    return true
end

hook.Add( "ScoreboardShow", "CFC_Scoreboard_ScoreboardShow", scoreboardShow )

local function scoreboardHide()
    NovaDisplay:hide()
end

hook.Add( "ScoreboardHide", "CFC_Scoreboard_ScoreboardHide", scoreboardHide )
