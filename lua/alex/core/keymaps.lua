vim.g.mapleader = " "

local keymap = vim.keymap

-- Misc
keymap.set("n", "<leader>hh", ":noh<CR>") -- hide higlights
keymap.set("n", "<leader>tj", ":sp | ter<CR>") -- space + t + j : split horizontally and open termianl in a new window
keymap.set("n", "<leader>tl", ":vs | ter<CR>") -- space + t + l : split horizontally and opern terminal in a new window
keymap.set("n", "<leader>tt", ":tabnew | ter<CR>") -- spsace + t + t : open a terminal in a new tab
keymap.set("n", "<leader>nt", ":tabnew<CR>") -- space + n + t : open a new tab

keymap.set("n", "<leader>th", ":tabnew ~/.config/nvim/lua/alex/cheatsheet.md<CR>") -- open cheatsheet

keymap.set("n", "<leader>ee", ":Lex<CR>:vertical resize 50<CR>") -- open/close file explorer
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>:vertical resize 50<CR>")

keymap.set("t", "<C-q>q", [[<C-\><C-n>]]) -- exit terminal mode
keymap.set("n", "<leader>cd", "<PageDown><C-u>M", { noremap = true, silent = true })

keymap.set("n", "j", "jzz", { noremap = true, silent = true })
keymap.set("n", "k", "kzz", { noremap = true, silent = true })

keymap.set("n", "<leader>wl", ":vertical resize +30<CR>")
keymap.set("n", "<leader>wh", ":vertical resize -30<CR>")
keymap.set("n", "<leader>we", ":wincmd =<CR>")

keymap.set("n", "<leader>ww", ":set wrap<CR>")

keymap.set({ "n", "i" }, "<leader>ls", ":LLMSuggestion<CR>")
keymap.set("n", "<leader>lsa", ":LLMToggleAutoSuggest<CR>")
keymap.set("n", "<leader>ld", ":lua require('omnisharp_extended').lsp_definition()<CR>")
keymap.set("n", "<leader>li", ":lua require('omnisharp_extended').lsp_implementation()<CR>")
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- Harpoon
local harpoon = require("harpoon")
keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end)
keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end)
keymap.set("n", "<leader>hd", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end)
keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end)
keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end)
keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end)

-- LLM plugin
keymap.set("v", "<leader>gs", ":'<,'>Gen<CR>")
keymap.set("n", "<leader>g", ":Gen<CR>")
keymap.set("n", "<leader>gg", ":Gen Chat<CR>")
keymap.set("n", "<leader>gm", ":lua require('gen').select_model()<CR>")

-- Theme switch
keymap.set("n", "<leader>cgv", ":colorscheme gruvbox-material<CR>")
keymap.set("n", "<leader>cod", ":colorscheme onedark<CR>")
keymap.set("n", "<leader>cmp", ":colorscheme monokai-pro<CR>:MonokaiPro pro<CR>")
keymap.set("n", "<leader>cmo", ":MonokaiPro octagon<CR>")
keymap.set("n", "<leader>cmr", ":MonokaiPro ristretto<CR>")
keymap.set("n", "<leader>cms", ":MonokaiPro spectrum<CR>")

-- Diganostics
keymap.set("n", "<leader>dx", ":Trouble<CR>")
keymap.set("n", "<leader>dxx", ":Trouble diagnostics toggle<CR>")
keymap.set("n", "<leader>dxs", ":Trouble symbols toggle<CR>")
keymap.set("n", "<leader>dxl", ":Trouble lsp toggle<CR>")

-- Tests
keymap.set("n", "<leader>rt", ":lua require('neotest').run.run()<CR>") -- run closest test
keymap.set("n", "<leader>rtf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>") -- run all tests for file
keymap.set("n", "<leader>rto", ":lua require('neotest').summary.open()<CR>") -- open tests panel
