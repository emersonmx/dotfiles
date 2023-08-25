-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("navarasu/onedark.nvim")
    use("nvim-tree/nvim-web-devicons")

    use("nvim-lua/plenary.nvim")

    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    })
    use("tpope/vim-repeat")
    use("tpope/vim-abolish")
    use("tpope/vim-eunuch")
    use("lambdalisue/suda.vim")
    use("gpanders/editorconfig.nvim")

    use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")
    use("mbbill/undotree")
    use("folke/zen-mode.nvim")
    use("numToStr/Navigator.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true,
            })
            ts_update()
        end,
    })
    use("nvim-treesitter/playground")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Debug Support
            { "mfussenegger/nvim-dap" },
            { "rcarriga/nvim-dap-ui" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
        }
    })
end)
