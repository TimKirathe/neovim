return {
	"nvim-flutter/flutter-tools.nvim",
	ft = "dart",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"dart-lang/dart-vim-plugin",
	},
	config = function()
		vim.g.dart_style_guide = 2
		vim.g.dart_format_on_save = 1
		vim.g.dart_trailing_comma_indent = true
		vim.g.dart_html_in_string = true

		require("flutter-tools").setup({
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				highlight = "Comment",
				prefix = "//",
				enabled = true,
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					foreground = false,
					virtual_text = true,
					virtual_text_str = "■",
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
				},
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(_)
					require("dap").configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Start flutter"
		keymap.set("n", "<leader>F", "<cmd>FlutterRun<cr>", opts)

		opts.desc = "Quit flutter"
		keymap.set("n", "<leader>FQ", "<cmd>FlutterQuit<cr>", opts)

		opts.desc = "Reload flutter app"
		keymap.set("n", "<leader>Fr", "<cmd>FlutterReload<cr>", opts)

		opts.desc = "Restart flutter app"
		keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<cr>", opts)
	end,
}
