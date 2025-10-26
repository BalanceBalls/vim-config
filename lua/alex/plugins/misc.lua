-- autopairs.nvim

-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- configure autopairs
autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
})

-- import nvim-autopairs completion functionality safely
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
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
		cs = { "csharpier" }
  },
})

-- lualine
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- configure lualine with modified theme
lualine.setup({
  options = {
		theme = vim.g.colors_name
  },
})

-- neotest.nvim
require("neotest").setup({
  adapters = {
    require("neotest-dotnet")({
      dap = {
        args = {justMyCode = false },
        adapter_name = "netcoredbg"
      },
      dotnet_additional_args = {
        "--verbosity detailed"
      },
      discovery_root = "project" -- Default
    })
  }
})

-- toggleterm.nvim
require("toggleterm").setup{
  size = 10,
	open_mapping = [[<C-\>]],
	start_in_insert = true,
  direction = "float",
	float_opts = {
		border = "curved",
		width = math.ceil(vim.o.columns*0.8),
		height = math.ceil(vim.o.columns*0.2)
	}
}

-- harpoon
require('harpoon').setup({
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

    }
})
