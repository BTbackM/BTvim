if false then
	return {}
end

local colors = require("bt.colorscheme.gruvbox.colors")

local opts = {
	override_by_extension = {
		["http"] = {
			icon = "",
		},
		["md"] = {
			icon = "",
			color = colors["custom"].purple,
			name = "Markdown",
		},
	},
}

return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup(opts)
		end,
	},
}
