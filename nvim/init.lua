vim.g.mapleader = ' '       -- set leader to space
vim.o.relativenumber = true -- show relative line numbers on the left
vim.o.tabstop = 4           -- set tab width to 4 spaces
vim.o.swapfile = false      -- do not create swap files
vim.o.backup = false        -- do not create backup files
vim.o.hlsearch = false      -- disable highlighting all matches when searching with /
vim.o.incsearch = true      -- highlight matches when searching with /
vim.o.scrolloff = 16        -- keep at least 16 lines above and below cursor when scrolling
vim.o.wrap = false          -- do not wrap lines
vim.o.winborder = 'single'  -- use single borders for windows


-- telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fF', telescope_builtin.git_files, {})


vim.keymap.set('n', '<leader>fe', function() vim.cmd('Ex') end)

-- easier copy and paste 
vim.keymap.set('v', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>v', '"*p')

-- open diagnostic floating window, useful when it overflows the screen
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

require('gofmt')
require('conform-format')
