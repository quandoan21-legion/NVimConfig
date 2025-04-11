return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			lsp_fallback = true, -- Use LSP formatter if available
			timeout_ms = 500,
		},
		-- Optional: specify formatters per filetype
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			scss = { "prettier" },
			css = { "prettier" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
			},
			xmlformatter = {
				prepend_args = { "--indent", "4" }, -- this sets 4-space indent
			},
		},
	},
}
