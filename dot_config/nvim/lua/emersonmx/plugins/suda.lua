return {
    "lambdalisue/suda.vim",
    config = function()
        vim.keymap.set("c", "w!!", "w suda://%", {})
    end,
}
