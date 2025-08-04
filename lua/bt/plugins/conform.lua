if false then
	return {}
end

local opts = {
	notify_on_error = false,
	formatters_by_ft = {
		go = { "gofumpt", "goimports" },
		lua = { "stylua" },
	},
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = opts,
}
