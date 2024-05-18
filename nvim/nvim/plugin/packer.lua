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

	use{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				float = {
					-- Padding around the floating window
					padding = 2,
					max_width = 60,
					max_height = 40,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					-- This is the config that will be passed to nvim_open_win.
					-- Change values here to customize the layout
					override = function(conf)
						return conf
					end,
				},
				keymaps = {
					["q"] = "actions.close"
				}
			})
		end,
	}

	use {'ThePrimeagen/vim-be-good'}

	use {'shaunsingh/moonlight.nvim'}

	use {'windwp/nvim-ts-autotag'}

	use {
		'scottmckendry/cyberdream.nvim',
		config = function()
			require('cyberdream').setup({
				-- Recommended - see "Configuring" below for more config options
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
			})
			vim.cmd('colorscheme cyberdream') -- set the colorscheme
		end
	}

	use {'subnut/nvim-ghost.nvim'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

end)
