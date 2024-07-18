return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>k", ":Neotree toggle<CR>", desc = "Open file manager sidebar", mode = "n" },
			{ "vf", ":Neotree reveal_file=%:p<CR>", desc = "Reveal current file in sidebar", mode = "n" },
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
						["-"] = "navigate_up",
						["N"] = "add",
						["K"] = "add_directory",
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
				},
			})
		end,
	},
}
