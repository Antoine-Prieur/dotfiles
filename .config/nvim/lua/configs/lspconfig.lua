-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "terraformls", "tflint", "jsonls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- python
lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    -- Call the common on_attach function
    on_attach(client, bufnr)

    -- Disable formatting if you want to use black
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
  filetypes = { "python" },
  before_init = function(_, config_arg)
    local pythonUtils = require "utils.python"
    local root_dir = config_arg.root_dir
    local pythonPath = pythonUtils.getPythonPath(root_dir)

    -- Set the Python interpreter path for Ruff
    config_arg.settings = config_arg.settings or {}
    config_arg.settings.python = config_arg.settings.python or {}
    config_arg.settings.python.pythonPath = pythonPath

    -- If you're still using mypy separately
  end,
  settings = {
    -- Ruff-specific settings
    ruff = {
      lint = {
        run = "onType", -- Run Ruff on the fly for maximum speed
        -- Enable specific rules for imports
      },
      organizeImports = true, -- Equivalent to running Ruff with the I001 rule enabled
      fixAll = true, -- Enables the "Fix all" action
    },
  },
  -- Tell Ruff to use the pyproject.toml file in the project
  init_options = {
    settings = {
      -- Use the pyproject.toml file for configuration
      args = {
        "--config=pyproject.toml",
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  before_init = function(_, config_arg)
    local pythonUtils = require "utils.python"
    local root_dir = config_arg.root_dir
    local pythonPath = pythonUtils.getPythonPath(root_dir)

    config_arg.settings.python.pythonPath = pythonPath
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- Terraform
lspconfig.tflint.setup {
  on_attach = on_attach,
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
}
