local neogen = require 'neogen'

neogen.setup {
  enabled = true,
  input_after_comment = true,
}

vim.keymap.set('n', '<leader>ng', function()
  neogen.generate()
end, { desc = 'Neogen - [N]eo [G]enerate' })
