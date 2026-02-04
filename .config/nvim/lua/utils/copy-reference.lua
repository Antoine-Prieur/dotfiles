local M = {}

function M.copy_file_reference()
  local file_path = vim.fn.expand("%:.")
  local current_line = vim.fn.line(".")

  local result = string.format("Path: %s\nLine: %d", file_path, current_line)

  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. file_path .. ":" .. current_line, vim.log.levels.INFO)
end

function M.copy_file_reference_range()
  local file_path = vim.fn.expand("%:.")
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local result = string.format("Path: %s\nLine: %d:%d", file_path, start_line, end_line)

  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. file_path .. ":" .. start_line .. ":" .. end_line, vim.log.levels.INFO)
end

function M.show_file_path()
  local file_path = vim.fn.expand("%:.")
  vim.notify(file_path, vim.log.levels.INFO)
end

return M
