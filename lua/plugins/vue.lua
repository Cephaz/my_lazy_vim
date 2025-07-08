return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hoffs/omnisharp-extended-lsp.nvim" },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        on_new_config = function(config, new_root_dir)
          config.settings.workspaceFolder = {
            uri = vim.uri_from_fname(new_root_dir),
            name = vim.fn.fnamemodify(new_root_dir, ":t"),
          }
        end,
      })

      lspconfig.omnisharp.setup({
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        cmd = { "dotnet", "C:/Users/sfree/AppData/Local/nvim-data/omnisharp/OmniSharp.dll" },
        capabilities = capabilities,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            DocumentAnalysisTimeoutMs = 30000,
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
          },
          Sdk = {
            IncludePrereleases = true,
          },
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      local mason_registry = require("mason-registry")
      local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
        .. "/node_modules/@vue/language-server"

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server,
              languages = { "vue" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      lspconfig.html.setup({
        filetypes = { "html", "ejs" },
        capabilities = capabilities,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.lemminx.setup({
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local omnisharp = require("omnisharp_extended")

          local function telescope_builtin(builtin, opts)
            local params = vim.tbl_deep_extend("force", {
              layout_strategy = "horizontal",
              layout_config = {
                prompt_position = "top",
              },
              sorting_strategy = "ascending",
              winblend = 0,
            }, opts or {})

            return function()
              require("telescope.builtin")[builtin](params)
            end
          end

          vim.keymap.set("n", "gd", telescope_builtin("lsp_definitions"), { desc = "Telescope Go to Definition" })
          vim.keymap.set(
            "n",
            "gi",
            telescope_builtin("lsp_implementations"),
            { desc = "Telescope Go to Implementation" }
          )
          vim.keymap.set("n", "gr", telescope_builtin("lsp_references"), { desc = "Telescope Go to References" })

          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = ev.buf })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Display errors" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Display symbol info", buffer = ev.buf })
        end,
      })
    end,
  },
}
