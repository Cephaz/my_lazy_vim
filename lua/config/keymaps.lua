-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Raccourci pour changer l'indentation à 2 espaces
map("n", "<leader>i2", function()
  vim.bo.shiftwidth = 2
  vim.bo.tabstop = 2
  vim.bo.expandtab = true
  print("Indentation: 2 espaces")
end, { desc = "Set indentation to 2 spaces" })

-- Raccourci pour changer l'indentation à 4 espaces
map("n", "<leader>i4", function()
  vim.bo.shiftwidth = 4
  vim.bo.tabstop = 4
  vim.bo.expandtab = true
  print("Indentation: 4 espaces")
end, { desc = "Set indentation to 4 spaces" })

-- Raccourci pour create PR
vim.keymap.set("n", "<leader>gp", function()
  vim.cmd("!gh pr create --fill --web")
end, { desc = "GitHub: Create PR", silent = true })
