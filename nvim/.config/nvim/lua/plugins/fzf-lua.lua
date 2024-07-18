return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<c-p>",
				":lua require('fzf-lua').git_files({ fzf_opts = {['--layout'] = 'default'} })<CR>",
				desc = "Search for git files",
				mode = "n",
			},
			{
				"<c-m>",
				":lua require('fzf-lua').git_commits({ fzf_opts = {['--layout'] = 'default'} })<CR>",
				desc = "Search for git logs",
				mode = "n",
			},
			{
				"<c-k>",
				":lua require('fzf-lua').live_grep_native({ fzf_opts = {['--layout'] = 'default'} })<CR>",
				desc = "Live grep in current project",
				mode = "n",
			},
			{
				"<c-n>",
				":lua require('fzf-lua').buffers({ fzf_opts = {['--layout'] = 'default'} })<CR>",
				desc = "Search opened buffers",
				mode = "n",
			},
			{
				"ff",
				":lua require('fzf-lua').grep_cword({ fzf_opts = {['--layout'] = 'default'} })<CR>",
				desc = "Search for current word",
				mode = "n",
			},
			{
				"<c-;>",
				":lua require('fzf-lua').resume()<CR>",
				desc = "Resume",
				mode = "n",
			},
		},
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
}
