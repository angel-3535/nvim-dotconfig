--set cursor to always be a block []
vim.opt.guicursor = "n-v-c:block,i:block,r-cr:block,o:block"

--line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--tabs config

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true


--disable line wrap
vim.opt.wrap = false

--Enable white space
vim.opt.list = false
vim.opt.listchars = {
  tab      = "▸ ", -- show tabs as “▸·”
  trail    = "·", -- trailing spaces as “·”
  extends  = "»", -- when line continues past the right edge
  precedes = "«", -- when line continues past the left edge
  nbsp     = "␣", -- non-breaking spaces as “␣”
}


--window slitting
vim.opt.splitright = true
vim.opt.splitbelow = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.termguicolors = true
vim.cmd [[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
]]

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = ""
