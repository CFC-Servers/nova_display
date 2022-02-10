NovaDisplay.hidden = true

function NovaDisplay:show()
    if not self.hidden then return end

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

local function scoreboardHide()
    NovaDisplay:hide()
end

local function initializeScoreboard()
    if NovaDisplay.panel then
        NovaDisplay.panel:Remove()
    end

    NovaDisplay.panel = vgui.Create( "NovaDisplay_Scoreboard" )

    hook.Add( "ScoreboardShow", "NovaDisplay_Scoreboard_ScoreboardShow", scoreboardShow )
    hook.Add( "ScoreboardHide", "NovaDisplay_Scoreboard_ScoreboardHide", scoreboardHide )
end

hook.Add( "SetupMove", "NovaDisplay_Scoreboard_InitScoreboard", function()
    hook.Remove( "SetupMove", "NovaDisplay_Scoreboard_InitScoreboard" )
    initializeScoreboard()
end )

concommand.Add( "novadisplay_scoreboard_reload", initializeScoreboard, nil, "Reloads the Scoreboard entirely", bit.bor( FCVAR_UNLOGGED, FCVAR_SERVER_CAN_EXECUTE ) )
