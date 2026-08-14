return {
	"rmagatti/goto-preview",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("goto-preview").setup({
			width = 180,
			height = 30,
			border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
			default_mappings = true, -- Enable default mappings
			opacity = nil,
			resizing_mappings = false,
			post_open_hook = function(buf, win)
				vim.keymap.set("n", "<CR>", function()
					require("goto-preview").goto_preview_definition()
					require("goto-preview").close_all_win()
				end, { buffer = buf })
			end,
			references = {
				telescope = require("telescope.builtin").lsp_references,
			},
			focus_on_open = true, -- Auto-focus the preview window
			dismiss_on_move = false, -- Don't close when cursor moves
			force_close = true,
			bufhidden = "wipe",
		})
	end,
}
