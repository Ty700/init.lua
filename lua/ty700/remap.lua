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

-- GitHub Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Optional: Cycle through suggestions
vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-dismiss)')

-- Git commands
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gl', ':Flog<CR>', { desc = 'Git log graph' })
vim.keymap.set('n', '<leader>gL', ':Flog -all<CR>', { desc = 'Git log all branches' })
vim.keymap.set('n', '<leader>gf', ':Flog -path=%<CR>', { desc = 'File history' })

vim.keymap.set('n', 'gp', require('goto-preview').goto_preview_definition, opts)
vim.keymap.set('n', 'gP', require('goto-preview').close_all_win, opts)

-- Split management
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close split' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal splits' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Open corresponding header/source file in split
vim.keymap.set('n', '<leader>oh', function()
  local ext = vim.fn.expand('%:e')
  local base = vim.fn.expand('%:t:r')
  
  local target_ext
  if ext == 'cpp' then
    target_ext = 'h'
  elseif ext == 'h' then
    target_ext = 'cpp'
  else
    vim.notify('Not a .cpp or .h file', vim.log.levels.WARN)
    return
  end
  
  local search_term = base .. '.' .. target_ext
  
  -- Find the file
  local project_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    project_root = vim.fn.getcwd()
  end
  
  local find_cmd = string.format("find %s -name '%s' -type f 2>/dev/null",
    vim.fn.shellescape(project_root),
    search_term)
  
  local results = vim.fn.systemlist(find_cmd)
  
  if #results == 1 then
    -- Found it, open in vertical split
    vim.cmd('vsplit ' .. results[1])
  elseif #results > 1 then
    vim.notify('Multiple matches found', vim.log.levels.WARN)
  else
    vim.notify(search_term .. ' not found', vim.log.levels.WARN)
  end
end, { desc = 'Open header/source in split' })
