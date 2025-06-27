return {
	"tpope/vim-fugitive",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap

		local opts = {}

		opts.desc = "Git status"
		keymap.set("n", "<leader>g", "<CMD>Git<CR>", opts)

		opts.desc = "Git push current branch to origin"
		keymap.set("n", "<leader>gp", function()
			local branch = vim.fn.systemlist("git branch --show-current")[1]
			vim.cmd("Git! push origin " .. branch)
		end)
	end,
}
