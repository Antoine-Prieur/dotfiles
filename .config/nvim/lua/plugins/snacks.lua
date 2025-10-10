return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    -- explorer = { enabled = true, hidden = true, git_ignored = true, respect_gitignore = false, allow_patterns = { ".*" } },
    image = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000, -- default timeout in ms
      top_down = true, -- show notifications from top to bottom
      margin = { top = 1, right = 1, bottom = 0 }, -- position at top-right
      width = { min = 40, max = 60 }, -- limit width to max 60 columns
      height = { min = 1, max = 10 }, -- limit to max 10 lines per notification
    },
    picker = {
      enabled = true,
      ignored = true,
      git_ignored = true,
      exclude = {
        ".git",
        "node_modules",
        "dist",
        "build",
        "target",
        ".next",
        ".turbo",
        "coverage",
        "venv",
        ".venv",
        ".pnpm-store",
        ".cache",
      },
      formatters = { file = { truncate = 100 } },
    },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
