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

-- lua execution
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

-- plugins
require("config.lazy")

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
