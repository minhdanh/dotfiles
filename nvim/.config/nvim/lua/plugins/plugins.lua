return {
	-- {
	--    "joshdick/onedark.vim",
	--    lazy = false,
	--    priority = 1000, -- make sure to load this before all the other start plugins
	--    config = function()
	--      vim.cmd([[colorscheme onedark]])
	--    end,
	--  },
	{
		-- "kaicataldo/material.vim",
		"hzchirs/vim-material",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme vim-material]])
			-- vim.g.material_style = 'oceanic'
		end,
	},
	-- { "tpope/vim-endwise",     lazy = true },
	{ "tpope/vim-surround" },
	{ "tpope/vim-abolish" },
	{
		"mhinz/vim-startify",
		lazy = false,
		config = function()
			vim.g.startify_change_to_dir = 0
		end,
	},
	{ "mityu/vim-applescript" },
	-- { "dpayne/CodeGPT.nvim", lazy = true },
}
