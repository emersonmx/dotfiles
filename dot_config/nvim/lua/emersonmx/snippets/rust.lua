---@diagnostic disable: undefined-global

return {
    s("option", fmt("Option<{}>", i(1))),
    s("some", fmt("Some({})", i(1))),
    s("none", t("None")),
    s("result", fmt("Result<{}, {}>", { i(1, "T"), i(2, "E") })),
    s("ok", fmt("Ok({})", i(1))),
    s("err", fmt("Err({})", i(1))),
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
            struct {} {{
                {}
            }}
            ]],
            { i(1), i(0) }
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
    s("derive", fmt("#[derive({})]", i(1, "Debug, Clone, Default, PartialEq"))),
    s("at", fmt("#[{}]", i(1))),
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
