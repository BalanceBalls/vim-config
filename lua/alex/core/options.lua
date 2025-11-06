local opt = vim.opt

vim.filetype.add({
	extension = {
		templ = "templ",
		log = "log",
	},
})

vim.g.mapleader = " "

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & ident
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
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

vim.diagnostic.config({
	open = true,
	severity = { min = vim.diagnostic.severity.WARN },
})
