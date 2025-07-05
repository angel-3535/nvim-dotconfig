return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
    },
    plugins = {
      options = {
        enabled = true,
        ruler = true,
        showcmd = true,
        -- you may turn on/off statusline in zen mode by setting 'laststatus'
        -- statusline will be shown only if 'laststatus' == 3
        laststatus = 3,               -- turn off the statusline in zen mode
      },
      twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = true },      -- disables the tmux statusline
      todo = { enabled = false },     -- if set to "true", todo-comments.nvim highlights will be disabled
    },
    on_open = function(win)
    end,
    on_close = function()
    end,
  }
}
