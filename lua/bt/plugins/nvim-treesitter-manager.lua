if true then
	return {}
end

local opts = {
  auto_install = true,
	border = "rounded",
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"c_sharp",
		"go",
		"http",
		"javascript",
		"kotlin",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},
  highlight = true,
  languages = {}
}

return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {},
	config = function()
		require("tree-sitter-manager").setup(opts)
	end,
}
