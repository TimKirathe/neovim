return {
	"coder/claudecode.nvim",
	dependencies = {
		"folke/snacks.nvim",
		"nvim-tree/nvim-tree.lua",
	},
	config = true,
	keys = {
		{ "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle ClaudeCode" },
		{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus ClaudeCode" },
		{ "<leader>cR", "<cmd>ClaudeCode --resume<cr>", desc = "Resume ClaudeCode" },
		{ "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue ClaudeCode" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to ClaudeCode" },
		{
			"<leader>cs",
			"<cmd>ClaudeCodeSend<cr>",
			mode = "v",
			desc = "Send to ClaudeCode",
		},
		{
			"<leader>cn",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file with ClaudeCode",
			ft = { "NvimTree", "neo-tree", "oil" },
		},
		-- Diff management
		{ "<leader>da", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept ClaudeCode diff" },
		{ "<leader>dd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny ClaudeCode diff" },
		-- Tmux keybind management
		{
			"<C-h>",
			[[<C-\><C-n><Cmd>TmuxNavigateLeft<CR>]],
			mode = "t",
			desc = "Navigate to left pane",
		},
		{
			"<C-j>",
			[[<C-\><C-n><Cmd>TmuxNavigateDown<CR>]],
			mode = "t",
			desc = "Navigate to bottom pane",
		},
		{
			"<C-k>",
			[[<C-\><C-n><Cmd>TmuxNavigateUp<CR>]],
			mode = "t",
			desc = "Navigate to top pane",
		},
		{
			"<C-l>",
			[[<C-\><C-n><Cmd>TmuxNavigateRight<CR>]],
			mode = "t",
			desc = "Navigate to right pane",
		},
		{
			"<Esc>",
			"<Esc>",
			mode = "t",
			desc = "Avoid <Esc> mapping to regular functionality",
			noremap = true,
			silent = true,
		},
	},
}

-- ## Avante config
-- return {
-- 	"yetone/avante.nvim",
-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
-- 	-- ⚠️ must add this setting! ! !
-- 	build = function()
-- 		-- conditionally use the correct build system for the current OS
-- 		if vim.fn.has("win32") == 1 then
-- 			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
-- 		else
-- 			return "make"
-- 		end
-- 	end,
-- 	event = "VeryLazy",
-- 	version = false, -- Never set this value to "*"! Never!
-- 	---@module 'avante'
-- 	---@type avante.Config
-- 	opts = {
-- 		-- add any opts here
-- 		-- for example
-- 		provider = "claude",
-- 		providers = {
-- 			claude = {
-- 				endpoint = "https://api.anthropic.com",
-- 				model = "claude-opus-4-20250514",
-- 				-- model = "claude-sonnet-4-20250514",
-- 				timeout = 30000, -- Timeout in milliseconds
-- 				extra_request_body = {
-- 					temperature = 0.75,
-- 				},
-- 			},
-- 			openai = {
-- 				endpoint = "https://api.openai.com/v1",
-- 				model = "gpt-4o",
-- 				timeout = 30000, -- in milliseconds,
-- 				extra_request_body = {
-- 					max_output_tokens = 20480,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 		--- The below dependencies are optional,
-- 		"echasnovski/mini.pick", -- for file_selector provider mini.pick
-- 		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
-- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
-- 		"ibhagwan/fzf-lua", -- for file_selector provider fzf
-- 		"stevearc/dressing.nvim", -- for input provider dressing
-- 		"folke/snacks.nvim", -- for input provider snacks
-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
-- 		{
-- 			-- support for image pasting
-- 			"HakonHarnes/img-clip.nvim",
-- 			event = "VeryLazy",
-- 			opts = {
-- 				-- recommended settings
-- 				default = {
-- 					embed_image_as_base64 = false,
-- 					prompt_for_file_name = false,
-- 					drag_and_drop = {
-- 						insert_mode = true,
-- 					},
-- 					-- required for Windows users
-- 					use_absolute_path = true,
-- 				},
-- 			},
-- 		},
-- 		{
-- 			-- Make sure to set this up properly if you have lazy=true
-- 			"MeanderingProgrammer/render-markdown.nvim",
-- 			opts = {
-- 				file_types = { "markdown", "Avante" },
-- 			},
-- 			ft = { "markdown", "Avante" },
-- 		},
-- 	},
-- }
