if false then
	return {}
end

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
	ui = {
		border = "rounded",
		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	max_concurrent_installers = 8,
	ensure_installed = {
		-- LSP servers
		"astro-language-server", -- Astro
		-- "csharp_ls", -- C#
		"lua-language-server", -- Lua
		"gopls", -- Go
		"kotlin-language-server", -- Kotlin
		-- "omnisharp", -- C#
		"roslyn", -- C#
		"typescript-language-server", -- TS
		"vtsls", -- TS

		-- Formatters
		"biome", -- TS
		"gofumpt", -- Go
		"goimports", -- Go
		"ktfmt", -- Kotlin
		"sleek", -- SQL
		"stylua", -- Lua

		-- Linters
		"luacheck", -- Lua
	},
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
}

return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		cmd = "Mason",
		keys = {
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		},
		build = ":MasonUpdate",
		opts = opts,
		config = mason_config,
	},
	{
		"seblyng/roslyn.nvim",
		opts = {},
	},
}
