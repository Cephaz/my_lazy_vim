return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "b0o/schemastore.nvim", lazy = true }, -- Charge seulement si nécessaire
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- 🔹 Configuration JSON Language Server (jsonls) avec chargement conditionnel de `schemastore`
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = (function()
              local status, schemastore = pcall(require, "schemastore")
              return status and schemastore.json.schemas() or {} -- Utilise `schemastore` si dispo
            end)(),
            validate = { enable = true },
          },
        },
      })
    end,
  },
}
