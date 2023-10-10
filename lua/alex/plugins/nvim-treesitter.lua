require('nvim-treesitter.configs').setup{
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
    "sql",
    "svelte",
    "yaml",
    "c_sharp"
  },
  indent = {
    enable = true,
  },
  auto_install = true,
  ignore_install = { 'phpdoc' },
  highlight = { enable = true }
}
