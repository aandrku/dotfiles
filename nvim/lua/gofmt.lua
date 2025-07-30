-- Define an autocommand group to prevent duplicate autocmds
local group = vim.api.nvim_create_augroup('SpecialFileCommands', { clear = true })

-- Create the autocommand
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    pattern = '*.go',  -- Apply to Go files
    callback = function()
        -- Get the current file path
        local filepath = vim.fn.expand('%:p')

        -- Execute 'go fmt' on the current file
        vim.fn.system('go fmt ' .. filepath)

        -- Execute 'go vet' on the current file
        local vet_output = vim.fn.system('go vet ' .. filepath)
        if vim.v.shell_error ~= 0 then
            vim.notify('go vet found issues:\n' .. vet_output, vim.log.levels.WARN)
        end

        -- Reload the file to apply any changes made by 'go fmt'
        vim.cmd('edit')
    end,
})

local templ_format = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
        on_exit = function()
            -- Reload the buffer only if it's still the current buffer
            if vim.api.nvim_get_current_buf() == bufnr then
                vim.cmd('e!')
            end
        end,
    })
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })

