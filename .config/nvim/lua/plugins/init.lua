return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "window left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "window up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "window right" },
    },
  },
  {
    "stevearc/conform.nvim",
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
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-dap",
  },
}
