---@diagnostic disable: undefined-global

return {
    s(
        "fn",
        fmt(
            [[
            func {}({}){} {{
                {}
            }}
            ]],
            { i(1, "funcName"), i(2), i(3), i(0) }
        )
    ),
    s(
        "m",
        fmt(
            [[
            func ({} {}) {}({}){} {{
                {}
            }}
            ]],
            {
                i(1, "receiver"),
                i(2, "type"),
                i(3, "methodName"),
                i(4),
                i(5),
                i(0),
            }
        )
    ),

    s("re", t("return")),

    s("pr", fmt("fmt.Println({})", i(0))),
    s("prf", fmt("fmt.Printf({})", i(0))),
    s("fs", fmt("fmt.Sprintf({})", i(0))),
}
