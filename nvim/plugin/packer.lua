require('packer').startup(function(use)
	--package manager
	use('wbthomason/packer.nvim')

	--telescope	
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }

	-- colorscheme
	use 'AlexvZyl/nordic.nvim'


	--treesitter
	use {
	     'nvim-treesitter/nvim-treesitter',
	     run = function()
	         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	         ts_update()
	     end,
	}

	use {
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	}

	--LaTeX
	use {'lervag/vimtex'}

	--noice
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})


	--lsp
	use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/mason.nvim' }

	-- smear cursor
	use { 'sphamba/smear-cursor.nvim' }

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


	use {'ThePrimeagen/vim-be-good'}



	use {'windwp/nvim-ts-autotag'}

	use {'subnut/nvim-ghost.nvim'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

end)
