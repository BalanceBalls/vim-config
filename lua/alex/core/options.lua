local opt = vim.opt

vim.g.mapleader = " "

-- Use powershell as default terminal
opt.shell = "powershell.exe"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & ident
opt.tabstop = 2
opt.shiftwidth = 0
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- appearance
-- opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
