return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "dockerfile",
                "gitignore",
                "go",
                "gomod",
                "gowork",
                "javascript",
                "json",
                "lua",
                "markdown",
                "proto",
                "python",
                "rego",
                "ruby",
                "sql",
                "svelte",
                "yaml",
                "c_sharp",
                "templ"
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            ignore_install = { 'phpdoc' },
            highlight = { enable = true }
        }
    end
}
