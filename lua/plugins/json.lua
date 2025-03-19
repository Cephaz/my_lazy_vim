return {
  "neovim/nvim-lspconfig",
  dependencies = { "b0o/schemastore.nvim" }, -- Dépendance, mais ne bloque pas si absente
  opts = function(_, opts)
    -- Essaye de charger schemastore, mais ne plante pas si indisponible
    local ok, schemastore = pcall(require, "schemastore")

    opts.servers = opts.servers or {}
    opts.servers.jsonls = {
      settings = {
        json = {
          schemas = ok and schemastore.json.schemas() or {}, -- Charge les schémas si dispo
          validate = { enable = ok }, -- Active la validation seulement si `schemastore` est dispo
        },
      },
    }
  end,
}
