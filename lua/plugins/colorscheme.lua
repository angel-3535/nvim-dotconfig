---@diagnostic disable-next-line: unused-local
local gruv = {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      vim.cmd.colorscheme "gruvbox",
      transparent_mode = false,
    })
  end,
}

---@diagnostic disable-next-line: unused-local
local cap = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local latte = require("catppuccin.palettes").get_palette "latte"
    local frappe = require("catppuccin.palettes").get_palette "frappe"
    local macchiato = require("catppuccin.palettes").get_palette "macchiato"
    local mocha = require("catppuccin.palettes").get_palette "mocha"
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = {    -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
      term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,             -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,           -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,             -- Force no italic
      no_bold = false,               -- Force no bold
      no_underline = false,          -- Force no underline
      styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },     -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    })

    vim.cmd.colorscheme "catppuccin"
  end
}


---@diagnostic disable-next-line: unused-local
local onedarkpro = {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,           -- Use a transparent background?
      }
    })
    vim.cmd("colorscheme onedark")
  end
}

---@diagnostic disable-next-line: unused-local
local vsCode = {
  "Mofiqul/vscode.nvim",

  config = function()
    vim.o.background = 'dark'

    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
      transparent = true,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
      color_overrides = {
        vscLineNumber = '#FFFFFF',
      },
      group_overrides = {
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      }
    })
    -- require('vscode').load()
    vim.cmd.colorscheme "vscode"
  end
}



return onedarkpro
