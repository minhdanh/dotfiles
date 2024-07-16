return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
	  keys = {
      { "<Leader>g", ":Gitsigns blame_line<CR>", desc = "Git blame for a line", mode = "n" },
	  },
    config = function()
      -- vim.cmd([[highlight clear SignColumn]])
      require('gitsigns').setup()
    end
  },
}

