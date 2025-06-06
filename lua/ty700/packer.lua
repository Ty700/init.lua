-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'
	
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
	})

 	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  	use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!

  	use "mbbill/undotree" 
  
	use "tpope/vim-fugitive" 
 
  	use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
 	}

	use( 'neovim/nvim-lspconfig')	
	use( 'hrsh7th/cmp-nvim-lsp')
	use( 'hrsh7th/cmp-buffer')
	use( 'hrsh7th/cmp-path')
	use( 'hrsh7th/cmp-cmdline')
	use( 'hrsh7th/nvim-cmp')
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	}
end)
