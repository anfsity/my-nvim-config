require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua配置
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

-- C++配置（修正后的clangd配置）
require("lspconfig").clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
    "--query-driver=/usr/bin/g++"  -- 指定使用g++作为编译器
  },
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
  single_file_support = true,
  root_dir = function()
    return vim.loop.cwd()
  end
}
