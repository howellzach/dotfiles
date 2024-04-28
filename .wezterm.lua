local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local keys = {
    { key = '{',          mods = 'SHIFT|ALT',   action = act.MoveTabRelative(-1) },
    { key = '}',          mods = 'SHIFT|ALT',   action = act.MoveTabRelative(1) },
    { key = '}',          mods = 'CMD|SHIFT',   action = act.ActivateTabRelative(1) },
    { key = '{',          mods = 'CMD|SHIFT',   action = act.ActivateTabRelative(-1) },
    { key = 'j',          mods = 'CMD',         action = act.ActivatePaneDirection 'Down', },
    { key = 'k',          mods = 'CMD',         action = act.ActivatePaneDirection 'Up', },
    { key = 'Enter',      mods = 'CMD',         action = act.ActivateCopyMode },
    { key = 'R',          mods = 'CMD',         action = act.ReloadConfiguration },
    { key = '+',          mods = 'CMD',         action = act.IncreaseFontSize },
    { key = '-',          mods = 'CMD',         action = act.DecreaseFontSize },
    { key = '0',          mods = 'CMD',         action = act.ResetFontSize },
    { key = 'c',          mods = 'CMD',         action = act.CopyTo 'Clipboard' },
    { key = 'N',          mods = 'SHIFT|CTRL',  action = act.SpawnWindow },
    { key = 'U',          mods = 'SHIFT|CTRL',  action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
    { key = 'v',          mods = 'CMD',         action = act.PasteFrom 'Clipboard' },
    { key = 'PageUp',     mods = 'CTRL',        action = act.ActivateTabRelative(-1) },
    { key = 'PageDown',   mods = 'CTRL',        action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow',  mods = 'SHIFT|CTRL',  action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'SHIFT|CTRL',  action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'SHIFT|CTRL',  action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'SHIFT|CTRL',  action = act.ActivatePaneDirection 'Down' },
    { key = 'd',          mods = 'CMD|SHIFT',   action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'd',          mods = 'CMD',         action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'h',          mods = 'CMD',         action = act.ActivatePaneDirection 'Left', },
    { key = 'l',          mods = 'CMD',         action = act.ActivatePaneDirection 'Right', },
    { key = 't',          mods = 'CMD',         action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w',          mods = 'CMD',         action = act.CloseCurrentTab { confirm = true } },
    { key = 'x',          mods = 'CMD',         action = act.CloseCurrentPane { confirm = true } },
    { key = 'b',          mods = 'LEADER|CTRL', action = act.SendString '\x02', },
    { key = 'Enter',      mods = 'LEADER',      action = act.ActivateCopyMode, },
    { key = 'p',          mods = 'LEADER',      action = act.PasteFrom 'PrimarySelection', },
    {
        key = 'k',
        mods = 'CTRL|ALT',
        action = act.Multiple
            {
                act.ClearScrollback 'ScrollbackAndViewport',
                act.SendKey { key = 'L', mods = 'CTRL' }
            }
    },
    { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
}

config.disable_default_key_bindings = true
config.leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 2000 }
config.keys = keys

config.color_scheme = 'Panda (Gogh)'
config.font = wezterm.font('MesloLGS NF')
config.font_size = 13
config.line_height = 1.05
config.window_background_opacity = 0.98
config.use_fancy_tab_bar = false
config.tab_max_width = 36
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 5000
config.enable_scroll_bar = true
config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7
}

return config
