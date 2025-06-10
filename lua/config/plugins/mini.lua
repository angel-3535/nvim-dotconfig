return {
  'echasnovski/mini.nvim',
  lazy = false,
  config = function()
    require('mini.statusline').setup({
      use_icons = true,
    })
    require('mini.tabline').setup({
      tabpage_section = 'left',
    })
  end
}
