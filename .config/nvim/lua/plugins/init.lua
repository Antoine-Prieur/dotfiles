return {
  {
    "folke/which-key.nvim",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",

        -- Web Development
        "html-lsp",
        "css-lsp",
        "prettier",

        -- JavaScript/TypeScript
        "typescript-language-server",
        "eslint-lsp",
        "js-debug-adapter",

        -- Python
        "black",
        "ruff-lsp",

        -- JSON
        "fixjson",
        "json-lsp",

        -- Terraform
        "terraform-ls",
        "tflint",

        -- Java
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "google-java-format",

        -- Go
        "gopls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "rust",
        "scala",
        "terraform",
        "java",
        "go",
      },
    },
  },
  {
    {
      "lewis6991/gitsigns.nvim",
      opts = function()
        return require "configs.gitsigns"
      end,
      config = function(_, opts)
        require("gitsigns").setup(opts)
      end,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return require "configs.noice"
    end,
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.harpoon"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
}
