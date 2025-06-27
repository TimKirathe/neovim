return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

			opts.desc = "Signature information about the symbol under the cursor"
			keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure python server
		lspconfig["pylsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pylsp = {
					plugins = {
						pyflakes = { enabled = false },
						pycodestyle = { enabled = false },
						autopep8 = { enabled = false },
						yapf = { enabled = false },
						mccabe = { enabled = false },
						pylsp_mypy = { enabled = false },
						pylsp_black = { enabled = false },
						pylsp_isort = { enabled = false },
					},
				},
			},
		})

		-- configure ruff linter/lsp
		lspconfig["ruff"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			commands = {
				RuffAutofix = {
					function()
						vim.lsp.buf.execute_command({
							command = "ruff.applyAutofix",
							arguments = {
								{ uri = vim.uri_from_bufnr(0) },
							},
						})
					end,
					description = "Ruff: Fix all auto-fixable problems",
				},
				RuffOrganizeImports = {
					function()
						vim.lsp.buf.execute_command({
							command = "ruff.applyOrganizeImports",
							arguments = {
								{ uri = vim.uri_from_bufnr(0) },
							},
						})
					end,
					description = "Ruff: Format imports",
				},
			},
		})

		-- configure clangd server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure bashls server
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- lspconfig["denols"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		-- 	init_options = {
		-- 		enable = true,
		-- 		lint = true,
		-- 		unstable = true,
		-- 	},
		-- })

		lspconfig["dartls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				dart = {
					analysisExcludedFolders = {
						vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
						vim.fn.expand("$HOME/.pub-cache/"),
						vim.fn.expand("/opt/homebrew/"),
						vim.fn.expand("$HOME/tools/flutter/"),
					},
				},
			},
		})
	end,
}
