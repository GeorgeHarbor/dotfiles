return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      enabled = true, -- turn on the file‑explorer module
      replace_netrw = true, -- up to you
    },
    picker = {
      enabled = true, -- make sure pickers are on
      sources = {
        explorer = {
          -- 1) bind the <A> key in the list window to your “easy” action
          win = {
            list = {
              keys = {
                ["A"] = "easy",
              },
            },
          },

          -- 2) define the “easy” action
          actions = {
            easy = {
              action = function(_, item)
                local dir = item.type == "directory" and item.file or vim.fs.dirname(item.file)

                require("easy-dotnet").create_new_item(dir, function(new_file)
                  -- 1) refresh the explorer
                  Snacks.explorer.open()
                  -- 2) open the newly created file
                  vim.cmd("edit " .. vim.fn.fnameescape(new_file))
                end)
              end,
            },
          },
        },
      },
    },
  },
}
