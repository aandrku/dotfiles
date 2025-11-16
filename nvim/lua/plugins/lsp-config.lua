return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Lua
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.lsp.config['lua_ls'] = require("lsp.configs.lua")
    vim.lsp.enable("lua_ls")


    -- tailwindcss
    vim.lsp.enable("tailwindcss")

    vim.lsp.enable("pyright")
    vim.lsp.enable("ts_ls")

    -- templ
    vim.lsp.enable("templ")

    -- tinymist
    vim.lsp.config["tinymist"] = {
      cmd = { "tinymist" },
      filetypes = { "typst" },
      settings = { }
    }
    vim.lsp.enable("tinymist")

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

    vim.lsp.enable('jdtls')
    vim.lsp.config['jdtls'] = {

    }

    -- Go
    vim.lsp.config['gopls'] = {
      capabilities = capabilities
    }
    vim.lsp.enable("gopls")
  end
}
