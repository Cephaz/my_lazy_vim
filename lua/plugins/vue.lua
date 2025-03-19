return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      volar = {
        filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
        init_options = {
          vue = {
            hybridMode = false, -- Désactiver Hybrid Mode pour que Volar prenne en charge TS
          },
          typescript = {
            tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript/lib",
          },
        },
      },
    },
  },
}
