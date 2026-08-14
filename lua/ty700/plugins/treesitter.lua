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

		-- Swift highlight-query override: nvim-treesitter's bundled
		-- queries/swift/highlights.scm is stale against tree-sitter-swift
		-- 0.7.3+ (references fused tokens like "#available" that the grammar
		-- split into a hidden `#` + bare word years ago), which throws a hard
		-- query-compile error and kills Swift highlighting entirely.
		-- File-based override via after/queries/ doesn't work here --
		-- query.get_files() stops at the first non-"extends" file it finds,
		-- so the broken bundled file wins regardless. vim.treesitter.query.set()
		-- registers the corrected query directly and takes priority over file
		-- discovery. See after/queries/swift/highlights.scm for the patched
		-- query itself and the full explanation.
		local swift_hl_override = vim.fn.stdpath("config") .. "/after/queries/swift/highlights.scm"
		local f = io.open(swift_hl_override, "r")
		if f then
			local content = f:read("*a")
			f:close()
			vim.treesitter.query.set("swift", "highlights", content)
		end
	end,
}
