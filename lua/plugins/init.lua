return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  { "eandrju/cellular-automaton.nvim" },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = true },
      input = {
        enabled = true,
      },
      quickfile = { enabled = true },
      notifier = { enabled = true },
      statuscolumn = { enabled = true },
    },
  },

  {
    "echasnovski/mini.nvim",
    config = function()
      require "configs.mini"
    end,
  },

  {
    "echasnovski/mini.sessions",
    opts = {
      autoread = true,
      autowrite = false,
      directory = vim.fn.stdpath "data" .. "/session/",
      force = { read = false, write = true, delete = true },
    },
    config = function(_, opts)
      require("mini.sessions").setup(opts)
      vim.api.nvim_create_autocmd("VimLeavePre", {
        desc = "Auto-save session named by current folder",
        callback = function()
          local sess_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          require("mini.sessions").write(sess_name)
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
  },

  {
    "sindrets/diffview.nvim",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.vim" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },

  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "nvchad.configs.cmp"
    end,
  },

  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "jonarrien/telescope-cmdline.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "nvchad.configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
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
        "<leader>lh",
        function()
          require("harpoon").logger:show()
        end,
        desc = "shows harpoon logger",
      },
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
          require("harpoon.mark").add_file()
        end,
        desc = "Add current buffer to Harpoon",
      },
      {
        "<leader>z",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle Harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Go to Harpoon file #1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Go to Harpoon file #2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Go to Harpoon file #3",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Go to Harpoon file #4",
      },
      {
        "<leader>5",
        function()
          require("harpoon.ui").nav_file(5)
        end,
        desc = "Go to Harpoon file #5",
      },
      {
        "<leader>6",
        function()
          require("harpoon.ui").nav_file(6)
        end,
        desc = "Go to Harpoon file #6",
      },
      {
        "<leader>7",
        function()
          require("harpoon.ui").nav_file(7)
        end,
        desc = "Go to Harpoon file #7",
      },
      {
        "<leader>8",
        function()
          require("harpoon.ui").nav_file(8)
        end,
        desc = "Go to Harpoon file #8",
      },
      {
        "<leader>9",
        function()
          require("harpoon.ui").nav_file(9)
        end,
        desc = "Go to Harpoon file #9",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },

      -- Document existing key chains
      spec = {
        { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
        { "<leader>d", group = "[D]iagnostic" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>f", group = "[F]ind" },
        { "<leader>g", group = "[G]it" },
        { "<leader>s", group = "[S]essions" },
        { "<leader>w", group = "[W]orkspace" },
      },
    },
  },
}
