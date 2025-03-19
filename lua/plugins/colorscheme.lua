return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- S'assurer que le thème est chargé en priorité
    config = function()
      require("kanagawa").setup({
        compile = false, -- Activer la compilation du thème pour de meilleures performances
        undercurl = true, -- Activer les soulignements en courbe
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- Ne pas rendre le fond transparent
        dimInactive = false, -- Ne pas assombrir les fenêtres inactives
        terminalColors = true, -- Appliquer les couleurs du thème au terminal intégré
        colors = { -- Personnalisation des couleurs (laisser vide si pas besoin)
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- Personnalisation des highlights (laisser vide si pas besoin)
          return {}
        end,
        theme = "dragon", -- Charger la version "Dragon" du thème
        background = {
          dark = "dragon",
          light = "lotus",
        },
      })
      vim.cmd("colorscheme kanagawa-dragon") -- Appliquer le thème après la configuration
    end,
  },
}
