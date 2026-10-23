if not vim.g.conform then
	return {}
end

local opts = {
	async = true,
	notify_on_error = false,
	formatters_by_ft = {
		astro = { "biome" },
		cs = { "csharpier" },
		css = { "biome" },
		csproj = { "csharpier" },
		go = { "gofumpt", "goimports" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		json = { "jq" },
		jsonc = { "jq" },
		kotlin = { "ktfmt" },
		lua = { "stylua" },
		py = { "ruff_format" },
		sql = { "sleek" },
		toml = { "yq" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		yaml = { "yamlfmt" },
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
