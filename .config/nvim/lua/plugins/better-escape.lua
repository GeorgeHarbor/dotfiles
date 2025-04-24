return {
  -- lua, default settings
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      timeout = 300,
      default_mappings = false,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
        },
      },
    })
  end,
}
