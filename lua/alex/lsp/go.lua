require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls" },
})

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    on_attach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf)
  end,
})

vim.lsp.start({
    name = 'gopls',
    cmd = {'gopls'},
    root_dir = vim.fs.dirname(vim.fs.find({'go.work', 'go.mod', '.git'}, {upward = true})[1]),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})
