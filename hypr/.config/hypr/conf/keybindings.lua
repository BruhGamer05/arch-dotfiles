local programs = require("conf.programs")
local mainMod  = "SUPER"

-- =========================================================
-- 1. Core Applications (The Rice UI)
-- =========================================================
hl.bind(mainMod .. " + RETURN",         hl.dsp.exec_cmd(programs.terminal))      -- Kitty
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("firefox"))              -- Browser
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(programs.fileManager))   -- Nautilus
hl.bind(mainMod .. " + SPACE",          hl.dsp.exec_cmd("rofi -show drun"))      -- Rofi App Launcher
hl.bind(mainMod .. " + N",              hl.dsp.exec_cmd("swaync-client -t -sw")) -- SwayNC Notification Center
hl.bind(mainMod .. " + ESCAPE",         hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/Wlogout.sh'")) -- Wlogout Power Menu Script
hl.bind(mainMod .. " + L",              hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/hyprlock.sh'"))

-- =========================================================
-- 2. Window Management & Navigation
-- =========================================================
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move Window Position
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- =========================================================
-- 3. Workspaces
-- =========================================================
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse Workspace Scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse Resize/Drag Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- =========================================================
-- 4. Screenshots & Utilities
-- =========================================================
-- Full screen screenshot
hl.bind(mainMod .. " + PRINT",         hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/screenshot.sh p'"))

-- Selected region screenshot
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/screenshot.sh s'"))


-- =========================================================
-- Clipboard History Menu (Rofi)
-- =========================================================
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("bash -c 'cliphist list | rofi -dmenu -p \"󰅌 Clipboard\" | cliphist decode | wl-copy'"))

-- Color picker
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))


-- =========================================================
-- 5. Hardware Controls (Laptop Keys)
-- =========================================================
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/volume.sh --inc'"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/volume.sh --dec'"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/volume.sh --toggle'"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/volume.sh --toggle-mic'"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/brightness.sh --inc'"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("bash -c '$HOME/.config/hypr/scripts/brightness.sh --dec'"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- =========================================================
-- 6. System Fallback & Matugen Pre-staging
-- =========================================================
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Phase 2 Prep: Matugen Wallpaper / Theme Script
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty -- bash -c '$HOME/.config/hypr/scripts/wppicker.sh'"))
