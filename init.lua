vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.cmd("highlight LineNr guifg=#00ffff")
-- hightligh after yank
vim.api.nvim_set_hl(0, "YankHighlight", { fg = "#ffffff", bg = "#FFA500", bold = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 500 })
	end,
})

-- Load plugin system
require("plugins")
require("keymaps")
-- Load  snippets
require("luasnip").config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load() -- optional
