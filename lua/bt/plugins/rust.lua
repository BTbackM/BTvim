if false then
	return {}
end

local opts = {}

return {
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
}
