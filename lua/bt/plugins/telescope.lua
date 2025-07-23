local opts = {
	pickers = {
		git_commits = {
			previewer = false,
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
