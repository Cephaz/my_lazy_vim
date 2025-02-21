return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "b0o/schemastore.nvim", lazy = true }, -- Charge seulement si nécessaire
      { "vuejs/language-tools", lazy = true }, -- Vue LSP
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- 🔹 Configuration Pyright avec Poetry
      local venv_path = vim.fn.trim(vim.fn.system("poetry env info --path"))
      local python_path = venv_path .. "/bin/python"

      if venv_path ~= "" then
        lspconfig.pyright.setup({
          settings = {
            python = {
              pythonPath = python_path,
            },
          },
        })
      end

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

      -- Vue Language Server (Volar)
      lspconfig.volar.setup({
        filetypes = { "vue" },
      })

      -- TypeScript/JavaScript LSP (pour une meilleure prise en charge de `import`)
      lspconfig.tsserver.setup({})
    end,
  },
}
