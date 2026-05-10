if false then
	return {}
end

local opts = {
	completion = { crates = { enabled = true } },
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
}

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
		opts = opts,
		config = function()
			require("crates").setup()
		end,
	},
}
