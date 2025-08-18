return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()

      --vim.keymap.set("n", "<leader>GL", ":Gitsigns preview_hunk_inline<CR>")
      vim.keymap.set("n", "<leader>GP", ":Gitsigns preview_hunk<CR>", {})
    end
  }
}
