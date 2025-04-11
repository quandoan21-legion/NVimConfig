local themes = {
	tokyo_night = { "tokyonight", { "night", "storm", "moon", "day" } },
	catppuccin = { "catppuccin", { "latte", "frappe", "macchiato", "mocha" } },
	rose_pine = { "rose-pine", { "main", "moon", "dawn" } },

	-- Built-in and misc themes (added as "default" variants)
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

local function apply_theme(theme, variant)
	if theme == "builtin" then
		vim.cmd("colorscheme " .. variant)
		-- Apply transparency to default/built-in themes
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		return
	end

	local ok, plugin = pcall(require, theme)
	if not ok then
		return
	end

	if theme == "tokyonight" then
		plugin.setup({
			style = variant,
			transparent = true,
		})
		vim.cmd("colorscheme " .. theme .. "-" .. variant)
	elseif theme == "catppuccin" then
		plugin.setup({
			flavour = variant,
			transparent_background = true,
		})
		vim.cmd("colorscheme catppuccin")
	elseif theme == "rose-pine" then
		plugin.setup({
			variant = variant,
			disable_background = true,
		})
		vim.cmd("colorscheme rose-pine")
	end
end

local function switch_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local theme_choices = {}

	for theme_name, data in pairs(themes) do
		local base_theme = data[1]
		local variants = data[2]
		for _, variant in ipairs(variants) do
			table.insert(theme_choices, {
				value = base_theme .. "-" .. variant,
				display = base_theme .. " (" .. variant .. ")",
				ordinal = base_theme .. "-" .. variant,
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
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				local preview = function()
					local entry = action_state.get_selected_entry()
					if entry and entry.value then
						local theme, variant = entry.value:match("([%w-]+)-([%w-]+)")
						if theme and variant then
							apply_theme(theme, variant)
						end
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
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local theme, variant = selection.value:match("([%w-]+)-([%w-]+)")
					if theme and variant then
						apply_theme(theme, variant)
					end
				end)

				return true
			end,
		})
		:find()
end

-- Keymap to launch theme switcher
vim.keymap.set("n", "<leader>tt", switch_theme, { desc = "Switch Colorscheme" })
