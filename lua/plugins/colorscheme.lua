return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true, -- ✅ This is the correct key
				style = "night", -- or "storm", "moon", "day"
			})
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
}
