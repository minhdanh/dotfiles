return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		-- event = "VeryLazy", -- uncomment to use Copilot
		dependencies = {
			{
				"zbirenbaum/copilot.lua",
				-- event = "InsertEnter", -- uncomment to use Copilot
				build = ":Copilot auth",
				config = function()
					require("copilot").setup({
						panel = {
							enabled = true,
							auto_refresh = true,
							keymap = {
								jump_prev = "[[",
								jump_next = "]]",
								accept = "<CR>",
								refresh = "gr",
								open = "<M-CR>",
							},
							layout = {
								position = "bottom", -- | top | left | right
								ratio = 0.4,
							},
						},
						suggestion = {
							enabled = true,
							auto_trigger = true,
							debounce = 75,
							keymap = {
								accept = "<Tab>",
								accept_word = false,
								accept_line = false,
								next = "<M-]>",
								prev = "<M-[>",
								dismiss = "<C-]>",
							},
						},
						filetypes = {
							["*"] = true,
						},
					})
				end,
			}, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
