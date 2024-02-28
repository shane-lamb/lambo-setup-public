local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- Make Option-Left equivalent to Alt-b; backward-word
    { key = 'LeftArrow', mods = 'OPT', action = act.SendString '\x1bb' },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = 'RightArrow', mods = 'OPT', action = act.SendString '\x1bf' },
    -- Scroll up/down to previous/next command, requires shell integration setup
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1) },
  },
  window_background_opacity = 0.8,
  window_decorations = 'RESIZE',
  -- color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html
  --color_scheme = 'AlienBlood',
  color_scheme = 'AdventureTime',
  --color_scheme = 'Apathy (base16)',
}
