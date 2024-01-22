-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Storm"
config.window_background_opacity = 0.9
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font = wezterm.font("Monaspace Neon")
-- config.font = wezterm.font("Monaspace Argon")
-- config.font = wezterm.font("Monaspace Xenon")
-- config.font = wezterm.font("Monaspace Radon")
-- config.font = wezterm.font("Monaspace Krypton")
config.harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "liga", "dlig" }

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }

config.term = "wezterm"

-- and finally, return the configuration to wezterm
return config
