vim.g.mapleader = " "
vim.g.deprecation_warnings = false
--set relativenumber
vim.opt.nu= true
vim.opt.relativenumber= true

--set 4 space indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

--disable line wrap
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--============================windowsplititng=============================
vim.opt.splitright = true
vim.opt.splitbelow = true
--============================search=============================
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = ""

--============================clipboard=============================
--vim.opt.clipboard = 'unnamedplus'

--============================autocomands=============================
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
   vim.highlight.on_yank()
  end,
})

