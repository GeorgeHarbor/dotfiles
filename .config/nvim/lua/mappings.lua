require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd> LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gs", "<cmd> spotify_player<CR>", { desc = "Spotiy Player" })

-- TMUX NAVIGATOR
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- ChatGpt

map("n", "<leader>`", "<cmd> GpChatToggle popup<CR>", { desc = "Toggle ChatGPT Prompt" })
map("n", "<leader>r", "<cmd> Oil<CR>", { desc = "Toggle oil" })
-- map("v", "<leader>ce", "<cmd> ChatGPTEditWithInstructions<CR>", { desc = "Edit with ChatGPT Prompt" })

map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "Toggle NvimTree" })

