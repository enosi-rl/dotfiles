-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- color scheme --
-- config.color_scheme = 'Gruvbox light, hard (base16)'
-- config.color_scheme = 'Gruvbox light, medium (base16)'
-- config.color_scheme = 'Gruvbox light, soft (base16)'
-- config.color_scheme = 'Gruvbox dark, medium (base16)'
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = 'Gruvbox Material (Gogh)'

config.color_scheme = 'MonokaiPro (Gogh)'
-- config.color_scheme = 'Monokai Pro Ristretto (Gogh)'
-- config.color_scheme = 'Monokai (terminal.sexy)'
-- config.color_scheme = 'Mocha (dark) (terminal.sexy)'


config.font = wezterm.font 'MonoLisa'
config.audible_bell = 'Disabled'
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}
config.colors = {
  visual_bell = '#303030',
}

config.window_decorations = "RESIZE"
config.initial_rows = 80
config.initial_cols = 121

config.show_update_window = true

config.keys = {
  { key = 'A', mods = 'CMD', action = wezterm.action.ShowTabNavigator },
}

-- and finally, return the configuration to wezterm
return config
