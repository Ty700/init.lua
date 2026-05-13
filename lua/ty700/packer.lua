vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        run = ':TSUpdate'
    }

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'
    use 'rbong/vim-flog' -- Git graph (requires fugitive)
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup({
                width = 180,
                height = 30,
                border = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' },
                default_mappings = true, -- Enable default mappings
                opacity = nil,
                resizing_mappings = false,
                post_open_hook = function(buf, win)
                    vim.keymap.set('n', '<CR>', function()
                        require('goto-preview').goto_preview_definition()
                        require('goto-preview').close_all_win()
                    end, { buffer = buf })
                end,
                references = {
                    telescope = require("telescope.builtin").lsp_references,
                },
                focus_on_open = true,    -- Auto-focus the preview window
                dismiss_on_move = false, -- Don't close when cursor moves
                force_close = true,
                bufhidden = "wipe",
            })
        end
    }


    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Copilot
    use 'github/copilot.vim'

    -- Colorscheme
    use 'loctvl842/monokai-pro.nvim'
end)
