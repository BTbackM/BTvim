if false then return {} end

local opts = {
	keymaps = {
		accept_suggestion = "<C-l>",
		clear_suggestion = "<C-h>",
		accept_word = "<C-k>",
	}
}

return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require "supermaven-nvim".setup(opts)
	end,
}
