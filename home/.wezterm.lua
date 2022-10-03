local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- Make Option-Left equivalent to Alt-b; backward-word
    { key = 'LeftArrow', mods = 'OPT', action = act.SendString '\x1bb' },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = 'RightArrow', mods = 'OPT', action = act.SendString '\x1bf' },
  },
  window_background_opacity = 0.8,
  --color_scheme = 'AlienBlood',
  color_scheme = 'AdventureTime',
  --color_scheme = 'Apathy (base16)',
}
