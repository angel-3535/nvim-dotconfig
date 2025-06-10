
  return {
      "vague2k/vague.nvim",
      config = function()
        require("vague").setup({
          transparent = false,
          colors = {
            bg = "#080808",
          },
        })
        vim.cmd.colorscheme("vague")
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#282828"})
      end
    }
