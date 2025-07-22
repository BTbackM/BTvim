local function nvim_tree_config(_, opts)
  require "nvim-tree".setup(opts)
end

local opts = {}

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = opts,
    config = nvim_tree_config,
  },
}
