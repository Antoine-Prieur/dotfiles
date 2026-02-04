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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup {
        settings = {
          save_on_toggle = true,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      -- Setup DAP UI
      dapui.setup()

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup()

      -- Customize breakpoint signs
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◎", texthl = "DapLogPoint", linehl = "", numhl = "" })

      -- Set highlight colors
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#00ff00" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e2e2e" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })

      -- Auto open/close UI
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Load language-specific configurations
      require "configs.dap-py"
      require "configs.dap-go"
    end,
  },
}
