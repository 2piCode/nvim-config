-- Highlight trailing whitespace
return {
  "nvim-mini/mini.trailspace",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mini.trailspace").setup()
  end,
}
