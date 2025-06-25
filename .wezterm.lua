local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()
local keys = {}


-- font + basic
config.font_size = 22
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = true
config.default_cursor_style = 'BlinkingUnderline'
wezterm.font = wezterm.font("JetBrains Mono", { weight = "Regular" })

-- window
config.window_background_opacity = .8
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- tabs - not in use
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.colors = { foreground = 'white', background = 'black' }

config.inactive_pane_hsb = {
    saturation = .8,
    brightness = .8
}

config.keys = { {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane {
        confirm = false
    }
}, {
    key = '+',
    mods = 'CMD',
    action = act.IncreaseFontSize
}, {
    key = '-',
    mods = 'CMD',
    action = act.DecreaseFontSize
},
    { key = '1', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 1\n") },
    { key = '2', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 2\n") },
    { key = '3', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 3\n") },
    { key = '4', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 4\n") },
    { key = '5', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 5\n") },
    { key = '6', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 6\n") },
    { key = '7', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 7\n") },
    { key = '8', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 8\n") },
    { key = '9', mods = 'CMD', action = wezterm.action.SendString("tmux select-window -t 9\n") },
}


return config
