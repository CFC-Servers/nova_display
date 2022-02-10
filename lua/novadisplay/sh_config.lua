--[[
        _   __                 ____  _            __           
       / | / /___ _   ______ _/ __ \(_)________  / /___ ___  __
      /  |/ / __ \ | / / __ `/ / / / / ___/ __ \/ / __ `/ / / /
     / /|  / /_/ / |/ / /_/ / /_/ / (__  ) /_/ / / /_/ / /_/ / 
    /_/ |_/\____/|___/\__,_/_____/_/____/ .___/_/\__,_/\__, /  
                                       /_/            /____/   
--]]

local config = {}
NovaDisplay.config = config

config.layout = "default"
config.layouts = {
    default = {
        {
            type = "group",
            dock = LEFT,
            w = 256, h = 0,
            contents = {
                {
                    type = "panel",
                    dock = TOP,
                    w = 256, h = 256,
                    name = "PlayerInfo"
                }
            }
        },
        {
            type = "panel",
            dock = FILL,
            w = 0, h = 0,
            name = "PlayerList"
        }
    }
}

config.colors = {
    transparent = Color( 0, 0, 0, 0 ),
    background = Color( 32, 34, 37 ),
    foreground = Color( 41, 43, 47 ),
    dark = Color( 47, 49, 54 ),
    bright = Color( 54, 57, 63 )
}

-- Padding is the space between elements
-- Note: The actual space will be twice this value as
-- both panels will actually add this much padding each.
config.padding = 2
