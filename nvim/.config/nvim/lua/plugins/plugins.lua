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
  { "tpope/vim-commentary",  lazy = true },
  { "tpope/vim-surround",    lazy = true },
  { "tpope/vim-abolish",     lazy = true },
  { "mhinz/vim-startify",    lazy = false },
  { "fatih/vim-go",          build = ":GoUpdateBinaries" },
  { "mityu/vim-applescript", lazy = true },
  -- { "dpayne/CodeGPT.nvim", lazy = true },
}
