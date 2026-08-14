return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		-- NOTE: slot 1 moved from <C-h> to <C-p> -- <C-h> collides with the
		-- window-left-nav keymap in remap.lua (<C-w>h), which <C-h> was silently
		-- losing to since this file loaded after remap.lua under the old setup.
		vim.keymap.set("n", "<C-p>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
	end,
}
