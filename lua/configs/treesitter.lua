pcall(function()
    dotfile(vim.g.base46_cache .. "syntax")
    dotfile(vim.g.base46_cache .. "treesitter")
)

local options = {
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
    "c_sharp",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true},
}

require("nvim-treesitter.configs").setup(options)
