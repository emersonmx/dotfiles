vim.opt.modeline = false

-- Some launchers strip TMUX and TMUX_PANE from the editor's environment.
-- Recover them from the nearest ancestor process that still has them, so
-- tmux-aware plugins keep working.
if not vim.env.TMUX then
    ---@type number?
    local pid = vim.uv.os_getppid()
    while pid and pid > 1 do
        local environ_file = io.open("/proc/" .. pid .. "/environ", "rb")
        if not environ_file then
            break
        end
        local environ = "\0" .. environ_file:read("*a")
        environ_file:close()
        local tmux = environ:match("%zTMUX=([^%z]+)")
        if tmux then
            vim.env.TMUX = tmux
            vim.env.TMUX_PANE = environ:match("%zTMUX_PANE=([^%z]+)")
            break
        end
        local stat_file = io.open("/proc/" .. pid .. "/stat", "r")
        if not stat_file then
            break
        end
        local stat = stat_file:read("*a")
        stat_file:close()
        pid = tonumber(stat:match("%)%s+%S+%s+(%d+)"))
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    spec = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
        "tpope/vim-abolish",

        { import = "emersonmx/plugins" },
    },

    install = { colorscheme = { "habamax" } },

    change_detection = {
        notify = false,
    },

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
