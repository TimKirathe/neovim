local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping in case text overflows screen
opt.wrap = false

-- search settings
opt.ignorecase = false
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no"

-- backspace
opt.backspace = "indent,eol,start"

-- make deleting and yanking text go to system clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider '-' in text to be part of a word.
opt.iskeyword:append("-")
