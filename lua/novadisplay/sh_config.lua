NovaDisplay.config = {
    defaultConfiguration = {
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
    },
    colors = {
        transparent = Color( 0, 0, 0, 0 ),
        background = Color( 32, 34, 37 ),
        foreground = Color( 41, 43, 47 ),
        dark = Color( 47, 49, 54 ),
        bright = Color( 54, 57, 63 )
    },
    padding = 2
}
