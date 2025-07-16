require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("ts_ls", {
  capabilities = {
    textDocument = {
      formatting = false,
    },
  },
})

vim.lsp.config("eslint", {
  settings = {
    format = false,
    experimental = {
      useFlatConfig = true,
    },
  },
})

vim.lsp.config("jsonls", {
  init_options = {
    provideFormatter = false,
  },
})

local servers = { "html", "cssls", "jsonls", "tailwindcss", "ts_ls", "eslint" }
vim.lsp.enable(servers)
