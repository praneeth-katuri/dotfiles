local options = {
  formatters_by_ft = {
    javascript = { "prettierd", "eslint_d" },
    typescript = { "prettierd", "eslint_d" },
    javascriptreact = { "prettierd", "eslint_d" },
    typescriptreact = { "prettierd", "eslint_d" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    markdown = { "prettierd" },
    lua = { "stylua" },
    sh = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = false,
  },
}

return options
