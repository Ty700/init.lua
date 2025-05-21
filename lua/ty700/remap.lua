vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Exit file to netrw ]]--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- [[ Moves whatever is highlighted up/down ]]--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- [[ rlsp -> Restart LSP  ]] --
vim.keymap.set("n", "<leader>rlsp", "<cmd>LspRestart<cr>")

-- [[ Moves whatever is on the line under, to the end of top line ]]--
vim.keymap.set("n", "J", "mzJ`z")

-- [[ Half page jumps but cursor stays in middle ]]--
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--[[ Paste without overwriting reg contents ]]--
vim.keymap.set("x", "<leader>p", "\"_dP")

--[[ Copy to system clipboard or reg ]]--
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y")

--[[ Copy all page contents to system clipboard ]]--
vim.keymap.set({"n", "v"}, "<C-S-Y>", function() 
	vim.cmd(':%y+')
end)

--[[ Too lazy to press esc ]]--
vim.keymap.set("i", "<C-c>", "<Esc>")

--[[ Delete without replacing reg contents ]]--
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

--[[ Inline replace macro ]]--
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
