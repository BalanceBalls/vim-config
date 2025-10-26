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

require("lazy").setup({
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "williamboman/mason.nvim",
        tag = "stable",
        lazy = false,
        config = true,
    },
    { import = "alex.plugins" }
})

vim.cmd([[colorscheme ayu]])

vim.lsp.enable("go")
