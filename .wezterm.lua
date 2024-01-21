local wezterm = require 'wezterm'

local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.keys = {
  { key = '{', mods = 'SHIFT|ALT', action = act.MoveTabRelative(-1) },
  { key = '}', mods = 'SHIFT|ALT', action = act.MoveTabRelative(1) },
}

config.color_scheme = 'Banana Blueberry'
config.font = wezterm.font('MesloLGS NF')
config.font_size = 13
-- config.freetype_load_flags = 'NO_HINTING|NO_AUTOHINT'
-- config.freetype_load_target = 'Light'
-- config.freetype_render_target = 'HorizontalLcd'

return config
