return {
  "wbthomason/packer.nvim",
  
  -- Install themes
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "sainnhe/gruvbox-material", as = "gruvbox" },
	{ "navarasu/onedark.nvim" },
	{ "cpwrs/americano.nvim" },  
	{ 'shaunsingh/nord.nvim' },
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end
	},

	{ "Shatur/neovim-ayu", as = "ayu" },

	{ 
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
		config = function()
			require("easy-dotnet").setup()
		end
	},

	{'stevearc/dressing.nvim'},

  -- Async plugin (dependency for other plugins)
  "nvim-lua/plenary.nvim",

  -- Bottom bar
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",

  -- File explorer
  "nvim-tree/nvim-tree.lua",
  
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Fuzzy search
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope.nvim",

  -- Toggle terminal
  {"akinsho/toggleterm.nvim"},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"Issafalcon/neotest-dotnet",
			"nvim-neotest/nvim-nio",
		}
	},

  -- Comments
  {
      "numToStr/Comment.nvim",
      config = function()
          require('Comment').setup()
      end
  },

  -- Harpoon
  {"ThePrimeagen/harpoon", branch = "harpoon2" },

  -- Git
	"lewis6991/gitsigns.nvim",
  
	-- Visible identation
	{
		"lukas-reineke/indent-blankline.nvim", 
		config = function()
			require("ibl").setup{
				indent = { highlight = highlight },
				whitespace = {
					highlight = highlight
    		},
			}
		end
	},

  -- Autoclose
  "windwp/nvim-autopairs",

  -- LSP
  {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  dependencies = {
		  -- LSP Support
		  'neovim/nvim-lspconfig',
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Autocompletion
		  'hrsh7th/nvim-cmp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'saadparwaiz1/cmp_luasnip',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-nvim-lua',

		  -- Snippets
		  'L3MON4D3/LuaSnip',
		  'rafamadriz/friendly-snippets',
	  }
  },
	{ "Hoffs/omnisharp-extended-lsp.nvim" },

	-- LLM
	"David-Kunz/gen.nvim",


	-- Tools
	"folke/trouble.nvim",
	"stevearc/conform.nvim",
}
