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
    priority = 99,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "phpactor","tsserver","html"}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 98,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({capabilties = capabilities})
      lspconfig.phpactor.setup({capabilties = capabilities})
      lspconfig.tsserver.setup({capabilties = capabilities})
      lspconfig.html.setup({capabilties = capabilities})

      vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
      vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
      vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          --vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end
      })
    end,
  },

}
