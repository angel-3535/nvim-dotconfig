---@diagnostic disable-next-line: unused-local
local ever = {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("everforest").setup({
            vim.cmd.colorscheme "everforest"
        })
    end,
}

---@diagnostic disable-next-line: unused-local
local gruv = {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            vim.cmd.colorscheme "gruvbox"
        })
    end,
}

---@diagnostic disable-next-line: unused-local
local rose = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "dawn",      -- auto, main, moon, or dawn
            dark_variant = "dawn", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            -- vim.cmd("colorscheme rose-pine")
            vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        })
    end,
}
return gruv
