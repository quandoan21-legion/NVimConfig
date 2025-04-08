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
		end,
	},
}
