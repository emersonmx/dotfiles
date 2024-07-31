---@diagnostic disable: undefined-global

return {
    s(
        "cb",
        fmt(
            [[
            ```{}
            {}
            ```
            ]],
            { i(1, "sh"), i(0) }
        )
    ),
    s("link", fmt("[{}]({})", { i(1, "text"), i(2, "url") })),
    s("img", fmt("![{}]({})", { i(1, "alt text"), i(2, "url") })),
}
