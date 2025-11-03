-- Git blame and more
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Git blame line" },
    { "<leader>gB", "<cmd>Gitsigns blame<CR>", desc = "Git blame buffer" },
    { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
  },
}
