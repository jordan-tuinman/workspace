local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Set the font to JetBrains Mono
config.font = wezterm.font('JetBrains Mono')

-- Set theme
config.color_scheme = 'Atom (Gogh)'

-- Set the opacity to 0.90
config.window_background_opacity = 0.90

-- Add key bindings
config.keys = {
  -- Option + Left: Jump to previous word
  {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
  -- Option + Right: Jump to next word
  {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  
  -- Command + Left: Jump to beginning of line
  {key="LeftArrow", mods="CMD", action=wezterm.action{SendString="\x01"}},
  -- Command + Right: Jump to end of line
  {key="RightArrow", mods="CMD", action=wezterm.action{SendString="\x05"}},
}

return config

