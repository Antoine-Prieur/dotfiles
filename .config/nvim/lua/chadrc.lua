-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- local harpoonTabs = require "utils.harpoon-tabs"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  tabufline = {
    enabled = false,
  },
  -- statusline = {
  --   -- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "harpoon", "diagnostics", "lsp", "cwd", "cursor" },
  --   order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "harpoon" },
  --   modules = {
  --     harpoon = function()
  --       return harpoonTabs.harpoonFiles()
  --     end,
  --   },
  -- },
  --
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
