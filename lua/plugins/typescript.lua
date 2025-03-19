return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
  },
  opts = {
    servers = {
      tsserver = {
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
        settings = {
          completions = { completeFunctionCalls = true },
        },
      },
    },
  },
}
