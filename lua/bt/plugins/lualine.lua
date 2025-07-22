local function lualine_config(_, opts)
  require "lualine".setup(opts)
end

local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = opts,
    config = lualine_config,
  },
}
