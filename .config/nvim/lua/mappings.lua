require "nvchad.mappings"

-- Delete keymap
local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")
nomap("n", "<leader>n")
nomap("n", "<leader>x")

local map = vim.keymap.set

-- navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- general

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>nh", ":nohl<CR>", { desc = "[N]o [H]ighlight" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal in terminal mode", nowait = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- resize windows
map("n", "<A-h>", "<C-w><", { desc = "Decrease width", nowait = true, silent = true })
map("n", "<A-l>", "<C-w>>", { desc = "Increase width", nowait = true, silent = true })
map("n", "<A-j>", "<C-w>+", { desc = "Increase height", nowait = true, silent = true })
map("n", "<A-k>", "<C-w>-", { desc = "Decrease height", nowait = true, silent = true })

-- Diagnostic keymaps
map("n", "<leader>dN", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Quickfix list
map("n", "<leader>qn", "<Cmd>cnext<CR>", { desc = "[Q]uickfix list [n]ext", nowait = true, silent = true })
map("n", "<leader>qN", "<Cmd>cprevious<CR>", { desc = "[Q]uickfix list previous", nowait = true, silent = true })

-- Git fugitive
map("n", "<leader>gs", "<Cmd>Git<CR>", { desc = "fugitive: [G]it [S]tatus", nowait = true, silent = true })
map("n", "<leader>gl", "<Cmd>0Gclog<CR>", { desc = "fugitive: [G]it [L]og of current file", nowait = true, silent = true })

-- LSP
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition" })

-- Claude integration
-- vim.keymap.set("n", "<leader>k", ":AskAIAssistant<CR>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>k", ":<C-u>AskAIAssistantVisual<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fk", ":AIAssistantHistory<CR>", { noremap = true, silent = true })
