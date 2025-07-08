return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function(_, opts)
    opts.ensure_installed = {
      -- Frontend
      "typescript",
      "javascript",
      "vue",
      "html",
      "css",
      "scss",
      "json",
      "jsonc",

      -- Backend & DevOps
      "python",
      "bash",
      "lua",
      "dockerfile",
      "make",
      "terraform",
      "hcl", -- pour les modules .hcl (Terraform v0.11 ou modules externes)

      -- Docs / config
      "markdown",
      "markdown_inline",
      "toml",
      "yaml",

      -- Autres utilitaires (optionnels mais utiles)
      "query", -- pour éditer des requêtes TS
    }

    opts.highlight = {
      enable = true,
    }
  end,
}
