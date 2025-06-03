return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup({
      default_mappings = true, -- active les mappings par défaut
      disable_diagnostics = true, -- évite les messages d'erreur pendant le conflit
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    })
  end,
}
