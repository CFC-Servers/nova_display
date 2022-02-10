local config = NovaDisplay.config

local padding = config.padding
local layout = config.layouts[config.layout]
local colors = config.colors

local scoreboardPanel = {}

function scoreboardPanel:Init()
    local w, h = ScrW() * 0.7, ScrH() * 0.7

    self:SetSize( w, h )
    self:Center()

    self:DockPadding( padding, padding, padding, padding )
    self:SetBackgroundColor( colors.background )

    self:Configure( layout )

    self:MakePopup()
    self:SetKeyboardInputEnabled( false )

    self:Hide()
end

function scoreboardPanel:Configure( layout, parent )
    parent = parent or self

    for _, item in ipairs( layout ) do
        if item.type == "panel" then
            local panel = vgui.Create( "NovaDisplay_" .. item.name, parent )
            panel:SetSize( item.w, item.h )
            panel:Dock( item.dock )

            if panel.Configure then
                panel:Configure( item.config )
            end
        elseif item.type == "group" then
            local panel = vgui.Create( "DPanel", parent )
            panel:SetSize( item.w, item.h )
            panel:Dock( item.dock )
            panel:SetBackgroundColor( colors.transparent )

            self:Configure( item.contents, panel )
        end
    end
end

vgui.Register( "NovaDisplay_Scoreboard", scoreboardPanel, "DPanel" )
