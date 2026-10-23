if not vim.g.obsidian then
	return {}
end

local opts = {
	legacy_commands = false,
	workspaces = {
		{
			name = "work",
			path = "~/Documents/BT",
		},
	},
	daily_notes = {
		folder = "Daily",
	},
	picker = {
		name = "telescope.nvim",
	},
	ui = {
		checkboxes = {
			[">"] = { char = "󰧚", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "", hl_group = "ObsidianTilde" },
			["!"] = { char = "", hl_group = "ObsidianImportant" },
			["v"] = { char = "", hl_group = "ObsidianDone" },
		},
	},
}

return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		opts = opts,
	},
}
