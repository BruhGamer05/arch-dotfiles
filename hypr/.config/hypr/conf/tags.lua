-- conf/tags.lua

hl.window_rule({
    match = { class = "^([Mm]pv|vlc)$" },
    tag   = "+multimedia_video",
})

hl.window_rule({
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller)$" },
    tag   = "+settings",
})

hl.window_rule({
    match = { class = "^(org.gnome.DiskUtility|wihotspot(-gui)?)$" },
    tag   = "+settings",
})

hl.window_rule({
    match = { class = "^(org.gnome.SystemMonitor)$" }, -- system monitor
    tag   = "+viewer",
})

hl.window_rule({
    match = { class = "^(org.gnome.Evince)$" }, -- document viewer
    tag   = "+viewer",
})

hl.window_rule({
    match = { class = "^(eog|org.gnome.Loupe)$" }, -- image viewer
    tag   = "+viewer",
})
