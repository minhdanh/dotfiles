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
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}
config.color_scheme = "Sonokai (Gogh)"
config.line_height = 1.25
config.font_size = 12
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.harfbuzz_features = { 'calt=0' }
-- config.freetype_load_flags = 'NO_HINTING'
config.font = wezterm.font {
  family = "Fira Code",
  weight = "Medium",
}

config.enable_tab_bar = false
config.default_prog = { "tmux" }

config.keys = {
  {
    key = ',',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = os.getenv('WEZTERM_CONFIG_DIR'),
      set_environment_variables = {
        TERM = 'screen-256color',
      },
      args = {
        'nvim',
        os.getenv('WEZTERM_CONFIG_FILE'),
      },
    },
  },
  -- other keys
}
-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
