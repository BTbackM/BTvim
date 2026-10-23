if not vim.g.nvim_autopairs then
	return {}
end

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
}
