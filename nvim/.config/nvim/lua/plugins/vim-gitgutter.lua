return {
  {
    "airblade/vim-gitgutter",
    lazy = false,
    config = function()
      vim.g.gitgutter_escape_grep = 1
      vim.g.gitgutter_highlight_lines = 0
      vim.cmd([[highlight clear SignColumn]])
    end
  },
}

