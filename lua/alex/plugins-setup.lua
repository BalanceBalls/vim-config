-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  
  -- Install themes
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "sainnhe/gruvbox-material", as = "gruvbox" }
	use { "navarasu/onedark.nvim" }
	use { "cpwrs/americano.nvim" }  
	use { 'shaunsingh/nord.nvim' }
	use {
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end
	}

	use { "Shatur/neovim-ayu", as = "ayu" }

	use { 
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
		config = function()
			require("easy-dotnet").setup()
		end
	}

	use {'stevearc/dressing.nvim'}

  -- Async plugin (dependency for other plugins)
  use("nvim-lua/plenary.nvim")

  -- Bottom bar
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

  -- File explorer
  use("nvim-tree/nvim-tree.lua")
  
  -- Syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Fuzzy search
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope.nvim")

  -- Toggle terminal
  use ({"akinsho/toggleterm.nvim", tag = '*'})

	use({
		"nvim-neotest/neotest",
		requires = {
			{
				"Issafalcon/neotest-dotnet",
				"nvim-neotest/nvim-nio"
			},
		}
	})

  -- Comments
  use {
      "numToStr/Comment.nvim",
      config = function()
          require('Comment').setup()
      end
  }

  -- Harpoon
  use {"ThePrimeagen/harpoon", branch = "harpoon2" }

  -- Git
	use ("lewis6991/gitsigns.nvim")
  
	-- Visible identation
	use {
		"lukas-reineke/indent-blankline.nvim", 
		config = function()
			require("ibl").setup{
				indent = { highlight = highlight },
				whitespace = {
					highlight = highlight
    		},
			}
		end
	}

  -- Autoclose
  use("windwp/nvim-autopairs")

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
	use { "Hoffs/omnisharp-extended-lsp.nvim" }

	-- LLM
	use("David-Kunz/gen.nvim")


	-- Tools
	use("folke/trouble.nvim")
	use("stevearc/conform.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
