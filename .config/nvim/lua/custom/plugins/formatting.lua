return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        python = { 'isort', 'black' },
        json = { 'fixjson' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        terraform = { 'terraformls' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      }
    end, { desc = 'Conform - format file or range (in visual mode)' })

    local imports_scala_augroup = vim.api.nvim_create_augroup('importScala', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufWrite' }, {
      group = imports_scala_augroup,
      pattern = '*.scala',
      command = 'MetalsOrganizeImports',
    })
  end,
}
