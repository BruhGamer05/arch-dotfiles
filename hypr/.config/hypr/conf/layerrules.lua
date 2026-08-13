-- conf/layerrules.lua

-- rofi / notifications layer polish (left disabled — originally commented out too)
-- hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
-- hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 1 })
-- hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
-- hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 1 })

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0.5 })
-- hl.layer_rule({ match = { namespace = "tag:notif*" } , ignore_alpha = 0.5 }) -- likely a mistake in the source repo, see earlier note
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- SWAYNC BLUR & XRAY
hl.layer_rule({ match = { namespace = "swaync-control-center" },    blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" },    ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-control-center" },    xray = false })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, xray = false })
