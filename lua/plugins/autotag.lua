return {
	-- Other plugins ...

	-- Install nvim-ts-autotag for auto-renaming of closing tags
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			-- Ensure Treesitter is set up
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "html", "xml", "javascript", "typescript" }, -- Ensure required parsers are installed
				highlight = {
					enable = true, -- Enable Treesitter syntax highlighting
				},
				autotag = {
					enable = true, -- Enable auto-renaming of closing tags
					filetypes = { "html", "xml", "javascript", "typescript" }, -- Specify filetypes for autotag functionality
				},
			})
		end,
	},

	-- Other plugins ...
}
