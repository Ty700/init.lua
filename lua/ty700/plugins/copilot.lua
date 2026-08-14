-- Keymaps for this live in remap.lua (<C-J>, <M-]>, <M-[>, <C-\>) since they
-- were already there and don't need to move. Loaded eagerly (not lazy) so
-- those keymaps always have a live copilot#Accept()/<Plug> target.
return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.g.copilot_no_tab_map = true
	end,
}
