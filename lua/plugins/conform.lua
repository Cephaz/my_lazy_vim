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
      json = { "jq" }, -- Utiliser `jq` pour JSON au lieu de Prettier
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      lua = { "stylua" },
    },

    -- ✅ Configurer le formateur jq
    formatters = {
      jq = {
        command = "jq",
        args = function()
          return { "--indent", vim.bo.shiftwidth } -- Utilise l'indentation actuelle
        end,
      },
    },
  },
}
