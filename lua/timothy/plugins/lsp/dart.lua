return {
	"nvim-flutter/flutter-tools.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"dart-lang/dart-vim-plugin",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.g.dart_style_guide = 2
		vim.g.dart_format_on_save = 1
		vim.g.dart_trailing_comma_indent = true
		vim.g.dart_html_in_string = true

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			-- opts.desc = "Show LSP references"
			-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration" -- In C this would take you to header. Not definition in .c file
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show Document Symbols"
			keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", opts)

			opts.desc = "Show Workspace Symbols"
			keymap.set("n", "gw", "<cmd>Telescope lsp_dynamic_workspace_symbols", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_references<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			opts.desc = "Signature information about the symbol under the cursor"
			keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)

			opts.desc = "Start flutter"
			keymap.set("n", "<leader>F", "<cmd>FlutterRun<cr>", opts)

			opts.desc = "Quit flutter"
			keymap.set("n", "<leader>FQ", "<cmd>FlutterQuit<cr>", opts)

			opts.desc = "Reload flutter app"
			keymap.set("n", "<leader>Fr", "<cmd>FlutterReload<cr>", opts)

			opts.desc = "Restart flutter app"
			keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<cr>", opts)
		end

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
				on_attach = on_attach,
				capabilities = capabilities,
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

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
