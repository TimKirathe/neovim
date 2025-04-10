return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local harpoon = require("harpoon")

		harpoon.setup({
			global_settings = {
				save_on_toggle = false,
				save_on_change = true,
				enter_on_sendcmd = false,
				tmux_autoclose_windows = false,
				excluded_filetypes = { "harpoon" },
				mark_branch = true,
				tabline = false,
				tabline_prefix = "    ",
				tabline_suffix = "    ",
			},
		})

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local finder = function()
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				return require("telescope.finders").new_table({ results = file_paths })
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<C-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_bufnr)

							table.remove(harpoon_files.items, selected_entry.index)
						end)
						return truee
					end,
				})
				:find()
		end

		local keymap = vim.keymap
		local opts = { noremap = true }

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, opts)
		keymap.set("n", "<leader>hm", function()
			toggle_telescope(harpoon:list())
		end, opts)
		keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end, opts)
		keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end, opts)
		keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end, opts)
		keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end, opts)
		keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, opts)
		keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, opts)
	end,
}
