if false then
	return {}
end

return {
	{
		"rest-nvim/rest.nvim",
		enabled = true,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				opts = function(_, opts)
					opts.ensure_installed = opts.ensure_installed or {}
					table.insert(opts.ensure_installed, "http")
				end,
			},
		},
	},
	{
		"mistweaverco/kulala.nvim",
		enabled = true,
		keys = {
			{ "<leader>rs", desc = "Send request" },
			{ "<leader>ra", desc = "Send all requests" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},
}
