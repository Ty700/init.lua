# Keybind Reference

Leader key is `<Space>`. Generated as part of the packer → lazy.nvim migration
(see git log). Source of truth if this ever drifts: `lua/ty700/remap.lua` and
each file under `lua/ty700/plugins/`.

## Goto-Preview (LSP peek windows)

The plugin's own defaults (enabled via `default_mappings = true` in
`lua/ty700/plugins/goto-preview.lua` — these come from the plugin itself, not
from anything written in this repo):

| Key    | Action                        |
|--------|-------------------------------|
| `gpd`  | Preview definition            |
| `gpt`  | Preview type definition       |
| `gpi`  | Preview implementation        |
| `gpD`  | Preview declaration           |
| `gpr`  | Preview references (via Telescope) |
| `gP`   | Close all preview windows     |

Extra bindings on top, defined in this repo:

| Key                          | Where              | Action |
|-------------------------------|--------------------|--------|
| `gp` (normal)                 | `remap.lua`        | Same as `gpd` — shorthand preview-definition |
| `gP` (normal)                 | `remap.lua`        | Same as the plugin default above — close all previews (harmless duplicate, both do the same thing) |
| `<CR>` (inside a preview window only) | `goto-preview.lua` `post_open_hook` | Jump into the previewed location for real, then close all preview windows — turns the peek into a real navigation |

Config details (`lua/ty700/plugins/goto-preview.lua`): window is 180x30,
custom double-line border, auto-focuses the preview window on open
(`focus_on_open = true`), does **not** close when you move the cursor
(`dismiss_on_move = false`), and force-closes + wipes the buffer when
dismissed.

## Window / Split Navigation

| Key | Action |
|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move to window left/down/up/right |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>sx` | Close split |
| `<leader>se` | Equalize split sizes |
| `<leader>pv` | Open netrw (file explorer) |

## Editing

| Key | Mode | Action |
|---|---|---|
| `J` / `K` | Visual | Move selected line(s) down/up |
| `J` | Normal | Join line below, cursor stays in place |
| `<C-d>` / `<C-u>` | Normal | Half-page down/up, cursor stays centered |
| `n` / `N` | Normal | Next/prev search result, centered |
| `<leader>p` | Visual (`x`) | Paste without overwriting the yank register |
| `<leader>d` | Normal, Visual | Delete without overwriting the yank register |
| `<leader>y` / `<leader>Y` | Normal, Visual | Yank to system clipboard |
| `<C-S-Y>` | Normal, Visual | Yank the whole buffer to system clipboard |
| `<leader>s` | Normal | Substitute macro: replace word under cursor, cursor lands mid-command for editing |
| `<leader>x` | Normal | `chmod +x` the current file |
| `<leader>oh` | Normal | Jump to the matching `.h`/`.cpp` file in a vertical split |
| `<C-c>` | Insert | Escape |

## LSP

| Key | Action |
|---|---|
| `<leader>rlsp` | Restart LSP |

Servers (`lua/ty700/plugins/lsp.lua`, via the native `vim.lsp.config`/`vim.lsp.enable`
API): clangd (C/C++), html, cssls, ts_ls, jdtls, pyright, lua_ls, sourcekit (Swift).

## Completion (insert mode, nvim-cmp)

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<Tab>` / `<S-Tab>` | Next/prev item (falls through to normal Tab if menu isn't open) |
| `<CR>` | Confirm selected item |
| `<C-e>` | Abort completion |
| `<C-b>` / `<C-f>` | Scroll docs |

## Copilot

| Key | Mode | Action |
|---|---|---|
| `<C-J>` | Insert | Accept suggestion |
| `<M-]>` / `<M-[>` | Insert | Next/previous suggestion |
| `<C-\>` | Insert | Dismiss suggestion |

## Git

| Key | Action |
|---|---|
| `<leader>gs` | `:Git` (fugitive status) |
| `<leader>gl` | `:Flog` (commit graph) |
| `<leader>gL` | `:Flog -all` (commit graph, all branches) |
| `<leader>gh` | `:Flog -path=%` (current file's history) — *moved from `<leader>gf`, see note below* |
| `<leader>gf` | Telescope `git_files` (find git-tracked files) |
| `<leader>gc` | Telescope `git_commits` |
| `<leader>gb` | Telescope `git_branches` |

Gitsigns (buffer-local, active in any git-tracked file):

| Key | Action |
|---|---|
| `]h` / `[h` | Next/previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage whole buffer |
| `<leader>hR` | Reset whole buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff this file |
| `<leader>tb` | Toggle inline line-blame |

> **Note on `<leader>gf` vs `<leader>gh`**: these used to collide (both
> `remap.lua` and telescope wanted `<leader>gf`). Telescope's `git_files`
> kept the key since it's the more frequently used action; the Flog
> file-history bind moved to `<leader>gh`.

## Telescope

| Key | Action |
|---|---|
| `<leader>pf` | Find files |
| `<leader>ps` | Grep for a string (prompts for input) |

## Harpoon

| Key | Action |
|---|---|
| `<leader>a` | Add current file to harpoon list |
| `<C-e>` | Toggle harpoon quick menu |
| `<C-p>` | Jump to harpoon slot 1 — *moved from `<C-h>`, see note below* |
| `<C-t>` | Jump to harpoon slot 2 |
| `<C-n>` | Jump to harpoon slot 3 |
| `<C-s>` | Jump to harpoon slot 4 |

> **Note on `<C-p>`**: slot 1 used to be `<C-h>`, but that collided with
> window-left-nav and was silently winning, breaking `<C-h>` as a window
> nav key. Moved to `<C-p>` to fix it.

## Undotree

| Key | Action |
|---|---|
| `<leader>u` | Toggle undo tree |
