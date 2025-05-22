local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.font_size = 22
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = true
config.default_cwd = "/Users/$USER/Documents/Github/"

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}
config.window_background_opacity = .8
config.macos_window_background_blur = 20
config.enable_tab_bar = false
config.default_cursor_style = 'BlinkingUnderline'

wezterm.font = wezterm.font("JetBrains Mono", { weight = "Regular" })

config.colors = {
    foreground = 'white',
    background = 'black'
}

config.inactive_pane_hsb = {
    saturation = .8,
    brightness = .8
}

config.keys = {{
    key = 'd',
    mods = 'CMD',
    action = act.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = act.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'k',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Up')
}, {
    key = 'j',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Down')
}, {
    key = 'h',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Left')
}, {
    key = 'l',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Right')
}, {
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
}, {
    key = ' ',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.QuickSelect
}, {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
        key = 'b',
        mods = 'ALT'
    }
}, {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey {
        key = 'f',
        mods = 'ALT'
    }
}, {
    key = 'LeftArrow',
    mods = 'OPT|SHIFT',
    action = act.AdjustPaneSize {'Left', 5}
}, {
    key = 'DownArrow',
    mods = 'OPT|SHIFT',
    action = act.AdjustPaneSize {'Down', 5}
}, {
    key = 'UpArrow',
    mods = 'OPT|SHIFT',
    action = act.AdjustPaneSize {'Up', 5}
}, {
    key = 'RightArrow',
    mods = 'OPT|SHIFT',
    action = act.AdjustPaneSize {'Right', 5}
}}

return config
