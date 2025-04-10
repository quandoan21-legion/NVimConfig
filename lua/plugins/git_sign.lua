return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "*" },
				untracked = { text = "?" },
			},
			signcolumn = true, -- Show signs in the sign column
			numhl = false, -- Set to true to highlight line numbers
			linehl = false, -- Set to true to highlight whole lines
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		})
	end,
}
