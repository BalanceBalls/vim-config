-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- configure/enable gitsigns
gitsigns.setup{
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>ghs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>ghs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>ghr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>ghS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>ghu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>ghR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>ghb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>gd', ':tabnew %<CR>|:Gitsigns diffthis<CR>')
    map('n', '<leader>gtd', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
