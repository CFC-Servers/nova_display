local links = NovaDisplay.config.links

local discordButton = {}

function discordButton:Init()
    self:SetName( "Discord" )
    self:SetIcon( "novadisplay/discord_icon.vmt" )
end

function discordButton:DoClick()
    gui.OpenURL( links.discord )
end

vgui.Register( "NovaDisplay_Button_Discord", discordButton, "NovaDisplay_Button" )

local workshopButton = {}

function workshopButton:Init()
    self:SetName( "Workshop" )
    self:SetIcon( "novadisplay/steam_icon.vmt" )
end

function workshopButton:DoClick()
    gui.OpenURL( links.workshop )
end

vgui.Register( "NovaDisplay_Button_Workshop", workshopButton, "NovaDisplay_Button" )
