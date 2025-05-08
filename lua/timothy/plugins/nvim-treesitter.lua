return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"html",
				"css",
				"javascript",
				"json",
				"python",
				"tmux",
				"xml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
					},
					goto_previous_start = {
						["[t"] = "@function.outer",
					},
					goto_previous_end = {
						["[T"] = "@function.outer",
					},
				},
			},
		})
	end,
}
