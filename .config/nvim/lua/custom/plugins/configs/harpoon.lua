local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  settings={
    save_on_toggle = true,
  }
})
-- REQUIRED


vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon - [A]dd file' })

vim.keymap.set('n', '<leader><tab>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon quick menu', nowait = true, silent = true })

vim.keymap.set('n', '<tab>', function()
  harpoon:list():next()
end, { desc = 'Navigate to next file', nowait = true, silent = true })

vim.keymap.set('n', '<BS>', function()
  harpoon:list():prev()
end, { desc = 'Navigate to previous file', nowait = true, silent = true })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = 'Navigate to file 1', nowait = true, silent = true })

vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = 'Navigate to file 2', nowait = true, silent = true })

vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = 'Navigate to file 3', nowait = true, silent = true })

vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = 'Navigate to file 4', nowait = true, silent = true })

vim.keymap.set('n', '<leader>5', function()
  harpoon:list():select(5)
end, { desc = 'Navigate to file 5', nowait = true, silent = true })

vim.keymap.set('n', '<leader>6', function()
  harpoon:list():select(6)
end, { desc = 'Navigate to file 6', nowait = true, silent = true })

vim.keymap.set('n', '<leader>7', function()
  harpoon:list():select(7)
end, { desc = 'Navigate to file 7', nowait = true, silent = true })

vim.keymap.set('n', '<leader>8', function()
  harpoon:list():select(8)
end, { desc = 'Navigate to file 8', nowait = true, silent = true })

vim.keymap.set('n', '<leader>9', function()
  harpoon:list():select(9)
end, { desc = 'Navigate to file 9', nowait = true, silent = true })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

