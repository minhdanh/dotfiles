return {
  {
	  "ibhagwan/fzf-lua",
	  -- optional for icon support
	  dependencies = { "nvim-tree/nvim-web-devicons" },
	  keys = {
	      { "<c-p>", ":lua require('fzf-lua').git_files({ fzf_opts = {['--layout'] = 'default'} })<CR>", desc = "Search for git files", mode = "n" },
	      { "ff", ":lua require('fzf-lua').grep_cword({ fzf_opts = {['--layout'] = 'default'} })<CR>", desc = "Search for current word", mode = "n" },
	  },
	  config = function()
	    -- calling `setup` is optional for customization
	    require("fzf-lua").setup({})
	  end
	},
}
