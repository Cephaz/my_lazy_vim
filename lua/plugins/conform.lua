return {
  "stevearc/conform.nvim",
  opts = {
    -- ✅ Active le formatage automatique à la sauvegarde
    format_on_save = {
      timeout_ms = 500, -- Attendre que Prettier ait bien lu `.prettierrc`
      lsp_fallback = true,
    },

    -- ✅ Définir les formateurs par type de fichier
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      lua = { "stylua" }, -- Si tu veux garder `stylua` pour Lua, sinon retire cette ligne
    },
  },
}
