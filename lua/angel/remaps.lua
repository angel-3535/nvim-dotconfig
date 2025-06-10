vim.g.mapleader = " "


--highlight move with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--move Control + a to Control + b
vim.keymap.set("n", "<C-b>", "<C-a>")

--Highlight half page up/down
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")

--Control +  C  = ESC
vim.keymap.set("i", "<C-c>", "<Esc>")

--Yank to clipboard
vim.keymap.set("v", "<leader>y", "\"*y")
vim.keymap.set("v", "<leader>y", "\"*y")

--Explore with space + p + v
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", {})

--Exit terminal mode with
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")


--remove highligh from search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
