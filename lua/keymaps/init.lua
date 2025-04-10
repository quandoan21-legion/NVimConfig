local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")

-- 🔁 Buffer navigation keymaps
map("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
-- Keymaps like Kickstart.nvim

map("n", "<leader>?", function()
	builtin.oldfiles({ hidden = true })
end, { desc = "[?] Find recently opened files" })

map("n", "<leader><space>", function()
	builtin.buffers({ hidden = true })
end, { desc = "[ ] Find existing buffers" })

map("n", "<leader>sf", function()
	builtin.find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })

map("n", "<leader>sh", function()
	builtin.help_tags({ hidden = true })
end, { desc = "[S]earch [H]elp" })

map("n", "<leader>sw", function()
	builtin.grep_string({ hidden = true })
end, { desc = "[S]earch current [W]ord" })

map("n", "<leader>sg", function()
	builtin.live_grep({ hidden = true })
end, { desc = "[S]earch by [G]rep" })

map("n", "<leader>sd", function()
	builtin.diagnostics({ hidden = true })
end, { desc = "[S]earch [D]iagnostics" })

map("n", "<leader>sr", function()
	builtin.resume({ hidden = true })
end, { desc = "[S]earch [R]esume" })

-- NvimTree Keybindings
map("n", "\\", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- add sync the yank buffer and computer clipboard
map({ "n", "v" }, "y", '"+y', { noremap = true })
map({ "n", "v" }, "p", '"+p', { noremap = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Close buffer
map("n", "<leader>x", "<cmd>bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })
-- Normal mode for terminal
map("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
-- Move current line down with J
vim.api.nvim_set_keymap("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })

-- Move current line up with K
vim.api.nvim_set_keymap("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })

-- git sign Keybindings
map("n", "]c", require("gitsigns").next_hunk, { desc = "Next hunk" })
map("n", "[c", require("gitsigns").prev_hunk, { desc = "Prev hunk" })
map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
