---@diagnostic disable: undefined-global

return {
    s("re", t("return")),
    s("pkg", t("package")),

    s(
        "if",
        fmt(
            [[
            if {} {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "sw",
        fmt(
            [[
            switch {} {{
            {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s("cs", fmt("case {}:", i(1))),
    s("df", t("default:")),
    s(
        "st",
        fmt(
            [[
            type {} struct {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "in",
        fmt(
            [[
            type {} interface {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "af",
        fmt(
            [[
            func({}){} {{
                {}
            }}
            ]],
            { i(1), i(2), i(0) }
        )
    ),
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

    s("o", fmt("{} := {}", { i(1), i(0) })),
    s("a", fmt("{} = {}", { i(1), i(0) })),
    s(
        "cb",
        fmt(
            [[
            {{
                {}
            }}
            ]],
            i(0)
        )
    ),
    s("pr", fmt("fmt.Println({})", i(0))),
    s("prf", fmt("fmt.Printf({})", i(0))),
    s("fs", fmt("fmt.Sprintf({})", i(0))),
}
