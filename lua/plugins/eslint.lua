return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
        settings = {
          format = false, -- ❌ Désactiver le formatage par ESLint
          run = "onSave", -- ✅ Lancer ESLint à chaque sauvegarde
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
          rulesCustomizations = {},
          validate = "on",
        },
      },
    },
  },
}
