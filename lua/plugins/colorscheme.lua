return {
  "sainnhe/gruvbox-material",
  priority = 1000, -- S'assure que le thème est chargé en premier
  config = function()
    -- Options spécifiques à Gruvbox Material
    vim.g.gruvbox_material_background = "hard" -- Options: 'soft', 'medium', 'hard'
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_transparent_background = 0 -- Mettre à 1 pour un fond transparent

    -- Appliquer le thème
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
