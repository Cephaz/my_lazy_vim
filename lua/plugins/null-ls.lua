return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = {
      null_ls.builtins.formatting.black.with({
        extra_args = { "--config", "./pyproject.toml" }, -- Chemin vers le fichier de config
      }),
      null_ls.builtins.formatting.isort.with({
        extra_args = { "--settings-path", "./pyproject.toml" },
      }),
      null_ls.builtins.diagnostics.flake8.with({
        extra_args = { "--config", "./.flake8" },
      }),
    }
  end,
}
