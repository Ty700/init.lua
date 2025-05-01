-- LSP Configuration

-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"html",
		"cssls",
		"ts_ls",
		"jdtls",
		"pyright",
		"lua_ls"
	},
})

-- Configure LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C/C++
lspconfig.clangd.setup({
	cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
	capabilities = capabilities,
	init_options = {
		fallbackFlags = { '-std=c++17' },
	},
})

-- HTML
lspconfig.html.setup({
    capabilities = capabilities,
})

-- CSS
lspconfig.cssls.setup({
    capabilities = capabilities,
})

-- JavaScript/TypeScript
lspconfig.ts_ls.setup({
    capabilities = capabilities,
})

-- Java
lspconfig.jdtls.setup({
    capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
    capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
})

