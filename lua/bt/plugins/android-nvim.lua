if not vim.g.android_nvim then
	return {}
end

return {
	{
		{
			"ariedov/android-nvim",
			config = function()
				require("android-nvim").setup()
			end,
		},
	},
}
