-- Настройка clangd: команда и кодировка
-- vim.lsp.config() использует merge, не перезаписывает глобальные capabilities
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  offset_encoding = "utf-16",
})

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
