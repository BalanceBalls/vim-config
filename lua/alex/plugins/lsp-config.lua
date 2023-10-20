-- loading module to provide config for a server following steps from guide here
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/doc/lspconfig.txt#L326
local configs = require "lspconfig.configs"

-- copy paste from 
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/lua/lspconfig/server_configurations/gopls.lua
local util = require "lspconfig.util"
local async = require "lspconfig.async"
-- -> the following line fixes it - mod_cache initially set to value that you've got from `go env GOMODCACHE` command
local mod_cache = "C:\\Users\\alex2\\go\\pkg\\mod"

-- setting the config for gopls, the contents below is also copy-paste from
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/lua/lspconfig/server_configurations/gopls.lua
configs.gopls = {
    default_config = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = function(fname)
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        if not mod_cache then
          local result = async.run_command "go env GOMODCACHE"
          if result and result[1] then
            mod_cache = vim.trim(result[1])
          end
        end
        if fname:sub(1, #mod_cache) == mod_cache then
          local clients = vim.lsp.get_active_clients { name = "gopls" }
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return util.root_pattern "go.work"(fname) or util.root_pattern("go.mod", ".git")(fname)
      end,
      single_file_support = true,
    },
    docs = {
      description = [[
  https://github.com/golang/tools/tree/master/gopls
  
  Google's lsp server for golang.
  ]],
      default_config = {
        root_dir = [[root_pattern("go.work", "go.mod", ".git")]],
      },
    },
  }
-- All of the above is a fix for https://github.com/neovim/nvim-lspconfig/issues/2733

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global "vim"
lsp.nvim_workspace()


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.completion() end, opts)
  vim.keymap.set("n", "<leader>ss", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
  vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)
  vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
