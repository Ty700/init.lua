return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"html",
					"cssls",
					"ts_ls",
					"jdtls",
					"pyright",
					"lua_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Default capabilities for every server (nvim-cmp completion support)
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- Per-server overrides
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
				init_options = {
					fallbackFlags = { "-std=c++17" },
				},
			})

			-- Swift -- not mason-managed, ships with Xcode/Swift toolchain
			vim.lsp.config("sourcekit", {
				cmd = { "xcrun", "sourcekit-lsp" },
				filetypes = { "swift", "objective-c", "objective-cpp" },
			})

			vim.lsp.enable({
				"clangd",
				"html",
				"cssls",
				"ts_ls",
				"jdtls",
				"pyright",
				"lua_ls",
				"sourcekit",
			})
		end,
	},
}
