require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    go = { "goimports", "gofmt" },
  },
  format_on_save = {
    lsp_fallback = true,
  },
})
