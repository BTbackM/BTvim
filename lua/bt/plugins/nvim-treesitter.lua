if false then return {} end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
	},
  config = function()
    require "nvim-treesitter.configs".setup({
      ensure_installed = {
        "c_sharp",
        "go",
      },
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {},
      },
    })
  end
}
