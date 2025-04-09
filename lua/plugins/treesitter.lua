return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua",
				"python",
				"javascript",
				"html",
				"css",
				"bash",
				"json",
				"xml",
				"markdown",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true }, -- if using JSX/HTML, etc.
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
