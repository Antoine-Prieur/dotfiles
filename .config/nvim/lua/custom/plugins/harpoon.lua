return {
  'ThePrimeagen/harpoon',
  version = '*',

  config = function()
    local harpoon_mark = require 'harpoon.mark'
    local harpoon_ui = require 'harpoon.ui'

    print 'orange'

    vim.keymap.set('n', '<leader>a', function()
      harpoon_mark.add_file()
    end, { desc = 'Harpoon - [A]dd file' })

    vim.keymap.set('n', '<leader><tab>', function()
      harpoon_ui.toggle_quick_menu()
    end, { desc = 'Open harpoon quick menu', nowait = true, silent = true })

    vim.keymap.set('n', '<tab>', function()
      harpoon_ui.nav_next()
    end, { desc = 'Navigate to next file', nowait = true, silent = true })

    vim.keymap.set('n', '<BS>', function()
      harpoon_ui.nav_prev()
    end, { desc = 'Navigate to previous file', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>1', function()
      harpoon_ui.nav_file(1)
    end, { desc = 'Navigate to file 1', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>2', function()
      harpoon_ui.nav_file(2)
    end, { desc = 'Navigate to file 2', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>3', function()
      harpoon_ui.nav_file(3)
    end, { desc = 'Navigate to file 3', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>4', function()
      harpoon_ui.nav_file(4)
    end, { desc = 'Navigate to file 4', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>5', function()
      harpoon_ui.nav_file(5)
    end, { desc = 'Navigate to file 5', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>6', function()
      harpoon_ui.nav_file(6)
    end, { desc = 'Navigate to file 6', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>7', function()
      harpoon_ui.nav_file(7)
    end, { desc = 'Navigate to file 7', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>8', function()
      harpoon_ui.nav_file(8)
    end, { desc = 'Navigate to file 8', nowait = true, silent = true })

    vim.keymap.set('n', '<leader>9', function()
      harpoon_ui.nav_file(9)
    end, { desc = 'Navigate to file 9', nowait = true, silent = true })

    require('harpoon').setup {
      global_settings = {
        tabline = true,
      },
      tabline = true,
    }
  end,
}
