local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

config.font_size = 22
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = true


config.default_cwd = "/Users/tsald3/Documents/Github"

config.colors = {
    foreground = 'white'
}



config.keys = {
{
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
    key = 'UpArrow',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Up')
}, {
    key = 'DownArrow',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Down')
}, {
    key = 'LeftArrow',
    mods = 'OPT|CMD',
    action = act.ActivatePaneDirection('Left')
}, {
    key = 'RightArrow',
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
}}

return config