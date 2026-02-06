local M = {}

local function format_line_ranges(lines)
  if #lines == 1 then
    return "Line " .. lines[1]
  end

  table.sort(lines)
  local ranges = {}
  local range_start = lines[1]
  local range_end = lines[1]

  for i = 2, #lines do
    if lines[i] == range_end + 1 then
      range_end = lines[i]
    else
      local range_str = range_start == range_end and tostring(range_start) or range_start .. "-" .. range_end
      table.insert(ranges, range_str)
      range_start = lines[i]
      range_end = lines[i]
    end
  end

  local range_str = range_start == range_end and tostring(range_start) or range_start .. "-" .. range_end
  table.insert(ranges, range_str)

  return "Lines " .. table.concat(ranges, ", ")
end

function M.copy_file_reference()
  local file_path = vim.fn.expand("%:p")
  local current_line = vim.fn.line(".")

  local result = string.format("Path: %s\nLine: %d", file_path, current_line)

  -- Get diagnostics for the current line
  local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })
  if #diagnostics > 0 then
    result = result .. "\nDiagnostics:"
    for _, diag in ipairs(diagnostics) do
      local severity = vim.diagnostic.severity[diag.severity]
      result = result .. string.format("\n  [%s] %s", severity, diag.message)
    end
  end

  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. file_path .. ":" .. current_line, vim.log.levels.INFO)
end

function M.copy_file_reference_range()
  local file_path = vim.fn.expand("%:p")
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local result = string.format("Path: %s\nLine: %d:%d", file_path, start_line, end_line)

  -- Get diagnostics for the line range
  local all_diagnostics = {}
  for line = start_line, end_line do
    local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })
    for _, diag in ipairs(diagnostics) do
      table.insert(all_diagnostics, { line = line, diag = diag })
    end
  end

  if #all_diagnostics > 0 then
    local grouped = {}
    for _, item in ipairs(all_diagnostics) do
      local key = item.diag.severity .. "|" .. item.diag.message
      grouped[key] = grouped[key] or {
        severity = item.diag.severity,
        message = item.diag.message,
        lines = {},
      }
      table.insert(grouped[key].lines, item.line)
    end

    result = result .. "\nDiagnostics:"
    for _, group in pairs(grouped) do
      local severity = vim.diagnostic.severity[group.severity]
      local line_str = format_line_ranges(group.lines)
      result = result .. string.format("\n  %s [%s] %s", line_str, severity, group.message)
    end
  end

  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. file_path .. ":" .. start_line .. ":" .. end_line, vim.log.levels.INFO)
end

function M.show_file_path()
  local full_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", full_path)

  local display_path = full_path
  if #full_path > 60 then
    display_path = "..." .. string.sub(full_path, -57)
  end

  vim.notify("Copied: " .. display_path, vim.log.levels.INFO)
end

return M
