-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.cssls.setup {
  settings = {
    css = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    scss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    less = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
  },
}

-- lspconfig.ruff.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

lspconfig.pyright.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  settings = {
    configurationSources = { "flake8" },
    formatCommand = { "black" },
    pylsp = {
      plugins = {
        -- jedi_completion = {fuzzy = true},
        -- jedi_completion = {eager=true},
        jedi_completion = {
          include_params = true,
        },
        jedi_signature_help = { enabled = true },
        jedi = {
          -- extra_paths = { "~/projects/work_odoo/odoo14", "~/projects/work_odoo/odoo14" },
          -- environment = {"odoo"},
        },
        pyflakes = { enabled = true },
        -- pylint = {args = {'--ignore=E501,E231', '-'}, enabled=true, debounce=200},
        pylsp_mypy = { enabled = false },
        pycodestyle = {
          enabled = true,
          ignore = { "E501", "E231" },
          maxLineLength = 120,
        },
        yapf = { enabled = true },
      },
    },
  },
}

lspconfig.omnisharp.setup {
  cmd = { "/bin/omnisharp" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.tailwindcss.setup {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "package.json"),
  settings = {},
}

lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}
