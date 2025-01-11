local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
  config.unix_domains = {
    {
      name = 'unix',
    },
  }

  config.default_gui_startup_args = { 'connect', 'unix' }

  config.font = wezterm.font_with_fallback {
    "Cascadia Mono",
    "JetBrains Mono",
  }
  config.font_size = 10.5

  config.window_frame = {
    font_size = 10.0
  }
end

return module
