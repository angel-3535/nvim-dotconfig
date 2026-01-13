return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = false,   -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })
    vim.cmd("colorscheme gruvbox")

    -- Theme toggle commands
    vim.api.nvim_create_user_command("ThemeToggle", function()
      if vim.o.background == "dark" then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
    end, {})

    vim.api.nvim_create_user_command("ThemeLight", function()
      vim.o.background = "light"
    end, {})

    vim.api.nvim_create_user_command("ThemeDark", function()
      vim.o.background = "dark"
    end, {})
  end
}
