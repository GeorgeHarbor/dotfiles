return {
  'stevearc/oil.nvim',
  opts = {},
  event = "VeryLazy",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup()
  end
}
