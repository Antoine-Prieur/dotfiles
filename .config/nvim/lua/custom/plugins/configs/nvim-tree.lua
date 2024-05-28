require('nvim-tree').setup {
  view = {
    adaptive_size = false,
    side = 'left',
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = false,
    highlight_modified = 'icon',
    highlight_diagnostics = true,
    highlight_opened_files = 'name',

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        diagnostics = false,
      },
      glyphs = {
        default = '󰈚',
        symlink = '',
        folder = {
          default = '',
          empty = '',
          empty_open = '',
          open = '',
          symlink = '',
          symlink_open = '',
          arrow_open = '',
          arrow_closed = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
}
