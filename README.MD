# Neovim Keybindings Reference

**Leader Key:** `Space`

---

## 📂 File & Project Navigation

### File Explorer (nvim-tree)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>pv` | Toggle nvim-tree | Open/close file explorer |
| `<Ctrl-n>` | Focus nvim-tree | Jump to file explorer window |

**Inside nvim-tree:**
- `Enter` - Open file or expand/collapse folder
- `o` - Open file in last window
- `a` - Create new file/folder (end with `/` for folder)
- `d` - Delete file/folder
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path
- `gy` - Copy absolute path
- `R` - Refresh tree
- `H` - Toggle hidden files
- `g?` - Show help

### Telescope (Fuzzy Finder)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>pf` | Find files | Search for files by name |
| `<leader>ps` | Grep search | Search for text in files (prompts for input) |
| `<leader>gf` | Git files | Search only Git-tracked files |
| `<leader>gc` | Git commits | Browse commit history |
| `<leader>gb` | Git branches | Switch Git branches |

**Inside Telescope:**
- `Ctrl-n` / `Ctrl-p` - Next/previous item
- `Ctrl-j` / `Ctrl-k` - Next/previous item (alternative)
- `Enter` - Select item
- `Esc` / `Ctrl-c` - Close Telescope
- `Ctrl-x` - Open in horizontal split
- `Ctrl-v` - Open in vertical split
- `Ctrl-t` - Open in new tab
- `Ctrl-u` - Scroll preview up
- `Ctrl-d` - Scroll preview down

### Smart File Switching
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>oh` | Open header/source | Find and open corresponding .h/.cpp file in vertical split |

---

## 📑 Buffer Management

### Buffer Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Tab>` | Next buffer | Cycle to next open buffer |
| `<Shift-Tab>` | Previous buffer | Cycle to previous open buffer |
| `<leader>x` | Close buffer | Close current buffer |
| `<leader>bp` | Buffer pick | Show letters on buffers to jump directly |
| `<leader>1-9` | Jump to buffer 1-9 | Go to specific buffer by number |

---

## 🪟 Window Management

### Window Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Ctrl-h>` | Move left | Focus window to the left |
| `<Ctrl-j>` | Move down | Focus window below |
| `<Ctrl-k>` | Move up | Focus window above |
| `<Ctrl-l>` | Move right | Focus window to the right |

### Window Splits
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>sv` | Vertical split | Split window vertically |
| `<leader>sh` | Horizontal split | Split window horizontally |
| `<leader>sx` | Close split | Close current window |
| `<leader>se` | Equal splits | Make all splits equal size |

### Window Resizing
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Ctrl-Up>` | Increase height | Make window taller |
| `<Ctrl-Down>` | Decrease height | Make window shorter |
| `<Ctrl-Left>` | Decrease width | Make window narrower |
| `<Ctrl-Right>` | Increase width | Make window wider |

---

## 🔧 LSP (Language Server Protocol)

### Code Navigation
| Keybinding | Action | Description |
|------------|--------|-------------|
| `gd` | Go to definition | Jump to where symbol is defined |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gi` | Go to implementation | Jump to implementation |
| `gr` | Find references | List all references to symbol |
| `gt` | Go to type definition | Jump to type definition |

### Documentation & Help
| Keybinding | Action | Description |
|------------|--------|-------------|
| `K` | Hover documentation | Show documentation for symbol under cursor |
| `<Ctrl-k>` | Signature help | Show function signature |

### Code Actions
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>rn` | Rename symbol | Rename symbol across project |
| `<leader>ca` | Code actions | Show available code actions |
| `<leader>f` | Format buffer | Format entire file |
| `<leader>rlsp` | Restart LSP | Restart language server |

### Diagnostics (Errors & Warnings)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `[d` | Previous diagnostic | Jump to previous error/warning |
| `]d` | Next diagnostic | Jump to next error/warning |
| `<leader>e` | Show diagnostic | Show error/warning details in float |
| `<leader>q` | Diagnostic list | Show all diagnostics in quickfix list |

---

## 🔀 Git Integration

### Git Status & Commands (Fugitive)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>gs` | Git status | Open Git status window (Fugitive) |

**Inside Fugitive Status:**
- `s` - Stage file/hunk
- `u` - Unstage file/hunk
- `=` - Toggle inline diff
- `cc` - Commit
- `ca` - Amend commit
- `dd` - Diff file
- `dv` - Vertical diff
- `X` - Discard changes

