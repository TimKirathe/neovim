return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
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
		end
		require("typescript-tools").setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
			-- settings = {
			-- 	-- spawn additional tsserver instance to calculate diagnostics on it
			-- 	separate_diagnostic_server = true,
			-- 	-- "change"|"insert_leave" determine when the client asks the server about diagnostic
			-- 	publish_diagnostic_on = "insert_leave",
			-- 	-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
			-- 	-- "remove_unused_imports"|"organize_imports") -- or string "all"
			-- 	-- to include all supported code actions
			-- 	-- specify commands exposed as code_actions
			-- 	expose_as_code_action = { "all" },
			-- 	-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
			-- 	-- not exists then standard path resolution strategy is applied
			-- 	tsserver_path = nil,
			-- 	-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
			-- 	-- (see 💅 `styled-components` support section)
			-- 	tsserver_plugins = {},
			-- 	-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
			-- 	-- memory limit in megabytes or "auto"(basically no limit)
			-- 	tsserver_max_memory = "auto",
			-- 	-- described below
			-- 	tsserver_format_options = {},
			-- 	tsserver_file_preferences = {},
			-- 	-- locale of all tsserver messages, supported locales you can find here:
			-- 	-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
			-- 	tsserver_locale = "en",
			-- 	-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
			-- 	complete_function_calls = false,
			-- 	include_completions_with_insert_text = true,
			-- 	-- CodeLens
			-- 	-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
			-- 	-- possible values: ("off"|"all"|"implementations_only"|"references_only")
			-- 	code_lens = "off",
			-- 	-- by default code lenses are displayed on all referencable values and for some of you it can
			-- 	-- be too much this option reduce count of them by removing member references from lenses
			-- 	disable_member_code_lens = true,
			-- 	-- JSXCloseTag
			-- 	-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
			-- 	-- that maybe have a conflict if enable this feature. )
			-- 	jsx_close_tag = {
			-- 		enable = false,
			-- 		filetypes = { "javascriptreact", "typescriptreact" },
			-- 	},
			-- },
		})
	end,
}
