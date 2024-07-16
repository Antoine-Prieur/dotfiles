return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Window left', nowait = true, silent = true })
        vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Window right', nowait = true, silent = true })
        vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Window down', nowait = true, silent = true })
        vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Window up', nowait = true, silent = true })
    end
}
