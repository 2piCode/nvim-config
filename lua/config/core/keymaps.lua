vim.g.mapleader = " "

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("n", "d", '"_d', { desc = "delete without yank" })
-- map("n", "dd", '"_dd', { desc = "delete without yank" })
-- map("n", "D", '"_D', { desc = "delete without yank" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })

map("n", "<leader>rl", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- -- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
map("n", "+", "<C-w>>", { desc = "Increase current window width" })
map("n", "_", "<C-w><", { desc = "Decrease current window width" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
