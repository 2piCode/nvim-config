-- Formatting
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>ff",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- Choose formatters per filetype
    formatters_by_ft = {
      cpp = { "clang-format" }, -- C/C++
      rust = { "rustfmt", lsp_format = "fallback" },
      lua = { "stylua" },
      ["_"] = { "trim_whitespace" }, -- default for others
    },
  },
}
