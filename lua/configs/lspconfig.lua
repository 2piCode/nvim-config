local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "clangd",
  "cmake",
  "csharp_ls",
}

-- list of servers configured with default config.
local default_servers = { "cmake" }

local util = require "lspconfig.util"

lspconfig.clangd.setup {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  root_dir = function(fname)
    return util.root_pattern(
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac" -- AutoTools
    )(fname) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
