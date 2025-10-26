local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("alex.lazy")

require("alex.core.options")
require("alex.core.keymaps")
require("alex.plugins.nvim-treesitter")
require("alex.plugins.telescope")
require("alex.plugins.nvim-cmp")
require("alex.plugins.nvim-tree")
require("alex.plugins.gitsigns")
require("alex.plugins.trouble")
require("alex.plugins.gen")
require("alex.plugins.themes")

-- gruvbox-material
-- americano
-- onedark
-- ayu
vim.cmd([[colorscheme ayu]])

require("alex.plugins.misc")
require("alex.lsp.go")
