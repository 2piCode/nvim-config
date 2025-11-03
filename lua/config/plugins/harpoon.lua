-- Quick file entrance
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = {
    {
      "<leader>rh",
      function()
        require "lazy"
        vim.cmd "Lazy reload harpoon"
      end,
      desc = "reloads harpoon and its configuration via lazy",
    },
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add current buffer to Harpoon",
    },
    {
      "<leader>z",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle Harpoon quick menu",
    },
    {
      "<leader>q",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "selects the previous buffer in harpoon list",
    },
    {
      "<leader>e",
      function()
        require("harpoon"):list():next()
      end,
      desc = "selects the next buffer in harpoon list",
    },
  },
}
