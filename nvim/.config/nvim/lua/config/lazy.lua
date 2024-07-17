-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = true
vim.g.editorconfig_enable = true
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "80"
vim.o.numberwidth = 5
vim.o.incsearch = true
vim.o.hidden = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.autowrite = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.mouse = "a"
vim.o.completeopt = vim.o.completeopt:gsub("preview", "")
vim.o.ignorecase = true
vim.o.backspace = "indent,eol,start"
vim.o.conceallevel = 0

-- Listchars
vim.opt.list = true
vim.opt.listchars = {
	tab = "¦ ",
	trail = "·",
	nbsp = "·",
}

-- Highlight SpecialKey
vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#649A9A" })

-- Cursorline
vim.o.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#444444" })

-- Syntax highlighting and search
if vim.fn.has("gui_running") == 1 then
	vim.cmd("syntax on")
	vim.o.hlsearch = true
end

local opt = vim.opt
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
	opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
	opt.foldmethod = "expr"
	opt.foldtext = ""
else
	opt.foldmethod = "indent"
	opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

require("config.keymaps")
require("config.autocmds")
