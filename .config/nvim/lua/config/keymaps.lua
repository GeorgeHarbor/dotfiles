-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- replaces vim.lsp.buf.definition()

vim.keymap.set("n", "q:", "<nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<S-d>", "<cmd>DBUIToggle<CR>", { noremap = true, silent = true })
