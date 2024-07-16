local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    json = { "fixjson" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    terraform = { "terraformls" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

local conform = require "conform"

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 10000,
  }
end, { desc = "Conform - format file or range (in visual mode)" })

conform.setup(options)
