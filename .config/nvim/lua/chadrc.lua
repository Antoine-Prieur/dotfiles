-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "default",
    -- order = { "mode", "git", "%=", "harpoon", "%=", "lsp_msg", "diagnostics", "lsp", "file", "cwd", "cursor" },
    order = { "harpoon", "%=", "diagnostics", "cwd" },
    modules = {
      harpoon = function()
        return require("configs.statusline").harpoon()
      end,
    },
  },
  hl_override = {
    St_HarpoonActive = { fg = "green", bg = "statusline_bg", bold = true, underline = true },
    St_HarpoonInactive = { fg = "light_grey", bg = "statusline_bg" },
  },
}

return M
