return {
	-- Tokyo Night
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = false,
				style = "night", -- options: night, storm, moon, day
			})
			vim.cmd("colorscheme tokyonight-night")
		end,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = false, -- Disable transparency
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
				transparent_background = false, -- Disable transparency
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
				style = "darker", -- options: dark, darker, cool, deep, warm, warmer, light
				transparent = false, -- Disable transparency
			})
		end,
	},

	-- Everforest
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard" -- or "medium", "soft"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_transparent_background = 0 -- Disable transparency
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
				disable_background = false, -- Keep the background non-transparent
			})
		end,
	},

	-- Nord
	{
		"arcticicestudio/nord-vim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme nord")
		end,
	},

	-- Ayu
	{
		"Shatur/neovim-ayu",
		lazy = true,
		config = function()
			vim.cmd("colorscheme ayu-dark")
		end,
	},

	-- Dracula
	{
		"dracula/vim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	},

	-- Solarized
	{
		"altercation/vim-colors-solarized",
		lazy = true,
		config = function()
			vim.cmd("colorscheme solarized")
		end,
	},

	-- Nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		config = function()
			require("nightfox").setup({
				transparent = false,
			})
			vim.cmd("colorscheme nightfox")
		end,
	},

	-- Github
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		config = function()
			require("github-theme").setup({
				transparent = false,
			})
			vim.cmd("colorscheme github_dark")
		end,
	},

	-- Monokai
	{
		"tanvirtin/monokai.nvim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme monokai")
		end,
	},

	-- Material
	{
		"marko-cerovac/material.nvim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme material")
		end,
	},

	-- PaperColor
	{
		"NLKNguyen/papercolor-theme",
		lazy = true,
		config = function()
			vim.cmd("colorscheme PaperColor")
		end,
	},

	-- Palenight
	{
		"drewtempelmeyer/palenight.vim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme palenight")
		end,
	},

	-- Tokyo Night Storm
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				transparent = false,
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
			vim.cmd("colorscheme iceberg")
		end,
	},

	-- Zenburn
	{
		"jnurmine/Zenburn",
		lazy = true,
		config = function()
			vim.cmd("colorscheme zenburn")
		end,
	},

	-- Lightline (for a clean, light theme)
	{
		"itchyny/lightline.vim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme lightline")
		end,
	},

	-- Deep Ocean
	{
		"morhetz/gruvbox",
		lazy = true,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},

	-- Dracula Dark
	{
		"dracula/vim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	},

	-- Warm colorscheme
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	},
}
