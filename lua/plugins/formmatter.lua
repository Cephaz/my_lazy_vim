-- if true then
--   return {}
-- end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "jq" },
      },
      formatters = {
        jq = {
          args = { "--indent", "4" },
        },
      },
    },
  },
}
