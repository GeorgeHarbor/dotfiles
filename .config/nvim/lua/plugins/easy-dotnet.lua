return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  ft = { "cs", "csx", "csproj", "sln" },
  config = function()
    require("easy-dotnet").setup()
  end,
}
