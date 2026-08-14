-- Re-enabled: this was previously disabled (renamed to treesitter.lua.bak) and
-- also out of sync with the old packer_compiled.lua, so it wasn't loading at all.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c", "cpp", "python", "ruby", "make", "cmake", "bash", "lua",
				"javascript", "html", "css", "vim", "vimdoc", "query", "markdown",
				"markdown_inline", "swift", "json", "yaml", "toml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
