return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Affichage du venv dans la section lualine_x
    local function python_venv()
      local venv = vim.g.VIRTUAL_ENV
      if venv then
        return "🐍 " .. vim.fn.fnamemodify(venv, ":t")
      else
        return ""
      end
    end

    -- Tu peux l'ajouter à la fin ou au début selon ton style
    table.insert(opts.sections.lualine_x, python_venv)
  end,
}
