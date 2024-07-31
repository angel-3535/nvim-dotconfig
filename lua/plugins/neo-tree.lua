return{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
    opts = {
        close_if_last_window = true,
        window = {
            mappings = {
                ["Z"] = "expand_all_nodes",
            },
        },
    },
	init = function()
		vim.keymap.set('n', '<C-n>', ':Neotree<CR>',{})
		vim.keymap.set('n', '<leader>pv',':Neotree show toggle<CR>',{})
	end
}

