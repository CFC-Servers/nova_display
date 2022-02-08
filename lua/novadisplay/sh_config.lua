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
        panelBackground = Color( 20, 20, 20, 255 ),
        panelTransparent = Color( 0, 0, 0, 0 )
    },
    padding = 2
}
