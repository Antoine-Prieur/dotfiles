local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    json = { "fixjson" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    terraform = { "terraform_fmt" },
    java = { "google-java-format" },
  },

  formatters = {
    ["google-java-format"] = {
      prepend_args = { "--aosp" },
    },
  },

  format_on_save = {
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

local imports_scala_augroup = vim.api.nvim_create_augroup("importScala", { clear = true })

vim.api.nvim_create_autocmd({ "BufWrite" }, {
  group = imports_scala_augroup,
  pattern = "*.scala",
  command = "MetalsOrganizeImports",
})

conform.setup(options)
