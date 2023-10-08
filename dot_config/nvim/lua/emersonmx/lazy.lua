local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
    print("Installing lazy.nvim....")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print("Done.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("emersonmx.plugins")
-- require("lazy").setup({
--     "navarasu/onedark.nvim",
--     "nvim-tree/nvim-web-devicons",
--
--     "nvim-lua/plenary.nvim",
--
--     "tpope/vim-surround",
--     "tpope/vim-unimpaired",
--     {
--         "windwp/nvim-autopairs",
--         event = "InsertEnter",
--         opts = {}
--     },
--
--     "tpope/vim-repeat",
--     "tpope/vim-abolish",
--     "tpope/vim-eunuch",
--     "lambdalisue/suda.vim",
--
--     { "nvim-telescope/telescope.nvim", tag = "0.1.3" },
--     "tpope/vim-fugitive",
--     "lewis6991/gitsigns.nvim",
--     "mbbill/undotree",
--     "folke/zen-mode.nvim",
--     "numToStr/Navigator.nvim",
--
--     {
--         "nvim-treesitter/nvim-treesitter",
--         build = ":TSUpdate",
--     },
--
--     {
--         "VonHeikemen/lsp-zero.nvim",
--         branch = "v1.x",
--         dependencies = {
--             -- LSP Support
--             { "neovim/nvim-lspconfig" },
--             { "williamboman/mason.nvim" },
--             { "williamboman/mason-lspconfig.nvim" },
--             { "jose-elias-alvarez/null-ls.nvim" },
--
--             -- Autocompletion
--             { "hrsh7th/nvim-cmp" },
--             { "hrsh7th/cmp-nvim-lsp" },
--             { "hrsh7th/cmp-buffer" },
--             { "hrsh7th/cmp-path" },
--             { "saadparwaiz1/cmp_luasnip" },
--             { "hrsh7th/cmp-nvim-lua" },
--
--             -- Debug Support
--             { "mfussenegger/nvim-dap" },
--             { "rcarriga/nvim-dap-ui" },
--
--             -- Snippets
--             { "L3MON4D3/LuaSnip" },
--         }
--     },
-- })
