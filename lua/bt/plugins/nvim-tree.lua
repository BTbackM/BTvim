if not vim.g.nvim_tree then
	return {}
end

local abbreviations = {
	InventoryCC = "ICC",
	MarkKeeper = "MK",
}

local function abbreviate_label(label)
	for full, abbreviation in pairs(abbreviations) do
		label = label:gsub(vim.pesc(full), function()
			return abbreviation
		end)
	end
	return label
end

local function nvim_tree_config(_, opts)
	-- nvim-tree has no public node-label transform, so adapt only rendered text.
	local builder = require("nvim-tree.renderer.builder")
	local icon_name_decorated = builder.icon_name_decorated
	function builder:icon_name_decorated(node)
		local icon, name = icon_name_decorated(self, node)
		name.str = abbreviate_label(name.str)
		return icon, name
	end

	require("nvim-tree").setup(opts)
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
		width = 35,
		side = "left",
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
