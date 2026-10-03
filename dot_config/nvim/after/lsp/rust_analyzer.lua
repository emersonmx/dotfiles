return {
    settings = {
        ["rust-analyzer"] = {
            cargo = { features = "all" },
            check = { command = "clippy" },
            procMacro = {
                ignored = {
                    leptos_macro = {
                        "server",
                    },
                },
            },
        },
    },
}
