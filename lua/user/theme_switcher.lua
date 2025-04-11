local themes = {
	tokyonight = { "tokyonight", { "night", "storm", "moon", "day" } },
	catppuccin = { "catppuccin", { "latte", "frappe", "macchiato", "mocha" } },
	rose_pine = { "rose-pine", { "main", "moon", "dawn" } },
	onedark = { "onedark", { "dark", "darker", "cool", "deep", "warm", "warmer", "light" } },
	vercel = { "vercel", { "default" } },
	vim_builtin = {
		"builtin",
		{
			"blue",
			"darkblue",
			"default",
			"delek",
			"desert",
			"elflord",
			"evening",
			"habamax",
			"industry",
			"koehler",
			"lunaperche",
			"morning",
			"murphy",
			"pablo",
			"peachpuff",
			"quiet",
			"retrobox",
			"ron",
			"shine",
			"slate",
			"sorbet",
			"torte",
			"vim",
			"wildcharm",
			"zaibatsu",
		},
	},
}

local function set_transparent_highlights()
	local highlights = {
		"Normal",
		"NormalNC",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"VertSplit",
	}
	for _, group in ipairs(highlights) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

local function apply_theme(theme, variant)
	if theme == "builtin" then
		vim.cmd("colorscheme " .. variant)
		set_transparent_highlights()
	else
		local ok, plugin = pcall(require, theme)
		if not ok then
			return
		end

		if theme == "tokyonight" then
			plugin.setup({ style = variant, transparent = true })
			vim.cmd("colorscheme " .. theme .. "-" .. variant)
		elseif theme == "catppuccin" then
			plugin.setup({ flavour = variant, transparent_background = true })
			vim.cmd("colorscheme catppuccin")
		elseif theme == "rose-pine" then
			plugin.setup({ variant = variant, disable_background = true })
			vim.cmd("colorscheme rose-pine")
		elseif theme == "onedark" then
			plugin.setup({ style = variant, transparent = true })
			vim.cmd("colorscheme onedark")
		elseif theme == "vercel" then
			plugin.setup({ transparent = true })
			vim.cmd("colorscheme vercel")
		end
	end

	-- Save selection
	local config_path = vim.fn.stdpath("config") .. "/lua/user_theme.lua"
	local file = io.open(config_path, "w")
	if file then
		file:write(string.format([[return { theme = "%s", variant = "%s" }]], theme, variant))
		file:close()
	end
end

local function switch_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local theme_choices = {}
	for name, data in pairs(themes) do
		local base, variants = data[1], data[2]
		for _, variant in ipairs(variants) do
			table.insert(theme_choices, {
				value = base .. "-" .. variant,
				display = base .. " (" .. variant .. ")",
				theme = base,
				variant = variant,
				ordinal = base .. "-" .. variant,
			})
		end
	end

	pickers
		.new({}, {
			prompt_title = "Switch Colorscheme",
			finder = finders.new_table({
				results = theme_choices,
				entry_maker = function(entry)
					return {
						value = entry.value,
						display = entry.display,
						ordinal = entry.ordinal,
						theme = entry.theme,
						variant = entry.variant,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				local preview = function()
					local entry = action_state.get_selected_entry()
					if entry then
						apply_theme(entry.theme, entry.variant)
					end
				end

				map("i", "<C-n>", function()
					actions.move_selection_next(prompt_bufnr)
					preview()
				end)

				map("i", "<C-p>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview()
				end)

				map("n", "j", function()
					actions.move_selection_next(prompt_bufnr)
					preview()
				end)

				map("n", "k", function()
					actions.move_selection_previous(prompt_bufnr)
					preview()
				end)

				actions.select_default:replace(function()
					local entry = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					apply_theme(entry.theme, entry.variant)
				end)

				return true
			end,
		})
		:find()
end

-- Map to launch theme switcher
vim.keymap.set("n", "<leader>tt", switch_theme, { desc = "Switch Colorscheme" })

-- Load saved theme on startup
local ok, saved = pcall(require, "user_theme")
if ok and saved.theme and saved.variant then
	apply_theme(saved.theme, saved.variant)
end
