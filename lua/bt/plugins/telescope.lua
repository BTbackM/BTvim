local opts = {
	pickers = {
		git_commits = {
			previewer = false,
			git_command = {
				"git",
				"log",
				"--date=format:%Y-%m-%d %H:%M:%S",
			},
		}
	},
}

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.icons",
	},
	config = function()
		require "telescope".setup(opts)
	end
}
