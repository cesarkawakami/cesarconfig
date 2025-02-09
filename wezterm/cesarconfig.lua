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
  config.font_size = 10.5

  -- These are built-in fonts, we're just customizing them
  config.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Noto Color Emoji",
    "Symbols Nerd Font Mono",
  }, {
    weight = "Bold",
  })

  -- Disabling ligatures
  config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

  config.window_frame = {
    font_size = 10.0
  }
end

local function config_shell(config)
  if wezterm.target_triple:find("windows") then
    config.default_prog = {"pwsh.exe"}
  end
end

function module.apply_to_config(config)
  config_multiplexing(config)
  config_appearance(config)
  config_shell(config)
end

return module
