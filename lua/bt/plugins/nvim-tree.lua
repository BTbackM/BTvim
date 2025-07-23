local function nvim_tree_config(_, opts)
  require "nvim-tree".setup(opts)
end

local opts = {
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = false,
		icons = {
			error = "",
			warning = "",
			info = "󰋼",
			hint = "󰛨",
		},
	},
	git = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = false,
		disable_for_dirs = {},
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					untracked = "",
					ignored = "",
				},
			},
		},
	},
	view = {
		width = 25,
		side = "left"
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
}

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
