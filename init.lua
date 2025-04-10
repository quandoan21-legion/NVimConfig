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
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each indent
vim.opt.expandtab = true -- Convert tabs to spaces

-- Highlight yanked text with the "IncSearch" highlight group for 200ms
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
  augroup END
]],
	false
)

-- Reapply yank highlight after changing color scheme
vim.api.nvim_exec(
	[[
  augroup HighlightOnColorschemeChange
    autocmd!
    autocmd ColorScheme * lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
  augroup END
]],
	false
)

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

-- custom theme switcher
require("user.theme_switcher")
