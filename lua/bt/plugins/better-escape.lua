if false then return {} end

local function better_escape_config()
	require("better_escape").setup()
end

return {
  "max397574/better-escape.nvim",
  config = better_escape_config
}
