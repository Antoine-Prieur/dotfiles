return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    return require "configs.nvimtree"
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
