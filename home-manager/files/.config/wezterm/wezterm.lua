-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "rose-pine-moon"

config.max_fps = 120
config.win32_system_backdrop = "Acrylic"
config.window_background_opacity = 0.7

-- and finally, return the configuration to wezterm
return config
