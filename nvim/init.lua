vim.g.mapleader = ' '           -- set leader to space
vim.g.maplocalleader = "\\"     -- set map local leader
vim.o.relativenumber = true     -- show relative line numbers on the left
vim.o.tabstop = 4               -- set tab width to 4 spaces
vim.o.shiftwidth = 4            -- set shift width to 4 spaces
vim.o.swapfile = false          -- do not create swap files
vim.o.backup = false            -- do not create backup files
vim.o.hlsearch = false          -- disable highlighting all matches when searching with /
vim.o.incsearch = true          -- highlight matches when searching with /
vim.o.scrolloff = 16            -- keep at least 16 lines above and below cursor when scrolling
vim.o.wrap = false              -- do not wrap lines
vim.o.winborder = 'single'      -- use single borders for windows
vim.o.clipboard = "unnamedplus" -- use system clipboard when yanking and pasting
vim.o.signcolumn = 'yes:1'

-- plugins
require("config.lazy")
vim.cmd("colorscheme vague")

-- non plugin keymaps
vim.keymap.set('n', '<leader>fe', ":Oil<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- lua execution
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

-- mini pick
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep live<CR>')

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

-- gofmt
require("gofmt")
