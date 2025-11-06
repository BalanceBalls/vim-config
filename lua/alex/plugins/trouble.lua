return {
	"folke/trouble.nvim",
	lazy = false,
	opts = {
		open_no_results = true,
		auto_close = true,
		indent_guides = false,
		preview = {
			type = "main",
			scratch = false,
		},
	},
	keys = {
		{
			"<leader>q",
			"<cmd>Trouble diagnostics toggle filter.buf=0 focus=false<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>z",
			"<cmd>Trouble lsp_document_symbols toggle filter.buf=0 focus=false win.position=bottom<cr>",
			desc = "Symbols (Trouble)",
		},
	},
}
