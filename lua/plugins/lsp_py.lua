return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "b0o/schemastore.nvim", lazy = true }, -- Charge seulement si nécessaire
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
    end,
  },
}
