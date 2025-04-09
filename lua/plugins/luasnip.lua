return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp",
	config = function()
		require("luasnip").filetype_extend("javascript", { "js" })
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
	end,
}
