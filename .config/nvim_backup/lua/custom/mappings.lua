-- Custom mappings
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('v', '<J>', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', '<K>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = '[N]o [H]ighlight' })

-- switch between windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left', nowait = true, silent = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right', nowait = true, silent = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down', nowait = true, silent = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up', nowait = true, silent = true })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close buffer' })

-- resize windows
vim.keymap.set('n', '<A-h>', '<C-w><', { desc = 'Decrease width', nowait = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>>', { desc = 'Increase width', nowait = true, silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>+', { desc = 'Increase height', nowait = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>-', { desc = 'Decrease height', nowait = true, silent = true })

-- tabulations
vim.keymap.set('n', '<C-x>', '<Cmd>tabclose<CR>', { desc = 'Close tab', nowait = true, silent = true })

-- open terminal
vim.keymap.set('n', '<leader>t', '<Cmd>terminal<CR>', { desc = 'Open terminal', nowait = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dN', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Escape terminal in terminal mode', nowait = true, silent = true })

-- Quickfix list
vim.keymap.set('n', '<leader>qn', '<Cmd>cnext<CR>', { desc = '[Q]uickfix list [n]ext', nowait = true, silent = true })
vim.keymap.set('n', '<leader>qN', '<Cmd>cprevious<CR>', { desc = '[Q]uickfix list previous', nowait = true, silent = true })

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope harpoon marks<CR>', { desc = '[S]earch [H]arpoon marks' })

-- LSP keymaps
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]o to [D]eclaration' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [d]efinition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP buf hover' })
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = '[L]SP [S]ignature' })
vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, { desc = '[G]o to [D]efinition' })
