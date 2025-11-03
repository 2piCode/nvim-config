-- Rust lsp server setup
return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- follow stable releases compatible with Neovim 0.11+
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "<C-space>", function()
            vim.cmd.RustLsp "hover actions"
          end, opts)
          vim.keymap.set("n", "<Leader>a", function()
            vim.cmd.RustLsp "codeAction"
          end, opts)
        end,
      },
    }
  end,
}
