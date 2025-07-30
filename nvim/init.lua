vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.backup = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 16
vim.g.netrw_longlist = 1
vim.g.netrw_liststyle = 1


local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files, {})

vim.keymap.set('n', '<leader>fe', function() vim.cmd('Ex') end)
vim.keymap.set('n', '<C-q>', function() vim.cmd('wq') end)
vim.keymap.set('n', '<C-s>', function() vim.cmd('w') end)
vim.keymap.set('v', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>v', '"*p')
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

require('gofmt')
require('conform-format')
