vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {}
    vim.keymap.set('n', '<leader><space>', '<Cmd>NvimTreeToggle<CR>', { desc = 'nvim-tree: Toggle', nowait = true, silent = true })
  end,
}