### Git Hunks (Gitsigns)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `]h` | Next hunk | Jump to next Git change |
| `[h` | Previous hunk | Jump to previous Git change |
| `<leader>hs` | Stage hunk | Stage current change |
| `<leader>hr` | Reset hunk | Discard current change |
| `<leader>hS` | Stage buffer | Stage all changes in file |
| `<leader>hR` | Reset buffer | Discard all changes in file |
| `<leader>hu` | Undo stage hunk | Undo last hunk stage |
| `<leader>hp` | Preview hunk | Show diff in popup |
| `<leader>hb` | Blame line | Show full Git blame for line |
| `<leader>tb` | Toggle blame | Toggle inline Git blame (GitLens style) |
| `<leader>hd` | Diff this | Show diff against index |
| `<leader>hD` | Diff HEAD | Show diff against HEAD |
| `<leader>td` | Toggle deleted | Show deleted lines |
| `ih` | Select hunk (visual) | Text object for Git hunk |

**Visual Mode (Gitsigns):**
- `<leader>hs` - Stage selected lines
- `<leader>hr` - Reset selected lines

---

## ✏️ Editing & Text Manipulation

### Visual Mode
| Keybinding | Action | Description |
|------------|--------|-------------|
| `J` | Move lines down | Move selected lines down |
| `K` | Move lines up | Move selected lines up |
| `<leader>p` | Paste (no overwrite) | Paste without overwriting clipboard |
| `<leader>y` | Copy to clipboard | Copy to system clipboard |

### Normal Mode
| Keybinding | Action | Description |
|------------|--------|-------------|
| `J` | Join lines | Join line below to current line |
| `<Ctrl-d>` | Half page down | Scroll down (cursor centered) |
| `<Ctrl-u>` | Half page up | Scroll up (cursor centered) |
| `n` | Next search | Jump to next search match (centered) |
| `N` | Previous search | Jump to previous search match (centered) |

### Copy/Paste/Delete
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>y` | Yank to clipboard | Copy to system clipboard |
| `<leader>Y` | Yank line to clipboard | Copy entire line to system clipboard |
| `<Ctrl-Shift-Y>` | Copy all | Copy entire file to system clipboard |
| `<leader>p` | Paste (visual) | Paste without replacing clipboard |
| `<leader>d` | Delete (no yank) | Delete without copying to clipboard |

### Find & Replace
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>s` | Find & replace | Replace word under cursor (inline) |

---

## 🤖 Autocompletion (Insert Mode)

### nvim-cmp
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Ctrl-Space>` | Trigger completion | Manually trigger completion menu |
| `<Ctrl-e>` | Abort | Close completion menu |
| `<Enter>` | Confirm | Accept selected completion |
| `<Tab>` | Next item | Select next completion |
| `<Shift-Tab>` | Previous item | Select previous completion |
| `<Ctrl-b>` | Scroll docs up | Scroll documentation window up |
| `<Ctrl-f>` | Scroll docs down | Scroll documentation window down |

---

## 🤖 GitHub Copilot (Insert Mode)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Ctrl-j>` | Accept suggestion | Accept Copilot suggestion |
| `<Alt-]>` | Next suggestion | Cycle to next suggestion |
| `<Alt-[>` | Previous suggestion | Cycle to previous suggestion |
| `<Ctrl-\>` | Dismiss | Dismiss Copilot suggestion |

---

## 🕐 Utilities

### Undo Tree
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>u` | Toggle undo tree | Show visual undo history |

**Inside Undotree:**
- `j/k` - Navigate undo history
- `Enter` - Restore to selected state
- `q` - Close undo tree

### General
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Ctrl-c>` | Escape (insert) | Exit insert mode (alternative to Esc) |

---

## 📝 Command Mode Shortcuts

| Command | Action | Description |
|---------|--------|-------------|
| `:w` | Write | Save file |
| `:q` | Quit | Close window |
| `:wq` | Write & quit | Save and close |
| `:qa` | Quit all | Close all windows |
| `:wa` | Write all | Save all buffers |
| `:e <file>` | Edit | Open file |
| `:vs <file>` | Vertical split | Open file in vertical split |
| `:sp <file>` | Horizontal split | Open file in horizontal split |
| `:PackerSync` | Packer sync | Install/update plugins |
| `:Mason` | Mason | Manage LSP servers |
| `:LspInfo` | LSP info | Show LSP status |
| `:LspRestart` | Restart LSP | Restart language servers |
| `:checkhealth` | Check health | Run diagnostic checks |
| `:messages` | Show messages | View message history |

---

## 🎯 Quick Reference

**Most Used:**
```
FILES:           WINDOWS:        LSP:            GIT:
<leader>pv       <C-h/j/k/l>     gd              <leader>gs
<leader>pf       <leader>sv      K               ]h / [h
<leader>oh       <Tab>/<S-Tab>   <leader>ca      <leader>hp
<leader>u                        <leader>f       <leader>tb
```

**Emergency:**
```
:w              - Save
:q              - Quit
:qa!            - Force quit all
<leader>rlsp    - Restart LSP
```

---

*Generated from nvim config - Last updated: 2026-02-08*
