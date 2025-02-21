return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      -- Configuration des sources de null-ls
      null_ls.setup({
        sources = {
          -- Linter avec flake8 (utilisera les règles du .flake8 et pyproject.toml automatiquement)
          null_ls.builtins.diagnostics.flake8,

          -- Formatter avec black (prend également en compte pyproject.toml)
          null_ls.builtins.formatting.black,

          -- Formatter avec isort (pour trier les imports selon isort)
          null_ls.builtins.formatting.isort,
        },
      })

      -- Auto-format et lint lors de l'enregistrement du fichier
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py", -- Appliquer seulement aux fichiers Python
        callback = function()
          -- Effectuer le formatage avant de sauvegarder
          -- Utilise vim.lsp.buf.format() qui est plus fiable dans ce contexte
          local success, err = pcall(function()
            vim.lsp.buf.format({
              async = true,
              filter = function(client)
                return client.name == "null-ls" -- Assurer qu'on utilise seulement null-ls pour formater
              end,
            })
          end)

          if not success then
            print("Erreur de formatage : " .. err)
          end
        end,
      })
    end,
  },
}
