return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPost",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		},
	},
}

-- return {
-- 	{
-- 		"echasnovski/mini.indentscope",
-- 		version = false,
-- 		event = "BufReadPre",
-- 		config = function()
-- 			local indentscope = require("mini.indentscope")
--
-- 			indentscope.setup({
-- 				symbol = "│",
-- 				options = { try_as_border = true },
-- 				draw = {
-- 					animation = indentscope.gen_animation.cubic({
-- 						unit = "step",
-- 						easing = "in-out",
-- 						duration = 20,
-- 					}),
-- 					-- delay = 5,
-- 				},
-- 			})
--
-- 			-- Match indent lines with rainbow-delimiters colors
-- 			local rainbow_colors = {
-- 				"RainbowDelimiterRed",
-- 				"RainbowDelimiterYellow",
-- 				"RainbowDelimiterBlue",
-- 				"RainbowDelimiterOrange",
-- 				"RainbowDelimiterGreen",
-- 				"RainbowDelimiterViolet",
-- 				"RainbowDelimiterCyan",
-- 			}
--
-- 			for i, group in ipairs(rainbow_colors) do
-- 				vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol" .. i, { link = group })
-- 			end
-- 		end,
-- 	},
-- }
