return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function()
        return {}
      end,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    })
    vim.cmd("colorscheme kanagawa")

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
