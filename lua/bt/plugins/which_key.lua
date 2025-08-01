if false then
	return {}
end

local opts = {
	delay = 0,
	icons = {
		mappings = vim.g.have_nerd_font,
		keys = vim.g.have_nerd_font and {} or {
			Up = "<Up> ",
			Down = "<Down> ",
			Left = "<Left> ",
			Right = "<Right> ",
			C = "<C-…> ",
			M = "<M-…> ",
			D = "<D-…> ",
			S = "<S-…> ",
			CR = "<CR> ",
			Esc = "<Esc> ",
			ScrollWheelDown = "<ScrollWheelDown> ",
			ScrollWheelUp = "<ScrollWheelUp> ",
			NL = "<NL> ",
			BS = "<BS> ",
			Space = "<Space> ",
			Tab = "<Tab> ",
			F1 = "<F1>",
			F2 = "<F2>",
			F3 = "<F3>",
			F4 = "<F4>",
			F5 = "<F5>",
			F6 = "<F6>",
			F7 = "<F7>",
			F8 = "<F8>",
			F9 = "<F9>",
			F10 = "<F10>",
			F11 = "<F11>",
			F12 = "<F12>",
		},
	},
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
	event = "VimEnter",
	opts = opts,
	keys = kmaps,
}
