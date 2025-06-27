return {
	"tpope/vim-fugitive",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>g", "<cmd>Git<cr>", { desc = "Git status" })
		keymap.set("n", "<leader>gp", function()
			local branch = vim.fn.systemlist("git branch --show-current")[1]
			vim.cmd("Git! push origin " .. branch)
		end, { desc = "Git push current branch to origin" })
	end,
}
