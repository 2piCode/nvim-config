return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "clangd",
        -- "clang-format",
        -- "codelldb",
        -- "cppcheck",
        "rust_analyzer",
        "cmake",
        "basedpyright", -- Python LSP
      },
      -- automatically setup LSP servers installed via mason
      handlers = {
        -- default handler - auto-setup for all servers
        function(server_name)
          -- Skip these servers - they should not run as LSP
          if server_name == "ruff" then
            return -- ruff is used via conform.nvim and nvim-lint, not as LSP
          end
          if server_name == "pylsp" then
            return -- we use basedpyright instead
          end
          require("lspconfig")[server_name].setup {}
        end,
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "ruff", -- python formatter and linter
        "eslint_d",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
