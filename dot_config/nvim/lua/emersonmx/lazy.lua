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

require("lazy").setup("emersonmx.plugins", {
    install = {
        colorscheme = { "onedark" },
    },
    change_detection = {
        notify = false
    }
})
