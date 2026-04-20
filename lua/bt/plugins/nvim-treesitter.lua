if true then
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
	branch = "main",
	build = ":TSUpdate",
	main = "nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local bt = vim.bo.buftype
				local filetype = vim.bo.filetype
				local lang = vim.treesitter.language.get_lang(filetype)

				-- Don't do anything for help buffers
				if bt ~= "" then
					return
				end

				if vim.treesitter.language.add(lang) then
					vim.treesitter.start()
				end
			end,
		})

		vim.api.nvim_create_autocmd("TSChanged", {
			callback = function()
				local nts = require("nvim-treesitter")
				nts.install(opts.ensure_installed)
			end,
		})
	end,
	opts = opts,
	config = function()
		local nts = require("nvim-treesitter")
		nts.install(opts.ensure_installed)

		local context = require("treesitter-context")
		context.setup({
			max_lines = 3,
			multiline_threshold = 1,
			separator = "-",
			min_window_height = 20,
			line_numbers = true,
		})
	end,
}
