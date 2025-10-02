if true then
	return {}
end

local icons = require("bt.core.icons")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function cmp_config()
	vim.lsp.config("*", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})
	vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

	local autoselect = false
	local cmp = require("cmp")
	local cmp_types = require("cmp.types.cmp")
	local defaults = require("cmp.config.default")()
	local luasnip = require("luasnip")

	local ConfirmBehavior = cmp_types.ConfirmBehavior
	local SelectBehavior = cmp_types.SelectBehavior
	local opts = {
		auto_brackets = {},
		completion = {
			completeopt = "menu,menuone,noinsert" .. (autoselect and "" or ",noselect"),
		},
		preselect = autoselect and cmp.PreselectMode.Item or cmp.PreselectMode.None,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					local confirm_opts = {
						behavior = ConfirmBehavior.Replace,
						select = false,
					}
					local is_insert_mode = function()
						return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
					end
					if is_insert_mode() then -- prevent overwriting brackets
						confirm_opts.behavior = ConfirmBehavior.Insert
					end
					if cmp.confirm(confirm_opts) then
						return
					end
				end
				fallback()
			end),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, item)
				local source_names = {
					nvim_lsp = "LSP",
					nvim_lua = "LSP",
					snippets = "SNIP",
					luasnip = "SNIP",
					buffer = "BUFF",
					path = "PATH",
					treesitter = "TS",
				}

				item.menu = source_names[entry.source.name]
				item.kind = icons.kind[item.kind] or item.kind

				local widths = {
					abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
					menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
				}

				for key, width in pairs(widths) do
					if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
						item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
					end
				end

				return item
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "snippets" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "treesitter" },
		},
		experimental = {
			ghost_text = vim.g.ai_cmp and {
				hl_group = "CmpGhostText",
			} or false,
		},
		sorting = defaults.sorting,
	}

	require("cmp").setup(opts)
end

local opts = {}

return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			{
				"garymjr/nvim-snippets",
				opts = {
					friendly_snippets = true,
				},
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = cmp_config,
	},
}
