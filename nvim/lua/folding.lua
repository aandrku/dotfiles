-- Enable automatic saving and loading of views (including folds)

vim.api.nvim_set_hl(0, 'CustomFolded', {
  fg = '#FFA500',    -- Foreground (text) color: Orange
  bg = '#2E3440',    -- Background color: Dark Blue-Gray
  italic = true,     -- Text style: Italic
})

-- Link CustomFolded to the Folded highlight group
vim.api.nvim_set_hl(0, 'Folded', { link = 'CustomFolded' })

-- Define where to store view files
vim.o.viewdir = vim.fn.stdpath('config') .. '/view'
vim.o.foldmethod = 'manual'


-- Ensure the view directory exists
local view_dir = vim.fn.stdpath('config') .. '/view'
if vim.fn.isdirectory(view_dir) == 0 then
  vim.fn.mkdir(view_dir, "p")
end

-- Set view options to include folds, cursor position, and more
vim.o.viewoptions = 'folds,cursor,curdir,slash,unix'

-- Create an augroup for auto folding
vim.api.nvim_create_augroup('AutoFold', { clear = true })

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	group = 'AutoFold',
	pattern = '*.notes',
	callback = function()

		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.softtabstop = 2


		-- Ensure syntax highlighting is enabled
		vim.opt.fillchars = { fold = ' ' }
		vim.opt_local.foldtext = 'v:lua.custom_foldtext()'
		vim.api.nvim_set_hl(0, 'Folded', {
			fg = '#346eeb',
			-- bg = '#1E1E1E',
			bold = true,
			italic = true,  -- optional text style
		})
	end,
})

-- Automatically save the view when leaving a buffer
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = 'AutoFold',
  pattern = '*.notes',
  command = 'mkview',
})

-- Automatically load the view when entering a buffer
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = 'AutoFold',
  pattern = '*.notes',
  command = 'silent! loadview',
})


_G.custom_foldtext = function()
  local line = vim.fn.getline(vim.v.foldstart)
  return  '>' .. line
end
