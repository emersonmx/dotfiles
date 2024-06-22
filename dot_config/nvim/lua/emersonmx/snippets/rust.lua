---@diagnostic disable: undefined-global

return {
    s("derive", fmt("#[derive({})]", i(1, "Clone, Debug, Default"))),
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

    s("arm", fmt("{} => {}", { i(1), i(0) })),

    s("self", t("Self")),
    s("re", t("return")),

    s("option", fmt("Option<{}>", i(1))),
    s("some", fmt("Some({})", i(1))),
    s("none", t("None")),

    s("result", fmt("Result<{}, {}>", { i(1, "T"), i(2, "E") })),
    s("ok", fmt("Ok({})", i(1))),
    s("err", fmt("Err({})", i(1))),

    s("pr", fmt("println!({})", i(1))),
    s("fs", fmt("format!({})", i(1))),

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
    s("test", t("#[test]")),
}
