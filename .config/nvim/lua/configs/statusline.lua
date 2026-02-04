local M = {}

-- Set up highlight groups for Harpoon statusline
vim.api.nvim_set_hl(0, "St_HarpoonActive", {
  fg = "#a6e3a1", -- green
  bg = "#1e1e2e", -- dark background
  bold = true,
})

vim.api.nvim_set_hl(0, "St_HarpoonInactive", {
  fg = "#6c7086", -- grey
  bg = "#1e1e2e", -- dark background
})

M.harpoon = function()
  local harpoon = require("harpoon")
  local harpoon_list = harpoon:list()
  local marks_length = harpoon_list:length()

  if marks_length == 0 then
    return ""
  end

  local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
  local parts = {}

  for index = 1, math.min(marks_length, 9) do
    local harpoon_item = harpoon_list:get(index)
    if harpoon_item then
      local harpoon_file_path = harpoon_item.value
      local filename = vim.fn.fnamemodify(harpoon_file_path, ":t")

      if filename == "" then
        filename = "(empty)"
      end

      local is_current = current_file_path == harpoon_file_path
      local hl = is_current and "%#St_HarpoonActive#" or "%#St_HarpoonInactive#"

      table.insert(parts, string.format("%s %d:%s ", hl, index, filename))
    end
  end

  return table.concat(parts)
end

return M
