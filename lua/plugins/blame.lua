return {
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
    opts = {
      enabled = true,
      date_format = "%d/%m/%Y",
      virtual_text_column = 80,
    },
  },
}
