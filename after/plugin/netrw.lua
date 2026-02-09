-- Make directories more visible
vim.cmd([[
  highlight Directory guifg=#89ddff ctermfg=cyan gui=bold
  highlight netrwDir guifg=#89ddff ctermfg=cyan gui=bold
]])

-- Optional: cleaner netrw settings
vim.g.netrw_banner = 0        -- Hide banner
vim.g.netrw_liststyle = 3     -- Tree view
vim.g.netrw_browse_split = 0  -- Open in same window
vim.g.netrw_winsize = 25      -- Width percentage
