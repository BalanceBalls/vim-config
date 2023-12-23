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

  -- Comments
  use {
      "numToStr/Comment.nvim",
      config = function()
          require('Comment').setup()
      end
  }

  -- Harpoon
  use {'ThePrimeagen/harpoon'}

  -- Git
  use("lewis6991/gitsigns.nvim")
  
  -- GoLang tools
  use("olexsmir/gopher.nvim")

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

	-- LLM
	use("nomnivore/ollama.nvim")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
