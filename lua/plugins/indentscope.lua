return {
	{
		"echasnovski/mini.indentscope",
		version = false, -- always use latest
		event = "BufReadPre",
		config = function()
			require("mini.indentscope").setup({
				symbol = "┆", -- You can also use "┆", "⎸", or "▏"
				options = { try_as_border = true },
				draw = {
					-- animation = require("mini.indentscope").gen_animation.grow(),
					-- You can use .slide() or .grow() for animated lines
					animation = require("mini.indentscope").gen_animation.cubic({
						unit = "total",
						easing = "out",
						duration = 85,
					}),
					delay = 15,
				},
			})
		end,
	},
}
