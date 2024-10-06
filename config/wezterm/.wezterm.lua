local wezterm = require 'wezterm'
local config = {}

-- Set the window opacity
config.window_background_opacity = 0.90

-- Optional: Set a font
config.font = wezterm.font 'JetBrains Mono'

config.color_scheme = 'Atom (Gogh)'

return config

