local opts = {
	formatters_by_ft = {
		go = { "gofumpt", "goimports" },
		lua = { "stylua" },
	}
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
  opts = opts,
}
