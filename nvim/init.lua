vim.g.mapleader = ' '       -- set leader to space
vim.g.maplocalleader = "\\" -- set map local leader
vim.o.relativenumber = true -- show relative line numbers on the left
vim.o.tabstop = 4           -- set tab width to 4 spaces
vim.o.shiftwidth = 4        -- set shift width to 4 spaces
vim.o.swapfile = false      -- do not create swap files
vim.o.backup = false        -- do not create backup files
vim.o.hlsearch = false      -- disable highlighting all matches when searching with /
vim.o.incsearch = true      -- highlight matches when searching with /
vim.o.scrolloff = 16        -- keep at least 16 lines above and below cursor when scrolling
vim.o.wrap = false          -- do not wrap lines
vim.o.winborder = 'single'  -- use single borders for windows
vim.o.clipboard = "unnamedplus"

-- non plugin keymaps
vim.keymap.set('n', '<leader>fe', ":Oil<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "vague2k/vague.nvim" },
		{ "m4xshen/autoclose.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "echasnovski/mini.nvim" },
		{
			"nvim-treesitter/nvim-treesitter",
			branch = 'master',
			lazy = false,
		},
		{
			'stevearc/oil.nvim',
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {},
			-- Optional dependencies
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
			-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
			-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
			lazy = false,
		},
		{
			'saghen/blink.cmp',
			-- optional: provides snippets for the snippet source
			dependencies = { 'rafamadriz/friendly-snippets' },

			-- use a release tag to download pre-built binaries
			version = '1.*',
			-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
			-- build = 'cargo build --release',
			-- If you use nix, you can build from source using latest nightly rust with:
			-- build = 'nix run .#build-plugin',

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
				-- 'super-tab' for mappings similar to vscode (tab to accept)
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- All presets have the following mappings:
				-- C-space: Open menu or open docs if already open
				-- C-n/C-p or Up/Down: Select next/previous item
				-- C-e: Hide menu
				-- C-k: Toggle signature help (if signature.enabled = true)
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				keymap = { preset = 'default' },

				appearance = {
					-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
					-- Adjusts spacing to ensure icons are aligned
					nerd_font_variant = 'mono'
				},

				signature = {
					enabled = true
				},

				-- (Default) Only show the documentation popup when manually triggered
				completion = { documentation = { auto_show = false } },

				-- Default list of enabled providers defined so that you can extend it
				-- elsewhere in your config, without redefining it, due to `opts_extend`
				sources = {
					default = { 'lsp', 'path', 'snippets', 'buffer' },
				},

				-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
				-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
				-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
				--
				-- See the fuzzy documentation for more information
				fuzzy = { implementation = "prefer_rust_with_warning" }
			},
			opts_extend = { "sources.default" }
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "vague" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})



-- setup colorscheme
local vague = require("vague")
vague.setup({
	transparent = true,

})
vim.cmd("colorscheme vague")

-- mini pick
local mini_pick = require("mini.pick")
mini_pick.setup()
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep live<CR>')

-- mini status line
require('mini.statusline').setup()

-- oil nvim
require("oil").setup()

-- setup LSPs
-- Lua
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config['lua_ls'] = require("lsp.configs.lua")
vim.lsp.enable("lua_ls")

-- tailwindcss
vim.lsp.enable("tailwindcss")

-- templ
vim.lsp.enable("templ")

-- Go
vim.lsp.config['gopls'] = {
	capabilities = capabilities
}
vim.lsp.enable("gopls")

local ts = require("nvim-treesitter.configs")
ts.setup({
	ensure_installed = { "c", "lua", "go", "javascript" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,


	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

-- gofmt
require("gofmt")

-- setup autoclose
local autoclose = require("autoclose")
autoclose.setup()
