return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    build = "make install_jsregexp",
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local function set_cmp_highlights()
        vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#1d2021", fg = "#ebdbb2" })
        vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#1d2021", fg = "#fe8019" })
        vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#3c3836", fg = "#fbf1c7", bold = true })
        vim.api.nvim_set_hl(0, "CmpSearch", { bg = "#504945", fg = "#fabd2f", bold = true })
        vim.api.nvim_set_hl(0, "CmpMenu", { bg = "#1d2021", fg = "#a89984" })
        vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#1d2021", fg = "#ebdbb2" })
        vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#1d2021", fg = "#83a598" })
      end

      set_cmp_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("angel-cmp-highlights", { clear = true }),
        callback = set_cmp_highlights,
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            scrollbar = true,
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpCursorLine,Search:CmpSearch",
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
          }),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            local menu = {
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
            }

            vim_item.menu = menu[entry.source.name] or ("[" .. entry.source.name .. "]")
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
