return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require("mason").setup()
    end

  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    branch = "v1.x",
    priority = 99,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "astro",
          "lua_ls",
          "clangd",
          "gopls",
          "html",
          "ols",
          "phpactor",
          "ts_ls",
          "zls"
        }
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "typescript",
              "typescriptreact", "json", "css", "html", "yaml", "markdown" },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = "LspFormatting",
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "prettier" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft   = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      vim.lsp.config('astro', {
        capabilities = capabilities,
        init_options = {
          typescript = {
            tsdk = vim.fs.normalize(
              '~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib')
          },
        },
      })

      vim.lsp.config('dexter', {
        capabilities = capabilities,
        cmd = { 'dexter', 'lsp' },
        root_markers = { '.dexter/dexter.db', '.dexter.db', '.git', 'mix.exs' },
        filetypes = { 'elixir', 'eelixir', 'heex' },
        init_options = {
          followDelegates = true,
        },
      })

      local servers = {
        'astro',
        'dexter',
        'ts_ls',
        'gopls',
        'lua_ls',
        'clangd',
        'html',
        'ols',
        'phpactor',
        'zls',
      }

      for _, server in ipairs(servers) do
        if server ~= 'astro' and server ~= 'dexter' then
          vim.lsp.config(server, { capabilities = capabilities })
        end
      end

      vim.lsp.enable(servers)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          --if we dont have client return early
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          --set keymaps
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
          vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
          vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', '<leader>od', function()
            vim.lsp.buf.definition({
              on_list = function(definitions)
                local definition = definitions.items[1]
                if not definition then return end

                vim.cmd('vsplit')
                vim.cmd('edit ' .. vim.fn.fnameescape(definition.filename))
                vim.api.nvim_win_set_cursor(0, {
                  definition.lnum,
                  math.max(definition.col - 1, 0),
                })
              end,
            })
          end, { buffer = args.buf, desc = 'Open definition in vertical split' })
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format() end)
          --vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<leader>gF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end
      })
    end,
  }
}
