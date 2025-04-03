return {
  -- Améliore le rendu visuel des titres, listes, citations, etc.
  {
    "lukas-reineke/headlines.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown", "norg", "org", "rmd" },
    config = function()
      require("headlines").setup()
    end,
  },

  -- Plugin pour prévisualiser les fichiers Markdown dans le navigateur
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
