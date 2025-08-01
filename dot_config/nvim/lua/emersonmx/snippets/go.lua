---@diagnostic disable: undefined-global

return {
    s("re", t("return ")),
    s("pkg", t("package ")),

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
        "for",
        fmt(
            [[
            for {} {{
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
    s("bk", t("break")),
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
    s(
        "ctor",
        fmt(
            [[
            func New{}({}) {}{} {{
                return {}{}{{{}}}
            }}
            ]],
            { i(1, "Object"), i(2), i(3, "*"), rep(1), i(4, "&"), rep(1), i(0) }
        )
    ),
    s(
        "tfn",
        fmt(
            [[
            func {}(t *testing.T) {{
                {}
            }}
            ]],
            { i(1, "TestFunc"), i(0) }
        )
    ),
    s(
        "trfn",
        fmt(
            [[
            t.Run("{}", func(t *testing.T) {{
                {}
            }})
            ]],
            { i(1, "a test"), i(0) }
        )
    ),
    s(
        "aif",
        fmt(
            [[
            got := {}
            want := {}

            if got != want {{
                t.Errorf("got {} want {}", got, want)
            }}
            ]],
            { i(1), i(2), i(3, "%q"), rep(3) }
        )
    ),
    s("o", fmt("{} := {}", { i(1), i(0) })),
    s("pr", fmt("fmt.Println({})", i(0))),
    s("prf", fmt("fmt.Printf({})", i(0))),
    s("fs", fmt("fmt.Sprintf({})", i(0))),
}
