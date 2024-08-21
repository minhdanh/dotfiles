-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)

-- wezterm.on("update-right-status", function(window, pane)
-- 	window:set_left_status("left")
-- 	window:set_right_status("right")
-- end)

config.color_scheme = "Sonokai (Gogh)"
config.font_size = 13
config.font = wezterm.font_with_fallback({
	-- {
	-- 	family = "Monaco Nerd Font Mono",
	-- 	weight = "Medium",
	-- 	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	-- },
	{ family = "JetBrainsMono Nerd Font" },
})

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
