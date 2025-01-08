return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      auto_refresh = true,
      notify_user_on_venv_activation = true,
      changed_venv_hooks = {
        function(venv_path, venv_python)
          -- Réactive le venv dans tous les terminaux ouverts
          for _, term in ipairs(require("toggleterm.terminal").get_all()) do
            if vim.fn.has("win32") == 1 then
              term:send(venv_path .. "\\Scripts\\activate")
            else
              term:send("source " .. venv_path .. "/bin/activate")
            end
          end
        end,
      },
    },
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
    },
  },
}
