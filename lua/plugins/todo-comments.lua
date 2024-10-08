return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,      -- show icons in the signs column
    sign_priority = 8, -- sign priority
    keywords = {
      FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "perfect",alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE",         -- The gui style to use for the fg highlight group.
      bg = "BOLD",         -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = true,                -- enable multine todo comments
      multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
      before = "",                     -- "fg" or "bg" or empty
      keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg",                    -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true,            -- uses treesitter to match keywords in comments only
      max_line_len = 400,              -- ignore lines longer than this
      exclude = {},                    -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "#DC2626", },
      warning = { "#b85c00",},
      info = {"#2b79ff"},
      hint = {"#2bb8ff"},
      default = {"#ff0000"},
      test = {"#2d6323"},
      perfect = {"#278a17"}
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    },
  },
  init = function()
    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev({ keywords = { "FIX", "TODO" } })
    end, { desc = "Prev fix/todo todo comment" })
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next({ keywords = { "FIX", "TODO" } })
    end, { desc = "Next fix/todo todo comment" })
  end
}
