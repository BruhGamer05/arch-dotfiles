-- conf/appearance.lua

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = "rgba(899296ff)", -- was $outline
            inactive_border = "rgba(40484bff)", -- was $outline_variant
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- from rgba(1a1a1aee): AARRGGBB order
        },

        blur = {
            enabled           = true,
            size              = 5,
            passes            = 3,
            ignore_opacity    = true,
            new_optimizations = true,
            special           = false,
            popups            = true,
            xray              = true,
            vibrancy          = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
