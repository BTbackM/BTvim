if false then
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
