if false then
	return {}
end

local opts = {
	notify_on_error = false,
	formatters_by_ft = {
		astro = { "biome" },
		go = { "gofumpt", "goimports" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		kotlin = { "ktfmt" },
		lua = { "stylua" },
		sql = { "sleek" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
	},
	formatters = {
		sleek = {
			append_args = { "-i", "2" },
		},
	},
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = opts,
}
