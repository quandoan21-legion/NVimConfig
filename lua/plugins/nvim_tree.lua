return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Disable netrw (conflicts with nvim-tree)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- Setup nvim-tree
			require("nvim-tree").setup({
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
			})

			-- 👇 Auto close nvim-tree before exit (for clean :wq behavior)
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					local ok, api = pcall(require, "nvim-tree.api")
					if ok then
						api.tree.close()
					end
				end,
			})
		end,
	},
}
