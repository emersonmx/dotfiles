---@diagnostic disable: undefined-global

return {
    s("none", t("None")),
    s("re", t("return ")),

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
        "wh",
        fmt(
            [[
            while {} {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s(
        "mc",
        fmt(
            [[
            match {} {{
                {}
            }}
            ]],
            { i(1), i(0) }
        )
    ),
    s("arm", fmt("{} => {}", { i(1), i(0) })),
    s("bk", t("break")),
    s(
        "st",
        fmt(
            [[
            struct {}
            ]],
            { i(1) }
        )
    ),
    s(
        "impl",
        fmt(
            [[
            impl {} {{
                {}
            }}
            ]],
            { i(1, "Type"), i(0) }
        )
    ),
    s("af", fmt("|{}| {}", { i(1), i(0) })),
    s(
        "fn",
        fmt(
            [[
            fn {}({}){} {{
                {}
            }}
            ]],
            { i(1, "func_name"), i(2), i(3), i(0) }
        )
    ),
    s(
        "ctor",
        fmt(
            [[
            fn {}({}) -> {} {{
                {} {{
                    {}
                }}
            }}
            ]],
            { i(1, "new"), i(2), rep(3), i(3, "Self"), i(0) }
        )
    ),

    s(
        "modtest",
        fmt(
            [[
            #[cfg(test)]
            mod tests {{
                {}
            }}
            ]],
            i(0)
        )
    ),
    s(
        "tfn",
        fmt(
            [[
            #[test]
            fn {}() {{
                {}
            }}
            ]],
            { i(1, "test_name"), i(0) }
        )
    ),
    s("test", t("#[test]")),
    s("derive", fmt("#[derive({})]", i(1, "Debug, PartialEq"))),
    s("at", fmt("#[{}]", i(1))),
    s("lf", fmt("'{}", i(1, "a"))),
    s("o", fmt("let {} = {}", { i(1), i(0) })),
    s(
        "pr",
        fmt(
            [[
            println!("{}", {})
            ]],
            { i(1), i(2) }
        )
    ),
    s(
        "fs",
        fmt(
            [[
            format!("{}", {})
            ]],
            { i(1), i(2) }
        )
    ),
}
