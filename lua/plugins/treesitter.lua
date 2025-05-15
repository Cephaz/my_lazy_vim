return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "typescript",
      "javascript",
      "vue",
      "json",
      "css",
      "html",
      "scss",
    }

    opts.highlight = {
      enable = true,
    }
  end,
}
