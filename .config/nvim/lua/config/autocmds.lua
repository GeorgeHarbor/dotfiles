-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
      vim.g.clipboard = {
        copy = {
          ["+"] = "clip.exe",
          ["*"] = "clip.exe",
        },
        paste = {
          ["+"] = "powershell.exe -c Get-Clipboard",
          ["*"] = "powershell.exe -c Get-Clipboard",
        },
      }
    elseif vim.fn.has("unix") == 1 then
      if vim.fn.executable("xclip") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "xclip -selection clipboard",
            ["*"] = "xclip -selection clipboard",
          },
          paste = {
            ["+"] = "xclip -selection clipboard -o",
            ["*"] = "xclip -selection clipboard -o",
          },
        }
      elseif vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") then
        vim.g.clipboard = {
          copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy",
          },
          paste = {
            ["+"] = "wl-paste",
            ["*"] = "wl-paste",
          },
        }
      end
    end

    vim.opt.clipboard = "unnamedplus"
  end,
  desc = "Lazy load clipboard",
})
