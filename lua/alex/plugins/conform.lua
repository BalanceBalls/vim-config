require("conform").setup({
	notify_on_error = true,
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
		cs = { "csharpier" }
  },
})
