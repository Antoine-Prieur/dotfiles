require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
