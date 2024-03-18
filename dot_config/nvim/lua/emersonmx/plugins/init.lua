local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/zen-mode.nvim",
    "mbbill/undotree",
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-abolish",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-unimpaired",

    require("emersonmx.plugins.autopairs"),
    require("emersonmx.plugins.cmp"),
    require("emersonmx.plugins.comment"),
    require("emersonmx.plugins.conform"),
    require("emersonmx.plugins.gitsigns"),
    require("emersonmx.plugins.lsp"),
    require("emersonmx.plugins.mini"),
    require("emersonmx.plugins.navigator"),
    require("emersonmx.plugins.onedark"),
    require("emersonmx.plugins.suda"),
    require("emersonmx.plugins.telescope"),
    require("emersonmx.plugins.todo_comments"),
    require("emersonmx.plugins.treesitter"),
    require("emersonmx.plugins.which_key"),
}, {
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
