return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require "lualine"

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- LSP references counter component
    local function lsp_references()
      local clients = vim.lsp.get_clients { bufnr = 0 }
      if #clients == 0 then
        return ""
      end

      local params = vim.lsp.util.make_position_params()
      local result = vim.lsp.buf_request_sync(0, "textDocument/references", {
        textDocument = params.textDocument,
        position = params.position,
        context = { includeDeclaration = false },
      }, 100)

      local count = 0
      if result then
        for _, res in pairs(result) do
          if res.result then
            count = count + #res.result
          end
        end
      end

      if count > 0 then
        return string.format("󰌹 %d", count)
      end
      return ""
    end

    -- configure lualine with modified theme
    lualine.setup {
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          { lsp_references },
          { "encoding" },
          { "fileformat", symbols = { unix = "" } },
          { "filetype" },
        },
      },
    }
  end,
}
