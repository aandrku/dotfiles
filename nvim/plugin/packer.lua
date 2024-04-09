require('packer').startup(function(use)
	--package manager
	use('wbthomason/packer.nvim')

	--telescope	
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = { {'nvim-lua/plenary.nvim'} } }

	--colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	--treesitter
	use {
	     'nvim-treesitter/nvim-treesitter',
	     run = function()
	         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	         ts_update()
	     end,
	}

	--lsp
	use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/mason.nvim' }

	--harpoon
	use { 'ThePrimeagen/harpoon' }

	--completion
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'saadparwaiz1/cmp_luasnip' }

	--autoclose brackets
	use 'm4xshen/autoclose.nvim'


	--comments 
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
end)
