return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- opts = function(_, opts)
		--   table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
		-- end,
		config = function()
			require("lualine").setup({
				options = {
					theme = "material",
				},
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
	},
}
