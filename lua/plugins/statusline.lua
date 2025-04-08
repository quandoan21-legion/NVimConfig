return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- for icons
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto", -- or set to your colorscheme like 'tokyonight'
					section_separators = "", -- you can try "" and ""
					component_separators = "", -- or "" and ""
					globalstatus = true, -- enable if you want a single statusline
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } }, -- 0 = just filename, 1 = relative, 2 = absolute
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
