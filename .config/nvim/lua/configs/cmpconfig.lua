local cmp = require("cmp")
local default_config = cmp.get_config()

cmp.setup(vim.tbl_deep_extend("force", default_config, {
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "buffer" },
    { name = "path" },
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  filetype = { "typescript", "typescriptreact" } -- Ensure these filetypes are included
}))
