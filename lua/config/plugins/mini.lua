return {
  'echasnovski/mini.nvim',
  lazy = false,
  config = function()
    require('mini.icons').setup({
      icons = {
        File = '󰈙',
        Folder = '󰉋',
        Bookmark = '󰆕',
        Search = '󰒋',
        Git = '󰊢',
        Diagnostics = '󰒡',
      },
    })
    require('mini.statusline').setup({
      use_icons = true,
    })
    require('mini.tabline').setup({
      use_icons = true,
      tabpage_section = 'left',
    })
  end
}
