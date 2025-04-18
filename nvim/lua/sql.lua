vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "afiedt.buf",  -- Replace with your specific file
    callback = function()
        vim.bo.filetype = "sql"  -- Set the desired filetype
    end,
})
