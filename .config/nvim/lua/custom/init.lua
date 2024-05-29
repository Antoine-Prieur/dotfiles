require('lazy').setup({
  -- Git related plugins
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Mason
  'williamboman/mason.nvim',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { import = 'custom.plugins' },
}, {})

require 'custom.lsp'
require 'custom.settings'
require 'custom.mappings'

require('mason').setup()
require('lsp_signature').setup()

-- Plugins config
require 'custom.plugins.configs.neogen'
require 'custom.plugins.configs.telescope'
require 'custom.plugins.configs.harpoon'
require 'custom.plugins.configs.nvim-tree'
require 'custom.plugins.configs.lspconfig'
require 'custom.plugins.configs.noice'
require 'custom.plugins.configs.lualine'
require 'custom.plugins.configs.dap'
