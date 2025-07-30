local function mason_config(_, opts)
	require("mason").setup(opts)

	local mr = require("mason-registry")
	local function ensure_installed()
		for _, tool in ipairs(opts.ensure_installed) do
			if mr.has_package(tool) then
				local package = mr.get_package(tool)
				if not package:is_installed() then
					vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
					package:install():once("closed", function()
						if package:is_installed() then
							vim.notify("Mason: " .. tool .. " installed successfully!", vim.log.levels.INFO)
						else
							vim.notify("Mason: " .. tool .. " failed to install!", vim.log.levels.ERROR)
						end
					end)
				end
			else
				vim.notify("Mason: Package " .. tool .. " not found!", vim.log.levels.WARN)
			end
		end
	end

	if mr.refresh then
		mr.refresh(ensure_installed)
	else
		ensure_installed()
	end
end

local opts = {
	ensure_installed = {
		-- LSP servers
		"lua-language-server", -- Lua
		"gopls", -- Go
    "omnisharp", -- C#

		-- Formatters
		"gofumpt", -- Go
		"goimports", -- Go
		"stylua", -- Lua

		-- Linters
		"luacheck", -- Lua
	},
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		cmd = "Mason",
		keys = {
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		},
		build = ":MasonUpdate",
		opts = opts,
		config = mason_config,
	},
}
