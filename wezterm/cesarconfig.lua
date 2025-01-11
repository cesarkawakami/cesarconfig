local wezterm = require 'wezterm'

local module = {}

local function config_multiplexing(config)
  config.unix_domains = {
    {
      name = "muxlocal",
    },
  }

  config.default_gui_startup_args = {"connect", "muxlocal"}
end

local function config_appearance(config)
  config.font = wezterm.font_with_fallback {
    "Cascadia Mono",
    "JetBrains Mono",
  }
  config.font_size = 10.5

  config.window_frame = {
    font_size = 10.0
  }
end

local function config_shell(config)
  if wezterm.target_triple:find("windows") then
    config.default_prog = {"powershell.exe"}
  end
end

function module.apply_to_config(config)
  config_multiplexing(config)
  config_appearance(config)
  config_shell(config)
end

return module
