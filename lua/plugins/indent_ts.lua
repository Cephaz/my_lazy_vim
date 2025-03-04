local M = {}

local function setup_indent()
  -- Vérifie si un fichier .prettierrc existe dans le projet
  local prettierrc = vim.fn.findfile(".prettierrc", ";.")
  if prettierrc ~= "" then
    -- Lire le fichier .prettierrc
    local file = io.open(prettierrc, "r")
    if file then
      local content = file:read("*a")
      file:close()

      -- Extraire les paramètres de Prettier
      local tab_width = tonumber(content:match('"tabWidth":%s*(%d+)')) or 2
      local use_tabs = content:match('"useTabs":%s*true') ~= nil

      -- Configurer Neovim pour correspondre à Prettier
      vim.opt_local.tabstop = tab_width
      vim.opt_local.shiftwidth = tab_width
      vim.opt_local.softtabstop = tab_width
      vim.opt_local.expandtab = not use_tabs -- Si useTabs est true, expandtab est false
    end
  end
end

-- Appliquer cette configuration lors de l'ouverture d'un fichier
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "vue" }, -- Appliquer uniquement à ces types de fichiers
  callback = setup_indent,
})

return M
