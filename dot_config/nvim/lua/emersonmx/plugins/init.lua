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
    "nvim-tree/nvim-web-devicons",

    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    "tpope/vim-abolish",
    "tpope/vim-eunuch",

    "tpope/vim-fugitive",

    "mbbill/undotree",
    "folke/zen-mode.nvim",

    require("emersonmx.plugins.comment"),
    require("emersonmx.plugins.autopairs"),
    require("emersonmx.plugins.gitsigns"),
    require("emersonmx.plugins.onedark"),
    require("emersonmx.plugins.which_key"),
    require("emersonmx.plugins.suda"),
    require("emersonmx.plugins.navigator"),
    require("emersonmx.plugins.telescope"),
    require("emersonmx.plugins.lsp"),
    require("emersonmx.plugins.conform"),
    require("emersonmx.plugins.cmp"),
    require("emersonmx.plugins.todo_comments"),
    require("emersonmx.plugins.mini"),
    require("emersonmx.plugins.treesitter"),
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
