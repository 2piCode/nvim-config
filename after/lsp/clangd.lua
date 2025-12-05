-- Настройка highlighting для clangd
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  capabilities = {
    textDocument = {
      semanticTokens = {
        dynamicRegistration = true,
        tokenTypes = {
          "namespace",
          "type",
          "class",
          "enum",
          "interface",
          "struct",
          "typeParameter",
          "parameter",
          "variable",
          "property",
          "enumMember",
          "event",
          "function",
          "method",
          "macro",
          "keyword",
          "modifier",
          "comment",
          "string",
          "number",
          "regexp",
          "operator",
        },
        tokenModifiers = {
          "declaration",
          "definition",
          "readonly",
          "static",
          "deprecated",
          "abstract",
          "async",
          "modification",
          "documentation",
          "defaultLibrary",
        },
        formats = { "relative" },
        requests = {
          range = true,
          full = {
            delta = true,
          },
        },
      },
    },
  },
}

-- Hotkey для переключения между header и source файлами
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "clangd" then
      vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<CR>", {
        buffer = args.buf,
        desc = "Switch between source and header",
      })
    end
  end,
})

return {}
