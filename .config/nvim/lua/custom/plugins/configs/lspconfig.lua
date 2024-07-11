local config = require 'lspconfig.configs'

local on_attach = config.on_attach
local capabilities = config.capabilities
local tf_capb = vim.lsp.protocol.make_client_capabilities()
tf_capb.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require 'lspconfig'
local dap = require 'dap'
local util = require 'lspconfig/util'

local path = util.path

-- Utils --

local function get_python_path(workspace)
  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system 'poetry env info -p')
    return path.join(venv, 'bin', 'python')
  end

  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { '*', '.*' } do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath 'python3' or exepath 'python' or 'python'
end

-- Setup --

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' },
  before_init = function(_, config_arg)
    local pythonPath = get_python_path(config.root_dir)

    config_arg.settings.python.pythonPath = pythonPath

    -- Mypy --
    local lint = require 'lint'
    local mypy = lint.linters.mypy

    mypy.cmd = pythonPath
    mypy.args = {
      '-m',
      'mypy',
      '--show-column-numbers',
      '--show-error-end',
      '--hide-error-codes',
      '--hide-error-context',
      '--no-color-output',
      '--no-error-summary',
      '--no-pretty',
    }
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
      },
    },
  },
}

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb {
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    }
  else
    cb {
      type = 'executable',
      command = get_python_path(config.root_dir),
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    }
  end
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',

    program = '${file}',
    pythonPath = function()
      get_python_path(config.root_dir)
    end,
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Module',
    module = 'src.cronjob',
    pythonPath = function()
      get_python_path(config.root_dir)
    end,
  },
}

-- RUST
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'rust' },
  root_dir = util.root_pattern 'Cargo.toml',
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
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
