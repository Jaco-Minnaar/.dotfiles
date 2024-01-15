-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- This is where you actually apply your config choices
--

-- Set the font size to 12pt
config.font = wezterm.font("JetBrains Mono")
config.font_size = 10
config.dpi = 109.0

-- For example, changing the color scheme:
config.color_scheme = 'GruvboxDark'

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
