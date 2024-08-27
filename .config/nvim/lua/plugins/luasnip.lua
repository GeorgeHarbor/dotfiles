return {
  "L3MON4D3/LuaSnip",
  config = function()
    local luasnip = require "luasnip"
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "react-ts", "typescript", "html" })
    luasnip.filetype_extend("javascriptreact", { "react", "typescript", "html" })
    luasnip.filetype_extend("javascript", { "react"})
    luasnip.filetype_extend("javascript", { "javascriptreact" })
    luasnip.filetype_extend("typescript", { "typescriptreact" })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
