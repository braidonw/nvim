vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use {
            'svrana/neosolarized.nvim',
            requires = { 'tjdevries/colorbuddy.nvim' },
            config = function()
                require('neosolarized').setup({ italic_comments = true })
            end
        }

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use "savq/melange-nvim"

        use "EdenEast/nightfox.nvim" -- Packer
        use({
            "rebelot/kanagawa.nvim",
            config = function()
                require('kanagawa').setup({
                    undercurl = true, -- enable undercurls
                    commentStyle = { italic = true },
                    functionStyle = {},
                    keywordStyle = { italic = true },
                    statementStyle = { bold = true },
                    typeStyle = {},
                    variablebuiltinStyle = { italic = true },
                    specialReturn = true, -- special highlight for the return keyword
                    specialException = true, -- special highlight for exception handling keywords
                    transparent = false, -- do not set background color
                    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                    globalStatus = false, -- adjust window separators highlight for laststatus=3
                    terminalColors = true, -- define vim.g.terminal_color_{0,17}
                    colors = {},
                    overrides = {},
                    theme = "default"
                })
            end
        })

        use({
            'sainnhe/sonokai',
        })
        use({
            'sainnhe/everforest',
        })
        use('sainnhe/gruvbox-material')
        use('cocopon/iceberg.vim')
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use({
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                require('rose-pine').setup({ disable_italics = true })
                vim.cmd('colorscheme rose-pine')
            end
        })

        use 'folke/tokyonight.nvim'
        use({
            "ellisonleao/gruvbox.nvim",
            config = function()
                require('gruvbox').setup({
                    bold = false,
                    italic = false
                })
            end
        })
        use({ "catppuccin/nvim", as = "catppuccin" })

        use('nvim-treesitter/playground')
        use 'theprimeagen/harpoon'
        use('mbbill/undotree')
        use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })
        use("tpope/vim-fugitive")

        -- lsp zero
        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }

        use({ "github/copilot.vim", branch = 'release' })
    end)
