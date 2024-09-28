require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unset = vim.keymap.del
unset("n", "<leader>h")

map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd> LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gs", "<cmd> spotify_player<CR>", { desc = "Spotiy Player" })

-- TMUX NAVIGATOR
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })

map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP code action' })

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- ChatGpt

map("n", "<leader>`", "<cmd> GpChatToggle popup<CR>", { desc = "Toggle ChatGPT Prompt" })
map("n", "<leader>r", "<cmd> Oil<CR>", { desc = "Toggle oil" })
-- map("v", "<leader>ce", "<cmd> ChatGPTEditWithInstructions<CR>", { desc = "Edit with ChatGPT Prompt" })

map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "Toggle NvimTree" })

-- DAP mappings
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
map("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true, silent = true })
map("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { noremap = true, silent = true })
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })
map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true })

-- DAP UI
map("n", "<Leader>dui", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dh', '<cmd>lua require("dap.ui.widgets").hover()<CR>',
  { noremap = true, silent = true })

-- Replaces vim.lsp.buf.definition()
vim.api.nvim_set_keymap('n', 'dgd',
  '<cmd>lua if vim.bo.filetype == "cs" then require("omnisharp_extended").lsp_definition() end<CR>',
  { noremap = true, silent = true })

-- Replaces vim.lsp.buf.type_definition()
vim.api.nvim_set_keymap('n', 'dgD', '<cmd>lua require("omnisharp_extended").lsp_type_definition()<CR>',
  { noremap = true, silent = true })

-- Replaces vim.lsp.buf.references()
vim.api.nvim_set_keymap('n', 'dgr', '<cmd>lua require("omnisharp_extended").lsp_references()<CR>',
  { noremap = true, silent = true })

-- Replaces vim.lsp.buf.implementation()
vim.api.nvim_set_keymap('n', 'dgi', '<cmd>lua require("omnisharp_extended").lsp_implementation()<CR>',
  { noremap = true, silent = true })

-- HARPOON
map("n", "<leader>hi", "<cmd> Telescope harpoon marks<CR>", { desc = "Toggle Harpoon" })
map("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon Add File" })

