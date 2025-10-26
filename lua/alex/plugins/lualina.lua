-- status line like vim-airline

-- Show attached linter
local linter_name = function()
    -- local linters = require("lint").get_running()
    local filetype = vim.bo.filetype
    local linters = require("lint").linters_by_ft[filetype]
    if #linters == 0 then
        return "󰦕"
    end
    return "󱉶 " .. table.concat(linters, ",")
end

-- Display attached LSP client
local function lsp_client_name()
    -- local bufnr = vim.api.nvim_get_current_buf()

    -- local clients = vim.lsp.buf_get_clients(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then
        return "n/a"
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
        -- table.insert(c, string.sub(client.name, 0, 8) .. "...")
    end
    -- return "\u{f085} " .. table.concat(c, ",")
    return "\u{f286} " .. table.concat(c, ",")
end

-- hide content on narrow windows
local function hide_in_width()
    return vim.fn.winwidth(0) > 80
end

local function clock()
    local time = tostring(os.date()):sub(12, 16)
    return time
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },

    opts = {
        options = {
            globalstatus = false, -- true == single statusline
            icons_enabled = true,
            theme = "ayu",
            component_separators = "⋮",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(res)
                        return res:sub(1, 1)
                    end,
                },
            },
            lualine_c = {
                {
                    "buffers",
                    show_filename_only = true,
                },
            },
            lualine_x = {
                -- specify full list of elements when adding custom things
                { "encoding",      cond = hide_in_width },
                { "fileformat",    cond = hide_in_width },
                { "filetype" },
                -- custom shit
                -- { "aerial" },
                { lsp_client_name, cond = hide_in_width },
                { linter_name,     cond = hide_in_width },
                --{ clock, cond = hide_in_width },
                function()
                    local ok, pomo = pcall(require, "pomo")
                    if not ok then
                        return ""
                    end

                    local timer = pomo.get_first_to_finish()
                    if timer == nil then
                        return ""
                    end

                    return "󰄉 " .. tostring(timer)
                end,
            },
        },
    },
}
