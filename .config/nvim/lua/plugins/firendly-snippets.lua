return {
  -- other plugins
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()  -- Automatically load the snippets
    end
  },
}
