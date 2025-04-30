return {
  -- Mason : installation des outils nécessaires
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "pyright", -- LSP
        "black", -- Formatter
        "isort", -- Import sorter
        "flake8", -- Linter
      })
    end,
  },

  -- LSPConfig pour Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
              },
            },
          },
        },
      },
    },
  },

  -- Formatter avec conform.nvim (black + isort)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
      },
    },
  },

  -- Linter avec nvim-lint (flake8)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
      },
    },
  },

  -- Sélecteur de venvs compatible Poetry
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { ",v", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
    },
    opts = {
      notify_user_on_activate = true,
      auto_refresh = true,
      settings = {
        poetry_path = vim.fn.expand("~/Library/Caches/pypoetry/virtualenvs"),
      },
      telescope = {
        theme = "ivy",
      },
    },
    config = function(_, opts)
      local venv_selector = require("venv-selector")
      venv_selector.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          vim.schedule(function()
            local cwd = vim.fn.getcwd()
            local cache_file = vim.fn.stdpath("data") .. "/venv-selector.json"

            local ok, lines = pcall(vim.fn.readfile, cache_file)
            if not ok or not lines then
              return
            end

            local cache = vim.fn.json_decode(table.concat(lines, "\n"))
            local cached_venv = cache and cache[cwd]
            if cached_venv then
              venv_selector.activate_venv(cached_venv)
            end
          end)
        end,
      })
    end,
  },
}
