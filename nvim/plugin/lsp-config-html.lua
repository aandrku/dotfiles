local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.filetype.add({
  extension = {
    tmpl = "html",
  },
})

require'lspconfig'.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ", "tmpl" },
})
