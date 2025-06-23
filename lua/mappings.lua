require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "d", '"_d', { desc = "delete without yank" })
map("n", "dd", '"_dd', { desc = "delete without yank" })
map("n", "D", '"_D', { desc = "delete without yank" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-H>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-L>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-J>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-K>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-H>", "<cmd> TmuxNavigateLeft<CR>", { desc = "switch window left" })
map("n", "<C-L>", "<cmd> TmuxNavigateRight<CR>", { desc = "switch window right" })
map("n", "<C-J>", "<cmd> TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-K>", "<cmd> TmuxNavigateUp<CR>", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fs", require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "find buffers" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "find in current buffer" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "pick hidden term" })
map("n", "<leader>fe", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "lsp document symbols" })
map("n", ":", "<cmd>Telescope cmdline<CR>", { desc = "command line" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>o", function()
  require("nvchad.term").new { pos = "float" }
end, { desc = "terminal new floating term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })

-- copilot
map("i", "<C-E>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true, replace_keycodes = false })
map("i", "<C-]>", "<Plug>(copilot-next)")

-- codeium
map("i", "<C-e>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini
map("n", "<leader>ss", function()
  local cwd_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  require("mini.sessions").write(cwd_name)
  print("Сессия сохранена как: " .. cwd_name)
end, { desc = "Сохранить сессию (по папке)" })

map("n", "<leader>sl", function()
  local name = vim.fn.input "Имя сессии для загрузки: "
  if name ~= "" then
    require("mini.sessions").read(name)
  end
end, { desc = "Загрузить сессию" })

map("n", "<leader>sd", function()
  local name = vim.fn.input "Имя сессии для удаления: "
  if name ~= "" then
    require("mini.sessions").delete(name)
    print("Deleted session: " .. name)
  end
end, { desc = "Удалить сессию" })

map("n", "<leader>sf", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "data" .. "/session/",
    prompt_title = "Выбрать сессию",
  }
end, { desc = "Выбрать сессию" })

-- header/source
map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
