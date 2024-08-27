vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require("configs.cmpconfig")

local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- Add a rule to always close angle brackets in C# files
npairs.add_rules({
  Rule("<", ">")
    :with_pair(function()
      local filetype = vim.bo.filetype
      return filetype == "cs"  -- Only apply in C# files
    end)
})
vim.cmd [[
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
]]


-- local ls = require('luasnip')
--
-- ls.snippets = {
--   typescript = ls.snippets.typescriptreact,
--   javascript = ls.snippets.javascriptreact,
-- }
