return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require "gruvbox".setup({
				bold = true,
				contrast = "soft",
				terminal_colors = true,
				transparent_mode = false,
			})

			vim.o.background = "light"
			vim.cmd('colorscheme gruvbox')
		end
	}
}
