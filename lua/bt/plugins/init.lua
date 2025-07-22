local M = {}

function M.init()
  vim.pack.add({
    -- { src = "https://github.com/stevearc/oil.nvim" },
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-tree.lua",
  })
end

function M.load()
  -- require("bt.plugins.oil")
  require("bt.plugins.lualine")
  require("bt.plugins.nvim-tree")
end

return M
