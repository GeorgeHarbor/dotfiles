require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
local o = vim.o

o.termguicolors = true
o.relativenumber = true

vim.cmd.colorscheme "catppuccin-mocha"
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })

require("nvim-tree").setup {
  view = {
    side = "right",
  },
}

vim.o.conceallevel = 1
