return {
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("NeoSolarized").setup({
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					functions = "italic,bold",
					variables = "bold",
				},
				on_highlights = function(highlights, colors)
					highlights.Normal = { fg = colors.fg, bg = "NONE" }
				end,
			})
		end,
	},
	-- Tokyo Night
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "night",
			})
		end,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})
		end,
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},

	-- Onedark
	{
		"navarasu/onedark.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
			})
		end,
	},

	-- Everforest
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_transparent_background = 1
		end,
	},

	-- Rose Pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})
		end,
	},

	-- Nord
	{
		"arcticicestudio/nord-vim",
		lazy = true,
		config = function()
			vim.g.nord_disable_background = true
		end,
	},

	-- Ayu
	{
		"Shatur/neovim-ayu",
		lazy = true,
		config = function()
			require("ayu").setup({
				mirage = false,
				overrides = {
					Normal = { bg = "none" },
					NormalNC = { bg = "none" },
					SignColumn = { bg = "none" },
					NvimTreeNormal = { bg = "none" },
				},
			})
		end,
	},

	-- Dracula
	{
		"dracula/vim",
		lazy = true,
		config = function()
			vim.g.dracula_transparent_bg = true
		end,
	},

	-- Solarized
	{
		"altercation/vim-colors-solarized",
		lazy = true,
		config = function()
			vim.g.solarized_termtrans = 1
		end,
	},

	-- Nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},

	-- Github
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},

	-- Monokai
	{
		"tanvirtin/monokai.nvim",
		lazy = true,
		config = function() end,
	},

	-- Material
	{
		"marko-cerovac/material.nvim",
		lazy = true,
		config = function()
			require("material").setup({
				disable = {
					background = true,
				},
			})
		end,
	},

	-- PaperColor
	{
		"NLKNguyen/papercolor-theme",
		lazy = true,
		config = function() end,
	},

	-- Palenight
	{
		"drewtempelmeyer/palenight.vim",
		lazy = true,
		config = function() end,
	},

	-- Tokyo Night Storm
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "storm",
			})
			vim.cmd("colorscheme tokyonight-storm")
		end,
	},

	-- Iceberg
	{
		"cocopon/iceberg.vim",
		lazy = true,
		config = function()
			vim.g.iceberg_transparent = 1
		end,
	},

	-- Zenburn
	{
		"jnurmine/Zenburn",
		lazy = true,
		config = function()
			vim.g.zenburn_transparent = 1
		end,
	},

	-- Lightline
	{
		"itchyny/lightline.vim",
		lazy = true,
		config = function() end,
	},

	-- Deep Ocean (Gruvbox)
	{
		"morhetz/gruvbox",
		lazy = true,
		config = function()
			vim.g.gruvbox_transparent_bg = 1
		end,
	},

	-- Dracula Dark (again)
	{
		"dracula/vim",
		lazy = true,
		config = function()
			vim.g.dracula_transparent_bg = true
		end,
	},

	-- Warm Dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		config = function()
			require("dracula").setup({
				transparent_bg = true,
			})
		end,
	},
}
