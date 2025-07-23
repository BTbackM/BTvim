local opts = {
	spec = {
		{
			mode = { "n", "v" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
		},
	},
}

local kmaps = {
	-- Find keymaps
	{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
	{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Keymaps" },

	-- LSP keymaps
	{ "<leader>lr", "<CMD>Telescope lsp_references<CR>", desc = "References" },

	-- Git
	{ "<leader>gb", "<CMD>Telescope git_branches<CR>", desc= "Branches" },
	{ "<leader>gc", "<CMD>Telescope git_commits<CR>", desc= "Commits" },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = opts,
	keys = kmaps,
}
