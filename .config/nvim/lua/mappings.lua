require "nvchad.mappings"

-- Delete keymap
local nomap = vim.keymap.del

nomap("n", "<leader>n")
nomap("n", "<leader>ff")
nomap("n", "<leader>fw")

local map = vim.keymap.set

-- general
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>nh", ":nohl<CR>", { desc = "[N]o [H]ighlight" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal in terminal mode", nowait = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- resize windows
map("n", "<C-A-h>", "<C-w><", { desc = "Decrease width", nowait = true, silent = true })
map("n", "<C-A-l>", "<C-w>>", { desc = "Increase width", nowait = true, silent = true })
map("n", "<C-A-j>", "<C-w>+", { desc = "Increase height", nowait = true, silent = true })
map("n", "<C-A-k>", "<C-w>-", { desc = "Decrease height", nowait = true, silent = true })

-- Diagnostic keymaps
map("n", "<leader>dN", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Quickfix list
map("n", "<leader>qn", "<Cmd>cnext<CR>", { desc = "[Q]uickfix list [n]ext", nowait = true, silent = true })
map("n", "<leader>qN", "<Cmd>cprevious<CR>", { desc = "[Q]uickfix list previous", nowait = true, silent = true })

-- Git
map("n", "<leader>gs", "<Cmd>Git<CR>", { desc = "fugitive: [G]it [S]tatus", nowait = true, silent = true })
map("n", "<leader>gd", function()
  require("utils.git").open_diff_default_base()
end, { noremap = true, silent = true, desc = "Git diff with main branch" })
map("n", "<leader>gD", function()
  require("utils.git").open_diff_pick_base_snacks()
end, { noremap = true, silent = true, desc = "Git diff with main branch" })
map("n", "<leader>gc", "<Cmd>DiffviewClose<CR>", { noremap = true, silent = true, desc = "Close diffview" })
map("n", "<leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { noremap = true, silent = true, desc = "Git history of current file" })
-- map("n", "<leader>gl", "<Cmd>0Gclog<CR>", { desc = "fugitive: [G]it [L]og of current file", nowait = true, silent = true })

-- LSP
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "<leader>lr", "<Cmd>LspRestart<CR>", { desc = "[L]SP [R]estart" })

-- Notifications/Messages
vim.keymap.set("n", "<leader>fl", function()
  Snacks.picker.notifications()
end, { noremap = true, silent = true, desc = "List notifications/messages" })

-- Find current file
vim.keymap.set("n", "<leader>fn", "<Cmd>NvimTreeFindFile<CR>", { desc = "Find File in Tree" })

-- Snacks
-- Picker command
vim.keymap.set("n", "<leader>f;", function()
  Snacks.picker.commands()
end, { noremap = true, silent = true, desc = "Git commands" })
-- Picker git
vim.keymap.set("n", "<leader>fgb", function()
  Snacks.picker.git_branches()
end, { noremap = true, silent = true, desc = "Git branches" })

vim.keymap.set("n", "<leader>fgl", function()
  Snacks.picker.git_log()
end, { noremap = true, silent = true, desc = "Git log" })

vim.keymap.set("n", "<leader>fgL", function()
  Snacks.picker.git_log_line()
end, { noremap = true, silent = true, desc = "Git branches line" })

vim.keymap.set("n", "<leader>fgs", function()
  Snacks.picker.git_status()
end, { noremap = true, silent = true, desc = "Git status" })

vim.keymap.set("n", "<leader>fgd", function()
  Snacks.picker.git_diff()
end, { noremap = true, silent = true, desc = "Git diff" })

vim.keymap.set("n", "<leader>fgf", function()
  Snacks.picker.git_log_file()
end, { noremap = true, silent = true, desc = "Git log file" })

-- Picker diagnostics (unchanged)
vim.keymap.set("n", "<leader>fd", function()
  Snacks.picker.diagnostics()
end, { noremap = true, silent = true, desc = "Diagnostics" })

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.smart { filter = { cwd = true } }
end, { noremap = true, silent = true, desc = "Smart find file" })

vim.keymap.set("n", "<leader>fa", function()
  Snacks.picker.files()
end, { noremap = true, silent = true, desc = "Find file" })

vim.keymap.set("n", "<leader>fr", function()
  Snacks.picker.recent { filter = { cwd = true } }
end, { noremap = true, silent = true, desc = "Find file" })

vim.keymap.set("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { noremap = true, silent = true, desc = "Find buffers" })

vim.keymap.set("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { noremap = true, silent = true, desc = "Grep" })
