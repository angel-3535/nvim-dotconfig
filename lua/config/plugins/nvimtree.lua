return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    --Explore with space + p + v
    vim.keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>", {})
  end,
}
