if true then
	return {}
end

return {
	{
		"rest-nvim/rest.nvim",
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
		keys = {
			{ "<leader>rs", desc = "Send request" },
			{ "<leader>ra", desc = "Send all requests" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>r",
			kulala_keymaps_prefix = "",
		},
	},
}
