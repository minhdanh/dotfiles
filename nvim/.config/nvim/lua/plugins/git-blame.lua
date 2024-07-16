return {
  {
    "zivyangll/git-blame.vim",
    lazy = true,
	  keys = {
      -- See git blame for line
      { "<Leader>g", ":<C-u>call gitblame#echo()<CR>", desc = "Git blame", mode = "n" },
    },
  },
}
