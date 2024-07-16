return {
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    lazy = false,
    config = function()
      vim.cmd([[highlight CursorLineNr ctermbg=0 cterm=none]])
    end
  },
}
