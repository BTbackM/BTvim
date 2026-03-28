if false then
	return {}
end

local opts = {
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
	auto_install = true,
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
	},
	opts = opts,
}
