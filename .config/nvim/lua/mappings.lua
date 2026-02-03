require "nvchad.mappings"

-- Delete keymap
local nomap = vim.keymap.del

-- Only delete keymaps that NvChad actually defines
nomap("n", "<C-n>")
nomap("n", "<leader>n")
nomap("n", "<leader>ff")
nomap("n", "<leader>fa")
nomap("n", "<leader>fb")
nomap("n", "<leader>fw")

local map = vim.keymap.set

-- Snacks keymaps
local snacks = require("snacks")
map("n", "<C-n>", function()
  snacks.explorer()
end, { desc = "File Explorer" })
map("n", "<leader><leader>", function()
  snacks.picker.smart { filter = { cwd = true } }
end, { desc = "Smart find file" })
map("n", "<leader>ff", function()
  snacks.picker.files()
end, { desc = "Find file" })
map("n", "<leader>fr", function()
  snacks.picker.recent { filter = { cwd = true } }
end, { desc = "Recent files" })
map("n", "<leader>fb", function()
  snacks.picker.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fw", function()
  snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>fl", function()
  snacks.picker.notifications()
end, { desc = "List notifications" })
map("n", "<leader>f;", function()
  snacks.picker.commands()
end, { desc = "Commands" })
map("n", "<leader>fd", function()
  snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>fgb", function()
  snacks.picker.git_branches()
end, { desc = "Git branches" })
map("n", "<leader>fgl", function()
  snacks.picker.git_log()
end, { desc = "Git log" })
map("n", "<leader>fgL", function()
  snacks.picker.git_log_line()
end, { desc = "Git log line" })
map("n", "<leader>fgs", function()
  snacks.picker.git_status()
end, { desc = "Git status" })
map("n", "<leader>fgd", function()
  snacks.picker.git_diff()
end, { desc = "Git diff" })
map("n", "<leader>fgf", function()
  snacks.picker.git_log_file()
end, { desc = "Git log file" })

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

-- Find current file
vim.keymap.set("n", "<leader>fn", "<Cmd>NvimTreeFindFile<CR>", { desc = "Find File in Tree" })

-- DAP (Debugger)
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: Start/Continue" })

vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug: Step Over" })

vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug: Step Into" })

vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debug: Step Out" })

vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "[D]ebug: Toggle [B]reakpoint" })

vim.keymap.set("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "[D]ebug: Set Conditional [B]reakpoint" })

vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "[D]ebug: Open [R]EPL" })

vim.keymap.set("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "[D]ebug: Run [L]ast" })

vim.keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "[D]ebug: [T]erminate" })

vim.keymap.set("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "[D]ebug: Toggle [U]I" })
