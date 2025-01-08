if true then
  return {}
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = opts.sources or {}
    vim.list_extend(opts.sources, {
      null_ls.builtins.formatting.prettier.with({
        extra_args = { "--tab-width", "4" },
      }),
    })
  end,
}
-- return {
--   "stevearc/conform.nvim",
--   dependencies = { "mason.nvim" },
--   lazy = true,
--   opts = {
--     formatters_by_ft = {
--       json = { "jq" },
--       jsonc = { "jq" },
--     },
--     formatters = {
--       -- jq = {
--       --   prepend_args = { "--indent", "4" },
--       -- },
--     },
--   },
-- }
-- if true then
--   return {}
-- end
--
-- return {
--   {
--     "Pocco81/auto-save.nvim",
--   },
-- }
