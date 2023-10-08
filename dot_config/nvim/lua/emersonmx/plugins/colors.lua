return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        local theme = require("onedark")
        theme.setup({
            style = "darker"
        })
        theme.load()
    end,
}
