local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fe', function() vim.cmd('Oil') end)
vim.keymap.set('n', '<C-q>', function() vim.cmd('wq') end)
vim.keymap.set('n', '<C-s>', function() vim.cmd('w') end)
vim.keymap.set('v', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>v', '"*p')





