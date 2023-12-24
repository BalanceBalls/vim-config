vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>hh", ":noh<CR>") -- hide higlights
keymap.set("n", "<leader>tj", ":sp | ter<CR>") -- space + t + j : split horizontally and open termianl in a new window 
keymap.set("n", "<leader>tl", ":vs | ter<CR>") -- space + t + l : split horizontally and opern terminal in a new window
keymap.set("n", "<leader>tt", ":tabnew | ter<CR>") -- spsace + t + t : open a terminal in a new tab
keymap.set("n", "<leader>nt", ":tabnew<CR>") -- space + n + t : open a new tab

keymap.set("n", "<leader>th", ":tabnew ~/.config/nvim/lua/alex/cheatsheet.md<CR>") -- open cheatsheet

keymap.set("n", "<leader>ee", ":Lex<CR>:vertical resize 50<CR>") -- open/close file explorer
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>:vertical resize 50<CR>")

keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("t", "<C-q>q", [[<C-\><C-n>]]) -- exit terminal mode
keymap.set("n", "<leader>cd", "<PageDown><C-u>M", { noremap = true, silent = true })

keymap.set("n", "j", "jzz", { noremap = true, silent = true })
keymap.set("n", "k", "kzz", { noremap = true, silent = true })

keymap.set('n', '<leader>fc', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = '[/] Fuzzily search in current buffer' })

keymap.set("n", "<leader>goj", ":GoTagAdd json<CR>")
keymap.set("n", "<leader>goe", ":GoIfErr<CR>")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap.set("n", "<leader>hn", function() ui.nav_next() end)
keymap.set("n", "<leader>hp", function() ui.nav_prev() end)
keymap.set("n", "<leader>hd", function() ui.toggle_quick_menu() end)
keymap.set("n", "<leader>ha", function() mark.add_file() end)
keymap.set("n", "<leader>hu", function() mark.rm_file() end)
keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)

keymap.set("v", "<leader>lec", ":Ollama<CR>2<CR>") -- Explain code
keymap.set("v", "<leader>lem", ":Ollama<CR>4<CR>") -- Modify code
keymap.set("n", "<leader>lsu", ":OllamaServe<CR>") -- Ollama start 
keymap.set("n", "<leader>lsd", ":OllamaServeStop<CR>") -- Ollama stop 
keymap.set("n", "<leader>lsm", ":OllamaModel<CR>") -- Change model
keymap.set("n", "<leader>ll", ":Ollama<CR>") -- List prompts
keymap.set("v", "<leader>ll", ":Ollama<CR>") -- List prompts

keymap.set("n", "<leader>clt", ":colorscheme catppuccin-latte<CR>")
keymap.set("n", "<leader>cdt", ":colorscheme catppuccin-mocha<CR>")
keymap.set("n", "<leader>cgv", ":colorscheme gruvbox-material<CR>")
keymap.set("n", "<leader>cod", ":colorscheme onedark<CR>")

local dap = require("dap")
local widgets = require("dap.ui.widgets");
local sidebar = widgets.sidebar(widgets.scopes);
keymap.set("n", "<leader>sb", function() dap.toggle_breakpoint() end)
keymap.set("n", "<leader>5", function() dap.continue() end)
keymap.set("n", "<leader>1", function() dap.step_over() end)
keymap.set("n", "<leader>2", function() dap.step_into() end)
keymap.set("n", "<leader>3", function() dap.step_out() end)
keymap.set("n", "<leader>dow", function() sidebar.open() end) -- debugger open window
keymap.set("n", "<leader>dcw", function() sidebar.close() end) -- debugger close window
keymap.set({ "n", "v"}, "<leader>dh", function() widgets.hover() end)
keymap.set({"n", "v"}, "<leader>dp", function() widgets.preview() end)
keymap.set("n", "<leader>df", function() widgets.centered_float(widgets.frames) end)
keymap.set("n", "<leader>ds", function() widgets.centered_float(widgets.scopes) end)

keymap.set("n", "<leader>wl", ":vertical resize +30<CR>")
keymap.set("n", "<leader>wh", ":vertical resize -30<CR>")
keymap.set("n", "<leader>we", ":wincmd =<CR>")

keymap.set("n", "<leader>ww", ":set wrap<CR>")


-- Go bindings
keymap.set("n", "<leader>ir", ":GoIfErr<CR>")
