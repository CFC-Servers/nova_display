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
    timer.Simple( 0, function()
        if NovaDisplay.panel then
            NovaDisplay.panel:Remove()
        end

        NovaDisplay.panel = vgui.Create( "NovaDisplay_Scoreboard" )

        hook.Add( "ScoreboardShow", "NovaDisplay_Scoreboard_ScoreboardShow", scoreboardShow )
        hook.Add( "ScoreboardHide", "NovaDisplay_Scoreboard_ScoreboardHide", scoreboardHide )
    end )
end

hook.Add( "InitPostEntity", "NovaDisplay_Scoreboard_InitScoreboard", initializeScoreboard )

concommand.Add( "novadisplay_scoreboard_reload", initializeScoreboard, nil, "Reloads the Scoreboard entirely", bit.bor( FCVAR_UNLOGGED, FCVAR_SERVER_CAN_EXECUTE ) )
