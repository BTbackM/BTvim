if not vim.g.nvim_lint then
	return {}
end

local opts = {
	linters_by_ft = {
		lua = { "luacheck" },
	},
}

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = opts.linters_by_ft

		local luacheck = lint.linters.luacheck
		luacheck.args = vim.list_extend({ "--globals", "hl", "vim" }, luacheck.args)

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
