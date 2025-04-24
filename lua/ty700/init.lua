require("ty700.remap")
require("ty700.set")

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

require'cmp'.setup {
	sources = {
		{ name = 'nvim_lsp' }
	}
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local augroup = vim.api.nvim_create_augroup
local Ty700 = augroup('Ty700', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank',{})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

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
