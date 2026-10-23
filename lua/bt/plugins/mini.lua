if not vim.g.mini then
	return {}
end

return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})
			require("mini.surround").setup()
		end,
	},
}
