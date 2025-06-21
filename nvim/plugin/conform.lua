require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },

	-- javascript
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    jsx = { "prettierd", "prettier", stop_after_first = true },

	-- typescript
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    tsx = { "prettierd", "prettier", stop_after_first = true },

	--html
	html = {"prettier"}
  },
})
