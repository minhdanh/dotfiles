-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)

-- wezterm.on("update-right-status", function(window, pane)
-- 	window:set_left_status("left")
-- 	window:set_right_status("right")
-- end)

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}
config.use_ime = false
config.window_padding = {
	bottom = 0,
}
config.color_scheme = "Sonokai (Gogh)"
config.line_height = 1.25
config.default_cursor_style = "BlinkingBlock"
config.font_size = 12
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.harfbuzz_features = { "calt=0" }
-- config.freetype_load_flags = 'NO_HINTING'
config.font = wezterm.font({
	family = "Fira Code",
	weight = "Medium",
})

config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false
-- config.show_tabs_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.status_update_interval = 3000

-- Run tmux on startup, fall back to login shell when tmux exits
config.default_prog = { "/bin/zsh", "-l", "-c", "tmux attach || tmux; exec zsh -l" }

config.keys = {
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
	-- Disable Cmd+W to prevent accidental quit
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- other keys
}

-- wezterm.on("update-right-status", function(window, pane)
-- 	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
--
-- 	-- Make it italic and underlined
-- 	window:set_right_status(wezterm.format({
-- 		{ Attribute = { Underline = "Single" } },
-- 		{ Attribute = { Italic = true } },
-- 		{ Text = "Hello " .. date },
-- 	}))
-- end)

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
