local themes = {
	-- Define themes with their variants
	tokyo_night = { "tokyonight", { "night", "storm", "moon", "day" } },
	-- gruvbox = { "gruvbox" },
	catppuccin = { "catppuccin", { "latte", "frappe", "macchiato", "mocha" } },
	-- onedark = { "onedark", { "dark", "darker", "cool", "deep", "warm", "warmer", "light" } },
	rose_pine = { "rose-pine", { "main", "moon", "dawn" } },
}

local function switch_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local last_theme = vim.g.colors_name
	local theme_choices = {}

	-- Build a table with all theme variants
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

	-- Create the Telescope picker to display themes
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
				-- Preview theme when selection changes
				local preview = function()
					local entry = action_state.get_selected_entry()
					if entry and entry.value and entry.value ~= vim.g.colors_name then
						local theme, variant = entry.value:match("([%w-]+)-([%w-]+)")
						-- Apply the selected theme and variant
						pcall(require(theme).setup, {
							style = variant,
						})
						vim.cmd("colorscheme " .. entry.value)
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

				-- Apply the theme on selection
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local theme, variant = selection.value:match("([%w-]+)-([%w-]+)")
					-- Apply the selected theme and variant
					pcall(require(theme).setup, {
						style = variant,
					})
					vim.cmd("colorscheme " .. selection.value)
				end)

				return true
			end,
		})
		:find()
end

-- Keymap to launch theme switcher
vim.keymap.set("n", "<leader>tt", switch_theme, { desc = "Switch Colorscheme" })
