-- Find functions and more
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    local trouble = require "trouble"
    local trouble_telescope = require "trouble.sources.telescope"

    telescope.setup {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-o>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = function(bufnr)
              actions.smart_send_to_qflist(bufnr)
              trouble.open "qflist"
            end,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      pickers = {},
      extensions = {
        fzf = {},
      },
    }

    telescope.load_extension "fzf"

    -- Setup multigrep
    local multigrep = require "config.plugins.telescope.multigrep"
    multigrep.setup()

    -- set keymaps
    local keymap = vim.keymap.set

    keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
    keymap("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in current buffer" })
  end,
}
