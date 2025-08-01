if false then
	return {}
end

local opts = {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
		},
	},
	pickers = {
		git_commits = {
			previewer = false,
			git_command = {
				"git",
				"log",
				"--date=format:%Y-%m-%d %H:%M:%S",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				previewer = false,
			}),
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
		"echasnovski/mini.icons",
	},
	config = function()
		require("telescope").setup(opts)

		-- Load extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		-- Load keymaps
		local builtin = require("telescope.builtin")
		local theme = require("telescope.themes").get_dropdown({ previewer = false })
		-- Find keymaps
		vim.keymaps.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymaps.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymaps.set("n", "<leader>ff", builtin.find_files(theme), { desc = "Files" })
		vim.keymaps.set("n", "<leader>fF", builtin.find_files, { desc = "Files" })
    vim.keymaps.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
		vim.keymaps.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
		vim.keymaps.set("n", "<leader>fl", builtin.live_grep, { desc = "Live grep" })
		vim.keymaps.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep" })
		vim.keymaps.set("n", "<leader>f.", builtin.oldfiles, { desc = "Recent" })

		-- Git keymaps
		vim.keymaps.set("n", "<leader>gb", builtin.git_branches, { desc = "Branches" })
		vim.keymaps.set("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
		vim.keymaps.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
	end,
}
