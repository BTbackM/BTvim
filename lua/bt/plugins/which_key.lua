if false then return {} end

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
	{
		"<leader>ff",
		":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
		desc = "Files",
	},
	{ "<leader>fF", ":Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" },
	{ "<leader>fl", ":Telescope live_grep<CR>", desc = "Live grep" },

	-- LSP keymaps
	{ "<leader>lr", ":Telescope lsp_references<CR>", desc = "References" },
	{ "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code actions" },
	{ "<leader>ls", ":LspStatus<CR>", desc = "Status" },

	-- Git
	{ "<leader>gb", ":Telescope git_branches<CR>", desc = "Branches" },
	{ "<leader>gc", ":Telescope git_commits<CR>", desc = "Commits" },
	{ "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle blame" },

	-- Conform
	{ "<leader>cf", ":lua require('conform').format({ async = true })<CR>", desc = "Format" },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = opts,
	keys = kmaps,
}
