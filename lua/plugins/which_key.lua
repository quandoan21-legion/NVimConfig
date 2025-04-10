return {
	{
		"folke/which-key.nvim",
		lazy = true, -- You can change it to `false` if you want it to load immediately
		config = function()
			require("which-key").setup({
				-- Your config options go here, if any
			})
		end,
	},
}
