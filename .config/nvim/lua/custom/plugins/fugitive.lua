return {
  'tpope/vim-fugitive',
  config = function()
    --vim.keymap.set('n', '<leader>gb', '<Cmd>Git blame<CR>', { desc = 'fugitive: [G]it [B]lame', nowait = true, silent = true })
    vim.keymap.set('n', '<leader>gs', '<Cmd>Git<CR>', { desc = 'fugitive: [G]it [S]tatus', nowait = true, silent = true })
    --vim.keymap.set('n', '<leader>gd', '<Cmd>Git difftool -y<CR>', { desc = 'fugitive: [G]it [D]iff', nowait = true, silent = true })
    vim.keymap.set('n', '<leader>gl', '<Cmd>0Gclog<CR>', { desc = 'fugitive: [G]it [L]og of current file', nowait = true, silent = true })
  end,
}
