return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Lua
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.lsp.config['lua_ls'] = require("lsp.configs.lua")
    vim.lsp.enable("lua_ls")


    -- tailwindcss
    vim.lsp.enable("tailwindcss")

    -- templ
    vim.lsp.enable("templ")

    -- rust
    vim.lsp.config['rust-analyzer'] = {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false,
            checkOnSave = {
              command = "clippy",
            }
          }
        }
      }
    }
    vim.lsp.enable("rust-analyzer")

    -- Go
    vim.lsp.config['gopls'] = {
      capabilities = capabilities
    }
    vim.lsp.enable("gopls")
  end
}
