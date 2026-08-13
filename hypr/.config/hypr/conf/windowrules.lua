hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- append to conf/windowrules.lua

-- APPLICATIONS BLUR
hl.window_rule({ match = { tag = "multimedia_video" }, no_blur = true })
hl.window_rule({ match = { tag = "multimedia_video" }, opacity = "1.0" })
hl.window_rule({ match = { tag = "settings" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^(org.gnome.Nautilus)$" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" }, opacity = "0.9" })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, opacity = "0.9" })
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.9" })
hl.window_rule({ match = { class = "^(discord|vesktop|org.telegram.desktop)$" }, opacity = "0.85 override 0.7 override 1 override" })
hl.window_rule({ match = { class = "^(Spotify)$" }, opacity = "0.8 override 0.6 override 1 override" })
hl.window_rule({ match = { class = "^(zen)$" }, opacity = "0.9 override 0.7 override 1 override" })
-- hl.window_rule({ match = { tag = "viewer" }, opacity = "0.8 override 0.6 override 1 override" }) -- was commented out originally

-- FLOAT
hl.window_rule({ match = { tag = "settings" }, float = true })
hl.window_rule({ match = { tag = "viewer" }, float = true })
hl.window_rule({ match = { tag = "multimedia_video" }, float = true })
hl.window_rule({ match = { tag = "multimedia_video" }, size = {900, 506} })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, size = "50% 60%" })

-- POP UPS AND DIALOGUES
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, float = true })
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, size = "50% 60%" })
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, center = true })

hl.window_rule({ match = { initial_title = "(Open Files)" }, float = true })
hl.window_rule({ match = { initial_title = "(Open Files)" }, size = "70% 60%" })
