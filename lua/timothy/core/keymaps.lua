vim.g.mapleader = " "

local keymap = vim.keymap -- global variable used to set keymaps

-- general

keymap.set("i", ";;", "<ESC>", { desc = "Exit insert mode with ;;" }) -- Do ;; to exit insert mode
keymap.set("v", ";;", "<ESC>", { desc = "Exit visual mode with ;;" }) -- Do ;; to exit visual mode

keymap.set("n", "<leader>fq", ":q!<CR>", { desc = "Force quit" }) -- force quit with leader key

keymap.set("n", "x", '"_x"', { desc = "When deleting characters, don't copy them to the register" })
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear highlighted items after search" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment numbers with +" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement numbers with -" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down one level" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up one level" })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new, empty tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- global text replace within a file in vim
keymap.set("n", "<leader>gr", ":%s/o/r/g", { desc = "Replace all instances of <o> with <r>" })

-- plugin keymaps

-- vim maximiser already configured in plugins/maximiser.lua

-- vim-tmux-navigator
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "Split windows horizontally" })
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split windows vertically" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows of equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })
keymap.set("n", "<leader>ssr", "<C-w><S-h>", { desc = "Switch right window to left & left window to right" })
keymap.set("n", "<leader>ssl", "<C-w><S-l>", { desc = "Switch left window to right & right window to left" })

-- nvim-tree (configured in plugins/nvim-tree)

-- telescope (configured in plugins/telescope.lua
