local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.lazyvim" },
	{ import = "plugins.luasnip" },
	{ import = "plugins.nvim_tree" },
	{ import = "plugins.telescope" },
	{ import = "plugins.autotag" },
	{ import = "plugins.git_sign" },
	{ import = "plugins.git_blame" },
	{ import = "plugins.which_key" },
	{ import = "plugins.omnisharp" },
	-- { import = "plugins.emmet" },
	{ import = "plugins.lsp" },
	{ import = "plugins.devicons" },
	{ import = "plugins.cmp" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.playground" },
	{ import = "plugins.conform" },
	{ import = "plugins.autosave" },
	{ import = "plugins.undotree" },
	-- { import = "plugins.bufferline" },
	{ import = "plugins.alpha" },
	{ import = "plugins.colorscheme" },
	{ import = "plugins.statusline" },
	-- { import = "plugins.avante" },
	{ import = "plugins.smear_cursor" },
	{ import = "plugins.autopairs" },
	{ import = "plugins.lazy_git" },
	{ import = "plugins.vim_surround" },
	{ import = "plugins.indentscope" },
	{ import = "plugins.toggle_term" },
	-- you can keep adding more plugin files here
})
