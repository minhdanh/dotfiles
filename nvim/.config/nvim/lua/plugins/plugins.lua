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
    end
  },
  { "folke/which-key.nvim", lazy = true },
  { "tpope/vim-endwise", lazy = true },
  { "tpope/vim-commentary", lazy = true },
  { "tpope/vim-surround", lazy = true },
  { "tpope/vim-abolish", lazy = true },
  { "godlygeek/tabular", lazy = true },
  { "editorconfig/editorconfig-vim", lazy = true },
	{ "mhinz/vim-startify", lazy = false },
	{ "easymotion/vim-easymotion", lazy = true },
	{ "sheerun/vim-polyglot", lazy = true },
	{ "fatih/vim-go", build = ":GoUpdateBinaries" },
	{ "nvie/vim-flake8", lazy = true },
	{ "mityu/vim-applescript", lazy = true },
	-- { "dpayne/CodeGPT.nvim", lazy = true },
}
