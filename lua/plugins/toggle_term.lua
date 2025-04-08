return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float", -- or "vertical" / "float"
				size = 15,
				open_mapping = [[<leader>t]],
				shade_terminals = true,
				start_in_insert = true,
				persist_mode = false,
			})
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*toggleterm#*",
				callback = function()
					vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
				end,
			})
		end,
	},
}
