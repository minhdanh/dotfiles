vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = true
vim.g.editorconfig_enable = true
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "120"
vim.o.numberwidth = 5
vim.o.incsearch = true
vim.o.hidden = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.autowrite = true
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.shiftwidth = 2
vim.o.shiftround = true -- Round indent
vim.o.softtabstop = 2
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.autoindent = true
vim.o.smartindent = true -- Insert indents automatically
vim.o.smartcase = true
vim.o.mouse = "a"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.ignorecase = true
vim.o.backspace = "indent,eol,start"
vim.o.conceallevel = 0
-- Preview substitutions live, as you type!
vim.o.inccommand = "split"
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"
vim.o.linebreak = true -- Wrap lines at convenient points
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true -- True color support

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "¦ ", trail = "·", nbsp = "·" }

vim.o.undofile = true
vim.o.undolevels = 10000
-- vim.o.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
-- Highlight SpecialKey
vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#649A9A" })

vim.o.cursorline = true -- Show which line your cursor is on

vim.o.hlsearch = true

vim.o.smoothscroll = true
