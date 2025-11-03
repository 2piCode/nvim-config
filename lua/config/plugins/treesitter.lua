-- Syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    -- configure treesitter
    treesitter.setup { -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "c",
        "lua",
        "markdown",
        "vim",
        "vimdoc",
        "json",
        "yaml",
        "cmake",
        "cpp",
        "make",
        "ninja",
        "dockerfile",
        "gitignore",
      },
    }

    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
  end,
}
