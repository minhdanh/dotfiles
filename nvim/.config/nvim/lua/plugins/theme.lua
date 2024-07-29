return {
	{
		"joshdick/onedark.vim",
		lazy = false,
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"hzchirs/vim-material",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme vim-material]])
			-- vim.g.material_style = 'oceanic'
		end,
	},
}
