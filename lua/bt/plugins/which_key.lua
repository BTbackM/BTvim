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
			{ "<leader>R", group = "Request" },
		},
	},
}

local kmaps = {
	-- LSP
	{ "<leader>ls", ":LspStatus<CR>", desc = "LSP Status" },
	{ "<leader>li", ":LspClientInfo<CR>", desc = "LSP Client Info" },

	-- Git
	{ "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle blame" },

	-- Conform
	{
		"<leader>cf",
		function()
			require("conform").format({ lsp_fallback = true })
		end,
		desc = "Conform format",
	},

	-- Rest
	-- { "<leader>rc", ":Rest cookies<CR>", desc = "Rest cookies" },
	-- { "<leader>rr", ":Rest run<CR>", desc = "Rest run" },
	-- { "<leader>rl", ":Rest last<CR>", desc = "Rest last request" },
}

return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = opts,
	keys = kmaps,
}
