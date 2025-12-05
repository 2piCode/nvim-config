-- Scope line visualization
return {
  "nvim-mini/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
        require("mini.indentscope").setup()
  end,
}
