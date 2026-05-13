-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd", "html", "cssls", "ts_ls",
    "jdtls", "pyright", "lua_ls"
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set defaults that apply to all servers
vim.lsp.config('*', { capabilities = capabilities })

-- C/C++
vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
  init_options = { fallbackFlags = { '-std=c++17' } },
})

-- HTML / CSS / TS / Java / Python / Lua: no extra config needed

-- Swift
vim.lsp.config('sourcekit', {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift', 'objective-c', 'objective-cpp' },
})

-- Enable them all
vim.lsp.enable({
  'clangd', 'html', 'cssls', 'ts_ls',
  'jdtls', 'pyright', 'lua_ls', 'sourcekit'
})
