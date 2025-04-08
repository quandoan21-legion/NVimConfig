return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float", -- or "vertical" / "float"
				size = 15,
				shade_terminals = true,
				start_in_insert = true,
				persist_mode = false,
			})
			-- Key mapping to open the terminal with <Leader> + t in Normal mode
			vim.api.nvim_set_keymap("n", "T", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*toggleterm#*",
				callback = function()
					vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
				end,
			})
		end,
	},
}
