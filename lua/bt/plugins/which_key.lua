local opts = {
	spec = {
		{
			mode = { "n", "v" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>c", group = "Conform" },
		},
	},
}

local kmaps = {
	-- Find keymaps
	{ "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
	{ "<leader>ff", ":Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" },
	{ "<leader>fk", ":Telescope live_grep<CR>", desc = "Live grep" },

	-- LSP keymaps
	{ "<leader>lr", ":Telescope lsp_references<CR>", desc = "References" },
	{ "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code actions" },

	-- Git
	{ "<leader>gb", ":Telescope git_branches<CR>", desc= "Branches" },
	{ "<leader>gc", ":Telescope git_commits<CR>", desc= "Commits" },

	-- Conform
	{ "<leader>cf", ":lua require('conform').format({ async = true })<CR>", desc = "Format" },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = opts,
	keys = kmaps,
}
