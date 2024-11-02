return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"html",
				"css",
				"csv",
				"java",
				"javascript",
				"json",
				"markdown",
				"markdown_inline",
				"haskell",
				"php",
				"python",
				"solidity",
				"sql",
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
		})
	end,
}
