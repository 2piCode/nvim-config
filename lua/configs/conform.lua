local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
  },

  format_on_save = { enabled = false },
}

require("conform").setup(options)
