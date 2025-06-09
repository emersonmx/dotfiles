return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "mason-org/mason.nvim",
    },
    config = function()
        -- local dap = require("dap")
        local ui = require("dapui")

        ui.setup()
    end,
}
