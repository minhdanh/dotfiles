return {
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
}
