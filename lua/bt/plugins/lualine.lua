if false then return {} end

local function lualine_config(_, opts)
  require "lualine".setup(opts)
end

local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
		disabled_filetypes = { "NvimTree" },
		component_separators = {
			left = "",
			right = "",
		},
		section_separators = {
			left = "",
			right = "",
		},
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
