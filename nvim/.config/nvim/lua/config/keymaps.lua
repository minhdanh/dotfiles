local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Copy selection to clipboard in visual mode
map("v", "<leader>c", '"*y')

-- Move to end of line in insert mode
-- map("i", ",,", "<C-o>$")

-- Find current word quickly using fzf with ripgrep
-- map('n', 'ff', ':Rg <C-R><C-W><CR>')
-- -- Find current selected text in visual mode quickly using fzf with ripgrep
-- map('v', 'ff', 'y:Rg <C-R>"<CR>')

-- Buffer navigation
map("n", "<c-l>", ":bnext<CR>")
map("n", "<c-h>", ":bprevious<CR>")
map("n", "<leader>q", ":bp <BAR> bd #<CR>")
map("n", "<c-y>", ":b#<CR>")

-- Toggle highlight search
map("n", "<leader>m", ":set hlsearch!<cr>")

-- Add a new line without entering insert mode
map("n", "<leader>n", "o<Esc>")
map("n", "<leader>N", "O<Esc>")

-- Save file
map("n", "<leader>s", ":w<CR>")

-- Delete line number 8 and quit when squashing git commits
map("n", "<leader>r", ":8d | wq<CR>")

-- Map j to gj and k to gk, so line navigation ignores line wrap
map("n", "k", "gk")
map("n", "j", "gj")
map("n", "0", "g0")
map("n", "$", "g$")
map("n", "^", "g^")

-- Split windows easier
map("n", "<leader>w", "<C-W>v<C-W>l")

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Retain selection after moving block
map("v", ">", ">gv")
map("v", "<", "<gv")
