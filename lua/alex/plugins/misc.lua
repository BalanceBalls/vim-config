return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = { highlight = highlight },
				whitespace = {
					highlight = highlight,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		enabled = true,
		config = function()
			local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
			if not cmp_autopairs_setup then
				return
			end

			-- import nvim-cmp plugin safely (completions plugin)
			local cmp_setup, cmp = pcall(require, "cmp")
			if not cmp_setup then
				return
			end

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- conform.nvim
			require("conform").setup({
				notify_on_error = true,
				format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
				formatters_by_ft = {
					go = { "gofmt", "golines" },
					lua = { "stylua" },
					javascript = { { "prettierd", "prettier" } },
					cs = { "csharpier" },
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 10,
				open_mapping = [[<C-\>]],
				start_in_insert = true,
				direction = "float",
				float_opts = {
					border = "curved",
					width = math.ceil(vim.o.columns * 0.8),
					height = math.ceil(vim.o.columns * 0.2),
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				global_settings = {
					save_on_toggle = false,
					save_on_change = true,
					enter_on_sendcmd = false,
					tmux_autoclose_windows = false,
					excluded_filetypes = { "harpoon" },
					mark_branch = true,
					tabline = false,
					tabline_prefix = "   ",
					tabline_suffix = "   ",
				},
			})
		end,
	},
}
