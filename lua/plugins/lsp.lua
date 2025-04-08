return { -- Mason for LSP/DAP/formatter installer
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	-- Mason to LSP bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"lua_ls",
					"ts_ls",
					"lemminx",
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- 🧠 Add cmp-nvim-lsp capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 🐍 Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- 🟨 JavaScript / TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					-- 👇 Set tab width to 4 spaces
					vim.bo[bufnr].tabstop = 4
					vim.bo[bufnr].shiftwidth = 4
					vim.bo[bufnr].softtabstop = 4
					vim.bo[bufnr].expandtab = true
				end,
			})
			-- 📄 XML
			lspconfig.lemminx.setup({
				capabilities = capabilities,
			})
			-- 🌙 Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Avoid "undefined global 'vim'"
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "4",
							},
						},
					},
				},
				on_attach = function(_, bufnr)
					vim.bo[bufnr].tabstop = 4
					vim.bo[bufnr].shiftwidth = 4
					vim.bo[bufnr].softtabstop = 4
					vim.bo[bufnr].expandtab = true
				end,
			})
		end,
	},
}
